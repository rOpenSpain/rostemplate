#' @title Create a GitHub action that deploys on \code{gh-pages} branch
#' @name ros_gh_actions_branch
#' @description The GitHub action created would build a \code{pkgdown} of
#' your package in the \code{gh-pages} branch of your repo.
#' @export
#'
#' @param pkg Path to package.
#' @param overwrite Overwrite the action if it was already present.
ros_gh_actions_branch <-  function(pkg = ".", overwrite = TRUE) {
  # Check destdir

  destdir <- file.path(pkg, ".github", "workflows")
  checkdir <- dir.exists(destdir)
  if (isFALSE(checkdir)) {
    dir.create(destdir, recursive = TRUE)
  }

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
