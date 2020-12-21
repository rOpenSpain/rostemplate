# import stuffs
#' @importFrom utils menu
NULL

#' @title Build your pkgdown website locally
#' @name ros_build
#' @description A wrapper of \code{pkgdown::build_site}
#' @details This function would ask for confirmation to check your
#' \code{_pkgdown.yml} file and would create your pkgdown site on the /docs
#' folder.
#'
#' Unlike \link{ros_gh_actions_branch}, the user would trigger the build and
#' it is possible to control it via the parameters of
#' \code{pkgdown::build_site}.
#'
#' @seealso \code{\link{ros_gh_actions_branch}}, \code{\link[pkgdown]{build_site}}
#' @export
#'
#' @param pkg,... See \code{?pkgdown::build_site}.
ros_build <-  function(pkg = ".", ...) {

  # Check .Rbuildignore

  Rbuildignore <- file.path(pkg, ".Rbuildignore")
  if (!file.exists(Rbuildignore)) {
    file.create(Rbuildignore)
  }

  # Add lines to gitignore
  linesRbuild <- readLines(Rbuildignore)
  newlinesRbuild <-
    unique(c(linesRbuild, "^\\.github$", "^docs$", "^_pkgdown\\.yml$"))
  newlinesRbuild <- newlinesRbuild[newlinesRbuild != ""]
  writeLines(newlinesRbuild, Rbuildignore)

  # nocov start
  sel <-
    menu(c("Yes", "No"),
         title = "Have you included \n\ntemplate:\n  package: rostemplate\n\nin your _pkgdown.yml file?")
  if (sel != 1) {
    stop("Execution halted")
  }

  pkgdown::build_site(pkg = ".", ...)
  return(invisible())
  # nocov end
}
