#' @title Create a GitHub action that checks regularly your package
#' @name ros_gh_actions_croncheck
#' @description The GitHub action created would run R CMD check on your package.
#' The setup includes a regular check to be run monthly the first day of the
#' month at 08:30 AM.
#' @details Please see \url{https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#schedule}
#' to learn how cron works.
#'
#' The default configuration is  \code{'30 08 1 * *'}
#' ("At 08:30 on day-of-month 1.").
#'
#' Use \href{https://crontab.guru/#30_08_1_*_*}{crontab.guru} to check and
#' create your own cron tag.
#' @source \url{https://github.com/r-lib/actions/blob/master/.github/workflows/check-standard.yaml}
#' @export
#'
#' @param pkg Path to package.
#' @param overwrite Overwrite the action if it was already present.
ros_gh_actions_croncheck <-
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
      system.file("yaml/roscron-check-standard.yaml", package = "rostemplate")

    # Copy
    result <- file.copy(filepath, destdir, overwrite = overwrite)
    if (result) {
      message("Success!")
    } else {
      message("File not updated")
    }

    return(invisible())
  }
