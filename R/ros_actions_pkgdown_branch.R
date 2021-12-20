#' Instala una acción GitHub que genera tu sitio en la rama `gh-pages`
#'
#' @description
#'
#' Instala una acción GitHub que crea el sitio `pkgdown` de tu paquete en la
#' rama `gh-pages` de tu repositorio.
#'
#' @seealso [ros_build()], [ros_actions_pkgdown_docs()]
#' @export
#'
#' @inheritParams ros_actions_pkgdown_docs
#'
ros_actions_pkgdown_branch <- function(pkg = ".", overwrite = TRUE) {
  # Check destdir

  destdir <- file.path(pkg, ".github", "workflows")
  checkdir <- dir.exists(destdir)
  if (isFALSE(checkdir)) {
    dir.create(destdir, recursive = TRUE)
  }

  # Check .Rbuildignore

  Rbuildignore <- file.path(pkg, ".Rbuildignore")
  if (!file.exists(Rbuildignore)) {
    file.create(Rbuildignore)
  }

  # Add lines to Rbuildignore
  linesRbuild <- readLines(Rbuildignore)
  newlinesRbuild <-
    unique(c(linesRbuild, "^\\.github$", "^docs$", "^_pkgdown\\.yml$"))
  newlinesRbuild <- newlinesRbuild[newlinesRbuild != ""]
  writeLines(newlinesRbuild, Rbuildignore)

  # Check gitignore

  gitignore <- file.path(pkg, ".github", ".gitignore")
  if (!file.exists(gitignore)) {
    file.create(gitignore)
  }

  # Add lines to gitignore
  lines <- readLines(gitignore)
  newlines <- unique(c(lines, "*.html", "R-version", "depends.Rds"))
  newlines <- newlines[newlines != ""]
  writeLines(newlines, gitignore)

  # Get action file
  filepath <-
    system.file("yaml/rostemplate-gh-pages.yaml", package = "rostemplate")

  # Copy
  result <- file.copy(filepath, destdir, overwrite = overwrite)
  if (result) {
    message("Success!")
  } else {
    message("File not updated")
  }

  return(invisible())
}
