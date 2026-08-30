testthat::test_that("ros_actions_pkgdown_docs() instala el flujo para docs", {
  pkg <- withr::local_tempdir()

  testthat::expect_message(
    result <- withVisible(ros_actions_pkgdown_docs(pkg)),
    "\u00a1Proceso completado!"
  )

  testthat::expect_equal(result, list(value = NULL, visible = FALSE))
  expect_installed_workflow(pkg, "rostemplate-docs.yaml")
})

testthat::test_that("ros_actions_pkgdown_docs() conserva un flujo existente", {
  pkg <- withr::local_tempdir()
  workflow <- "rostemplate-docs.yaml"
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)

  testthat::expect_message(ros_actions_pkgdown_docs(pkg))
  writeLines("custom workflow", workflow_path)

  testthat::expect_message(
    result <- withVisible(ros_actions_pkgdown_docs(pkg, overwrite = FALSE)),
    "Archivo no actualizado."
  )

  testthat::expect_equal(result, list(value = NULL, visible = FALSE))
  testthat::expect_equal(readLines(workflow_path), "custom workflow")
})
