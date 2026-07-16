expect_workflow_install <- function(pkg, workflow) {
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)

  expect_true(file.exists(workflow_path))
  expect_gt(file.size(workflow_path), 0)
  expect_setequal(
    readLines(file.path(pkg, ".Rbuildignore")),
    c(
      "^docs$",
      "^_pkgdown\\.yml$",
      "^_pkgdown\\.yaml$",
      "^\\.github$",
      "^pkgdown$"
    )
  )
  expect_setequal(
    readLines(file.path(pkg, ".github", ".gitignore")),
    c("*.html", "R-version", "depends.Rds")
  )
}

expect_workflow_preserve <- function(fun, workflow) {
  pkg <- withr::local_tempdir()
  workflow_path <- file.path(pkg, ".github", "workflows", workflow)

  fun(pkg)
  writeLines("custom workflow", workflow_path)

  expect_message(fun(pkg, overwrite = FALSE), "File not updated")
  expect_equal(readLines(workflow_path), "custom workflow")
}
