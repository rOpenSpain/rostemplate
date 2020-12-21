#' @title Create a github action that deploys on \code{gh-pages} branch
#' @name ros_gh_branch
#' @description The github action created would build a \code{pkgdown} of
#' your package in the \code{gh-pages} branch of your repo.
#' @export
#'
#' @param pkg Path to package.
#' @param overwrite Overwrite the action if it was already present.
ros_gh_branch <-  function(pkg = ".", overwrite = TRUE) {
  filepath <-
    system.file("yaml/rostemplate-gh-pages.yaml", package = "rostemplate")

  # Check destdir

  destdir <- paste0(pkg, "/.github/workflows")
  checkdir <- dir.exists(destdir)
  if (isFALSE(checkdir)) {
    dir.create(destdir, recursive = TRUE)
  }

  a <- file.copy(filepath, destdir, overwrite = overwrite)
  if(a){
    message("Success!")
  } else {
    message("File not copied/updated")
  }

  return(invisible())
}
