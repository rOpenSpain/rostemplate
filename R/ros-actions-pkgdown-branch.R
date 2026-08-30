#' Crea un sitio en `gh-pages` mediante GitHub Actions
#'
#' Instala un flujo de trabajo de GitHub Actions que genera el sitio
#' \CRANpkg{pkgdown} del paquete en la rama `gh-pages` del repositorio.
#'
#' @inheritParams ros_actions_pkgdown_docs pkg overwrite
#'
#' @inherit ros_actions_pkgdown_docs return
#'
#' @family pkgdown
#' @family github_actions
#'
#' @export
#' @encoding UTF-8
#'
#' @examples
#' pkg <- file.path(tempdir(), "pkgdown-branch")
#' if (!dir.exists(pkg)) {
#'   dir.create(pkg)
#' }
#' ros_actions_pkgdown_branch(pkg)
ros_actions_pkgdown_branch <- function(pkg = ".", overwrite = TRUE) {
  # Comprueba que el directorio del flujo de trabajo exista.

  destdir <- file.path(pkg, ".github", "workflows")
  checkdir <- dir.exists(destdir)
  if (isFALSE(checkdir)) {
    dir.create(destdir, recursive = TRUE)
  }

  # Comprueba que .Rbuildignore exista.

  rbuildig <- file.path(pkg, ".Rbuildignore")
  if (!file.exists(rbuildig)) {
    file.create(rbuildig)
  }

  # Añade las rutas de pkgdown a .Rbuildignore.
  usethis::write_union(
    rbuildig,
    c(
      "^docs$",
      "^_pkgdown\\.yml$",
      "^_pkgdown\\.yaml$",
      "^\\.github$",
      "^pkgdown$"
    )
  )
  # Comprueba que el archivo .gitignore del flujo de trabajo exista.
  gitignore <- file.path(pkg, ".github", ".gitignore")
  if (!file.exists(gitignore)) {
    file.create(gitignore)
  }
  usethis::write_union(gitignore, c("*.html", "R-version", "depends.Rds"))

  # Localiza la plantilla del flujo de trabajo.
  filepath <- system.file(
    "yaml/rostemplate-gh-pages.yaml",
    package = "rostemplate"
  )

  # Copia la plantilla del flujo de trabajo.
  result <- file.copy(filepath, destdir, overwrite = overwrite)
  if (result) {
    cli::cli_alert_success("\u00a1Proceso completado!")
  } else {
    cli::cli_alert_warning("Archivo no actualizado.")
  }

  invisible()
}
