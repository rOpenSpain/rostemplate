#' Instala un workflow de GitHub Actions que genera tu sitio en `gh-pages`
#'
#' Instala un workflow de GitHub Actions que crea el sitio \CRANpkg{pkgdown}
#' de tu paquete en la rama `gh-pages` de tu repositorio.
#'
#' @inheritParams ros_actions_pkgdown_docs
#'
#' @returns Se llama por sus efectos secundarios y devuelve `NULL` de forma
#'   invisible.
#'
#' @family pkgdown
#'
#' @export
#' @encoding UTF-8
#'
#' @examples
#' pkg <- file.path(tempdir(), "pkgdown-branch")
#' if (!dir.exists(pkg)) {
#'   dir.create(pkg)
#' }
#' ros_actions_pkgdown_branch(pkg)
ros_actions_pkgdown_branch <- function(pkg = ".", overwrite = TRUE) {
  # Ensure the workflow directory exists.

  destdir <- file.path(pkg, ".github", "workflows")
  checkdir <- dir.exists(destdir)
  if (isFALSE(checkdir)) {
    dir.create(destdir, recursive = TRUE)
  }

  # Ensure .Rbuildignore exists.

  rbuildig <- file.path(pkg, ".Rbuildignore")
  if (!file.exists(rbuildig)) {
    file.create(rbuildig)
  }

  # Add pkgdown paths to .Rbuildignore.
  usethis::write_union(
    rbuildig,
    c(
      "^docs$",
      "^_pkgdown\\.yml$",
      "^_pkgdown\\.yaml$",
      "^\\.github$",
      "^pkgdown$"
    )
  )
  # Ensure the workflow .gitignore exists.
  gitignore <- file.path(pkg, ".github", ".gitignore")
  if (!file.exists(gitignore)) {
    file.create(gitignore)
  }
  usethis::write_union(gitignore, c("*.html", "R-version", "depends.Rds"))

  # Locate the workflow template.
  filepath <- system.file(
    "yaml/rostemplate-gh-pages.yaml",
    package = "rostemplate"
  )

  # Copy the workflow template.
  result <- file.copy(filepath, destdir, overwrite = overwrite)
  if (result) {
    message("Success!")
  } else {
    message("File not updated")
  }

  invisible()
}
