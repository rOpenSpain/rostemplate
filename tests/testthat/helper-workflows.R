expect_installed_workflow <- function(pkg, workflow) {
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)
  packaged_workflow <- system.file(
    "yaml",
    workflow,
    package = "rostemplate",
    mustWork = TRUE
  )

  testthat::expect_true(file.exists(workflow_path))
  testthat::expect_gt(file.size(workflow_path), 0)
  testthat::expect_equal(
    readLines(workflow_path),
    readLines(packaged_workflow)
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
  testthat::expect_setequal(
    readLines(file.path(pkg, ".github", ".gitignore")),
    c("*.html", "R-version", "depends.Rds")
  )
}
