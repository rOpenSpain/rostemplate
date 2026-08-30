expect_installed_workflow <- function(pkg, workflow) {
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)
  packaged_workflow <- system.file(
    "yaml",
    workflow,
    package = "rostemplate",
    mustWork = TRUE
  )
  workflow_text <- paste(readLines(packaged_workflow), collapse = "\n")
  workflow_config <- yaml::read_yaml(packaged_workflow)

  testthat::expect_true(file.exists(workflow_path))
  testthat::expect_gt(file.size(workflow_path), 0)
  testthat::expect_equal(
    readLines(workflow_path),
    readLines(packaged_workflow)
  )
  testthat::expect_match(workflow_text, "(?m)^on:$", perl = TRUE)
  testthat::expect_match(workflow_text, "(?m)^jobs:$", perl = TRUE)
  testthat::expect_match(workflow_text, "actions/checkout@v7", fixed = TRUE)
  testthat::expect_match(
    workflow_text,
    "r-lib/actions/setup-r@v2",
    fixed = TRUE
  )
  testthat::expect_type(workflow_config$jobs, "list")
  testthat::expect_gt(length(workflow_config$jobs), 0)
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
