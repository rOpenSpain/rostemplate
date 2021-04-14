#' Build your pkgdown website locally
#'
#' A wrapper of [`pkgdown::build_site()`]
#'
#' @details
#' This function would ask for confirmation to check your `_pkgdown.yml` file
#' and would create your pkgdown site on the `docs/` folder.
#'
#' Unlike [ros_gh_actions_branch()], the user would trigger the build and
#' it is possible to control it via the parameters of
#' [pkgdown::build_site()].
#'
#' @seealso [ros_gh_actions_branch()], [`pkgdown::build_site()`]
#'
#' @export
#'
#' @inheritParams pkgdown::build_site
#'
#' @inheritDotParams pkgdown::build_site
#'
#'
#'
ros_build <- function(pkg = ".", ...) {

  # nocov start
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

  sel <-
    menu(c("Yes", "No"),
      title = "Have you included \n\ntemplate:\n  package: rostemplate\n\nin your _pkgdown.yml file?"
    )
  if (sel != 1) {
    stop("Execution halted")
  }

  pkgdown::build_site(pkg = ".", ...)
  return(invisible())
  # nocov end
}
