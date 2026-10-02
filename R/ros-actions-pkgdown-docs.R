#' Crea un sitio en `/docs` mediante GitHub Actions
#'
#' Instala un flujo de trabajo de GitHub Actions que genera el sitio
#' \CRANpkg{pkgdown} del paquete en la carpeta `docs` del repositorio.
#'
#' @details
#' El resultado final es equivalente a ejecutar [ros_build()], pero este comando
#' se ejecuta en GitHub, no localmente.
#'
#' Para publicar el sitio en la rama `gh-pages` en lugar de la carpeta `docs`,
#' usa [ros_actions_pkgdown_branch()].
#'
#' @param pkg Ruta a la raíz del paquete.
#' @param overwrite Sobrescribe el flujo de trabajo si ya está instalado.
#'
#' @returns Devuelve [NULL][base::NULL] de forma invisible. Se llama por sus
#'   efectos secundarios.
#'
#' @section Generación del sitio:
#' Usa [ros_build()] para generar el sitio de forma local. Consulta
#' [pkgdown::build_site()] para las opciones de generación.
#'
#' @family github_actions
#' @family pkgdown
#'
#' @export
#' @encoding UTF-8
#'
#' @examples
#' pkg <- file.path(tempdir(), "pkgdown-docs")
#' if (!dir.exists(pkg)) {
#'   dir.create(pkg)
#' }
#' ros_actions_pkgdown_docs(pkg)
ros_actions_pkgdown_docs <- function(pkg = ".", overwrite = TRUE) {
  # Comprueba que el directorio del flujo de trabajo exista.

  destdir <- file.path(pkg, ".github", "workflows")
  checkdir <- dir.exists(destdir)
  if (isFALSE(checkdir)) {
    dir.create(destdir, recursive = TRUE)
  }

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

  # Comprueba que el archivo .gitignore del flujo de trabajo exista.
  gitignore <- file.path(pkg, ".github", ".gitignore")
  if (!file.exists(gitignore)) {
    file.create(gitignore)
  }
  usethis::write_union(gitignore, c("*.html", "R-version", "depends.Rds"))

  # Localiza la plantilla del flujo de trabajo.
  filepath <- system.file("yaml/rostemplate-docs.yaml", package = "rostemplate")

  # Copia la plantilla del flujo de trabajo.
  result <- file.copy(filepath, destdir, overwrite = overwrite)
  if (result) {
    cli::cli_alert_success("\u00a1Proceso completado!")
  } else {
    cli::cli_alert_warning("Archivo no actualizado.")
  }

  invisible()
}
