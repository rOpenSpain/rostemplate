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
#' Al contrario que [ros_actions_pkgdown_branch()], este workflow se ejecuta
#' localmente.
#'
#' @inheritParams pkgdown::build_site
#'
#' @inheritDotParams pkgdown::build_site
#'
#' @returns Se llama por sus efectos secundarios y devuelve `NULL` de forma
#'   invisible.
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
  # Ensure .Rbuildignore exists.

  rbuildignore <- file.path(pkg, ".Rbuildignore")
  if (!file.exists(rbuildignore)) {
    file.create(rbuildignore)
  }

  # Add pkgdown paths to .Rbuildignore.
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
    c("Yes", "No"),
    title = paste0(
      "Have you included \n\ntemplate:\n  bootstrap: 5\n  package: ",
      "rostemplate\n\nin your _pkgdown.yml file?"
    )
  )
  if (sel != 1) {
    stop("Execution halted")
  }

  ros_pkgdown_build_site(pkg = pkg, ...)
  invisible()
  # nocov end
}

ros_pkgdown_build_site <- function(pkg = ".", ...) {
  pkgdown::build_site(pkg = pkg, ...)
}
