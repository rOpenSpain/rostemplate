#' Instala un workflow de GitHub Actions que crea tu sitio en `/docs`
#'
#' Este workflow de GitHub Actions genera tu sitio \CRANpkg{pkgdown} en la
#' carpeta `docs` de tu repositorio.
#'
#' @details
#' El resultado final es equivalente a ejecutar [ros_build()], con la diferencia
#' de que este comando se ejecuta en GitHub en lugar de ejecutarse localmente.
#'
#' @param pkg Ruta a la raíz del paquete.
#' @param overwrite Sobrescribe el workflow si ya se encuentra instalado.
#'
#' @returns Se llama por sus efectos secundarios y devuelve `NULL` de forma
#'   invisible.
#'
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
  usethis::write_union(gitignore, c("*.html", "R-version", "depends.Rds"))

  # Locate the workflow template.
  filepath <- system.file("yaml/rostemplate-docs.yaml", package = "rostemplate")

  # Copy the workflow template.
  result <- file.copy(filepath, destdir, overwrite = overwrite)
  if (result) {
    message("Success!")
  } else {
    message("File not updated")
  }

  invisible()
}
