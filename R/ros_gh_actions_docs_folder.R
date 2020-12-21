#' @title Create a GitHub action that deploys on \code{/docs} folder
#' @name ros_gh_actions_docs_folder
#' @description The GitHub action created would build a \code{pkgdown} of
#' your package in the \code{docs} folder of your repo.
#' @details The final result is the same than using \link{ros_build}, with
#' the difference that with this action the build is performed by GitHub
#' actions.
#' @seealso \link{ros_build}
#' @export
#'
#' @param pkg Path to package.
#' @param overwrite Overwrite the action if it was already present.
ros_gh_actions_docs_folder <-
  function(pkg = ".", overwrite = TRUE) {
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
    newlines <-
      unique(c(lines, "*.html", "R-version", "depends.Rds"))
    newlines <- newlines[newlines != ""]
    writeLines(newlines, gitignore)

    # Get action file
    filepath <-
      system.file("yaml/rostemplate-docs.yaml", package = "rostemplate")

    # Copy
    result <- file.copy(filepath, destdir, overwrite = overwrite)
    if (result) {
      message("Success!")
    } else {
      message("File not updated")
    }

    return(invisible())
  }
