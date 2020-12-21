# import stuffs
#' @importFrom utils menu
NULL

#' @title Build your pkgdown website
#' @name ros_build
#' @description A wrapper of \link[pkgdown]{build_site}
#' @export
#'
#' @param pkg,... See \link[pkgdown]{build_site}.
ros_build <-  function(pkg = ".", ...) {
  sel <-
    menu(c("Yes", "No"),
         title = "Have you included \n\ntemplate:\n  package: rostemplate\n\nin your _pkgdown.yml file?")
  if (sel != 1) {
    stop("Execution halted")
  }

  pkgdown::build_site(pkg = ".", ...)
  return(invisible())
}
