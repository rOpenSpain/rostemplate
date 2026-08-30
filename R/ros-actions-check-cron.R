#' Crea un flujo de trabajo de GitHub Actions para comprobar tu paquete
#'
#' El flujo de trabajo de GitHub Actions creado ejecuta `R CMD check` para tu
#' paquete. La configuración por defecto ejecuta la comprobación el día 1 de
#' cada mes a las 08:30.
#'
#' @details
#' Consulta cómo configurar la ejecución programada en el siguiente enlace:
#'
#' ```{r, echo=FALSE, results='asis'}
#' cat(paste0("\n<https://docs.github.com/en/free-pro-team@latest/",
#' "actions/reference/events-that-trigger-workflows#schedule>"))
#' ```
#'
#' La configuración por defecto es `"30 08 1 * *"` ("a las 08:30 del día 1 de
#' cada mes").
#'
#' Usa [crontab.guru](https://crontab.guru/#30_08_1_*_*) para crear tu propia
#' configuración cron.
#'
#' @inheritParams ros_actions_pkgdown_docs pkg overwrite
#'
#' @inherit ros_actions_pkgdown_docs return
#'
#' @family github_actions
#'
#' @export
#' @encoding UTF-8
#'
#' @examples
#' pkg <- file.path(tempdir(), "pkgdown-cron")
#' if (!dir.exists(pkg)) {
#'   dir.create(pkg)
#' }
#' ros_actions_check_cron(pkg)
ros_actions_check_cron <- function(pkg = ".", overwrite = TRUE) {
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

  # Añade los archivos auxiliares del flujo de trabajo a .gitignore.
  usethis::write_union(gitignore, c("*.html", "R-version", "depends.Rds"))

  # Localiza la plantilla del flujo de trabajo.
  filepath <- system.file(
    "yaml/roscron-check-standard.yaml",
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
