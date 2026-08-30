testthat::test_that("ros_actions_check_cron() instala la comprobación cron", {
  pkg <- withr::local_tempdir()

  testthat::expect_message(
    result <- withVisible(ros_actions_check_cron(pkg)),
    "\u00a1Proceso completado!"
  )

  testthat::expect_equal(result, list(value = NULL, visible = FALSE))
  expect_installed_workflow(pkg, "roscron-check-standard.yaml")
})

testthat::test_that("ros_actions_check_cron() conserva un flujo existente", {
  pkg <- withr::local_tempdir()
  workflow <- "roscron-check-standard.yaml"
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)

  testthat::expect_message(ros_actions_check_cron(pkg))
  writeLines("custom workflow", workflow_path)

  testthat::expect_message(
    result <- withVisible(ros_actions_check_cron(pkg, overwrite = FALSE)),
    "Archivo no actualizado."
  )

  testthat::expect_equal(result, list(value = NULL, visible = FALSE))
  testthat::expect_equal(readLines(workflow_path), "custom workflow")
})
