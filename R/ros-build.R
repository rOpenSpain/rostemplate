#' Genera tu sitio \CRANpkg{pkgdown} en local
#'
#' Esta función envuelve [pkgdown::build_site()].
#'
#' @details
#' La única diferencia con [pkgdown::build_site()] es que te recuerda los pasos
#' a seguir para configurar `rostemplate` y pide confirmación antes de
#' ejecutar [pkgdown::build_site()]. El resultado se genera en la carpeta
#' `/docs`.
#'
#' A diferencia de [ros_actions_pkgdown_branch()], este proceso se ejecuta de
#' forma local.
#'
#' @inheritParams ros_actions_pkgdown_docs pkg
#' @param ... Argumentos adicionales que se pasan a [pkgdown::build_site()].
#'
#' @inherit ros_actions_pkgdown_docs return
#'
#' @seealso [pkgdown::build_site()].
#'
#' @family pkgdown
#'
#' @export
#' @encoding UTF-8
#'
#' @examplesIf interactive()
#' ros_build()
ros_build <- function(pkg = ".", ...) {
  # nocov start
  # Comprueba que .Rbuildignore exista.

  rbuildignore <- file.path(pkg, ".Rbuildignore")
  if (!file.exists(rbuildignore)) {
    file.create(rbuildignore)
  }

  # Añade las rutas de pkgdown a .Rbuildignore.
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

  sel <- menu(
    c("Sí", "No"),
    title = paste0(
      "¿Has incluido \n\ntemplate:\n  bootstrap: 5\n  package: ",
      "rostemplate\n\nen el archivo _pkgdown.yml?"
    )
  )
  if (sel != 1) {
    cli::cli_abort("Ejecuci\u00f3n detenida.", call = NULL)
  }

  ros_pkgdown_build_site(pkg = pkg, ...)
  invisible()
  # nocov end
}

ros_pkgdown_build_site <- function(pkg = ".", ...) {
  pkgdown::build_site(pkg = pkg, ...)
}
