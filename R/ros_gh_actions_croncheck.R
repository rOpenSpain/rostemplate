#' Crea un workflow de GitHub Actions que comprueba tu paquete regularmente
#'
#' El workflow de GitHub Actions creado ejecuta `R CMD check` para tu paquete.
#' La configuración por defecto ejecuta el check de manera mensual los días 1
#' de cada mes a las 08:30.
#'
#' @details
#' Puedes aprender cómo configurar la acción cron en el siguiente enlace:
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
#' @inheritParams ros_actions_pkgdown_docs
#'
#' @returns Se llama por sus efectos secundarios y devuelve `NULL` de forma
#'   invisible.
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
  # Ensure the workflow directory exists.

  destdir <- file.path(pkg, ".github", "workflows")
  checkdir <- dir.exists(destdir)
  if (isFALSE(checkdir)) {
    dir.create(destdir, recursive = TRUE)
  }

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

  # Ensure the workflow .gitignore exists.

  gitignore <- file.path(pkg, ".github", ".gitignore")
  if (!file.exists(gitignore)) {
    file.create(gitignore)
  }

  # Add workflow helper files to .gitignore.
  usethis::write_union(gitignore, c("*.html", "R-version", "depends.Rds"))

  # Locate the workflow template.
  filepath <- system.file(
    "yaml/roscron-check-standard.yaml",
    package = "rostemplate"
  )

  # Copy the workflow template.
  result <- file.copy(filepath, destdir, overwrite = overwrite)
  if (result) {
    message("Success!")
  } else {
    message("File not updated")
  }

  invisible()
}
