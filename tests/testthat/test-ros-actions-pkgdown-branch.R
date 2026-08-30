testthat::test_that("ros_actions_pkgdown_branch() instala el flujo gh-pages", {
  pkg <- withr::local_tempdir()

  testthat::expect_message(
    result <- withVisible(ros_actions_pkgdown_branch(pkg)),
    "\u00a1Proceso completado!"
  )

  testthat::expect_equal(result, list(value = NULL, visible = FALSE))
  expect_installed_workflow(pkg, "rostemplate-gh-pages.yaml")
})

testthat::test_that("ros_actions_pkgdown_branch() respeta overwrite = FALSE", {
  pkg <- withr::local_tempdir()
  workflow <- "rostemplate-gh-pages.yaml"
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)

  testthat::expect_message(ros_actions_pkgdown_branch(pkg))
  writeLines("custom workflow", workflow_path)

  testthat::expect_message(
    result <- withVisible(
      ros_actions_pkgdown_branch(pkg, overwrite = FALSE)
    ),
    "Archivo no actualizado."
  )

  testthat::expect_equal(result, list(value = NULL, visible = FALSE))
  testthat::expect_equal(readLines(workflow_path), "custom workflow")
})
