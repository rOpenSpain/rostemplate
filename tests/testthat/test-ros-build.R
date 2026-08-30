testthat::test_that("ros_build() reenvía la ruta y los argumentos a pkgdown", {
  pkg <- withr::local_tempdir()
  called <- NULL

  testthat::local_mocked_bindings(
    menu = \(...) 1,
    ros_pkgdown_build_site = function(pkg = ".", ...) {
      called <<- list(pkg = pkg, dots = list(...))
      invisible()
    }
  )

  result <- suppressMessages(withVisible(ros_build(pkg, preview = TRUE)))

  testthat::expect_equal(result, list(value = NULL, visible = FALSE))
  testthat::expect_equal(
    called,
    list(pkg = pkg, dots = list(preview = TRUE))
  )
  testthat::expect_setequal(
    readLines(file.path(pkg, ".Rbuildignore")),
    c(
      "^docs$",
      "^_pkgdown\\.yml$",
      "^_pkgdown\\.yaml$",
      "^\\.github$",
      "^pkgdown$"
    )
  )
})

testthat::test_that("ros_build() se detiene sin confirmación", {
  pkg <- withr::local_tempdir()

  testthat::local_mocked_bindings(menu = \(...) 2)

  testthat::expect_snapshot(
    error = TRUE,
    suppressMessages(ros_build(pkg))
  )
})
