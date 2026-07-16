testthat::test_that("workflow installers copy packaged yaml files", {
  pkg_branch <- withr::local_tempdir()
  testthat::expect_message(ros_actions_pkgdown_branch(pkg_branch), "Success!")
  expect_workflow_install(pkg_branch, "rostemplate-gh-pages.yaml")

  pkg_docs <- withr::local_tempdir()
  testthat::expect_message(ros_actions_pkgdown_docs(pkg_docs), "Success!")
  expect_workflow_install(pkg_docs, "rostemplate-docs.yaml")

  pkg_cron <- withr::local_tempdir()
  testthat::expect_message(ros_actions_check_cron(pkg_cron), "Success!")
  expect_workflow_install(pkg_cron, "roscron-check-standard.yaml")
})

testthat::test_that("workflow installers preserve existing files", {
  expect_workflow_preserve(
    ros_actions_pkgdown_branch,
    "rostemplate-gh-pages.yaml"
  )
  expect_workflow_preserve(
    ros_actions_pkgdown_docs,
    "rostemplate-docs.yaml"
  )
  expect_workflow_preserve(
    ros_actions_check_cron,
    "roscron-check-standard.yaml"
  )
})

testthat::test_that("ros_build passes pkg to pkgdown", {
  pkg <- withr::local_tempdir()
  called_pkg <- NULL

  testthat::local_mocked_bindings(
    menu = function(...) 1,
    ros_pkgdown_build_site = function(pkg = ".", ...) {
      called_pkg <<- pkg
      invisible()
    }
  )

  testthat::expect_message(ros_build(pkg))
  testthat::expect_equal(called_pkg, pkg)
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

testthat::test_that("ros_badge_ropenspain can print markdown", {
  testthat::expect_message(ros_badge_ropenspain(install = FALSE))
})
