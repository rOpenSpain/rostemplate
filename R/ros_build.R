#' Genera tu sitio \CRANpkg{pkgdown} en local
#'
#' Esta función es un wrapper de [pkgdown::build_site()].
#'
#' @details
#' La única diferencia con [pkgdown::build_site()] es que te recuerda los pasos
#' a seguir para configurar `rostemplate`, y pide confirmación antes de
#' ejecutar [pkgdown::build_site()]. El resultado se genera en la carpeta
#' `/docs`.
#'
#' Al contrario que [ros_actions_pkgdown_branch()], esta acción se ejecuta por
#' el usuario.
#'
#' @seealso [ros_actions_pkgdown_branch()], [pkgdown::build_site()].
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

  rbuildignore <- file.path(pkg, ".Rbuildignore")
  if (!file.exists(rbuildignore)) {
    file.create(rbuildignore)
  }

  # Add lines to Rbuildignore
  usethis::write_union(
    rbuildignore,
    c(
      "^docs$",
      "^_pkgdown\\.yml$",
      "^_pkgdown\\.yaml$",
      "^\\.github$",
      "^pkgdown$"
    )
  )

  sel <-
    menu(
      c("Yes", "No"),
      title = paste0(
        "Have you included \n\ntemplate:\n  bootstrap: 5\n  package: ",
        "rostemplate\n\nin your _pkgdown.yml file?"
      )
    )
  if (sel != 1) {
    stop("Execution halted")
  }

  pkgdown::build_site(pkg = ".", ...)
  return(invisible())
  # nocov end
}
