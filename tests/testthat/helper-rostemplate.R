expect_workflow_install <- function(pkg, workflow) {
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)

  testthat::expect_true(file.exists(workflow_path))
  testthat::expect_gt(file.size(workflow_path), 0)
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
  testthat::expect_setequal(
    readLines(file.path(pkg, ".github", ".gitignore")),
    c("*.html", "R-version", "depends.Rds")
  )
}

expect_workflow_preserve <- function(fun, workflow) {
  pkg <- withr::local_tempdir()
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)

  fun(pkg)
  writeLines("custom workflow", workflow_path)

  testthat::expect_message(fun(pkg, overwrite = FALSE), "File not updated")
  testthat::expect_equal(readLines(workflow_path), "custom workflow")
}
