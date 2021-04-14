#' Creates a GitHub action that deploys on `gh-pages` branch
#'
#' @description
#'
#' The GitHub action created would build a `pkgdown` of
#' your package in the `gh-pages` branch of your repo.
#'
#' #' @seealso [ros_build()], [ros_gh_actions_docs_folder()]
#' @export
#'
#' @inheritParams ros_gh_actions_docs_folder
#'
ros_gh_actions_branch <- function(pkg = ".", overwrite = TRUE) {
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
