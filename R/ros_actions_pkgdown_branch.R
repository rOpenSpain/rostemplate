#' Instala una acción GitHub que genera tu sitio en la rama `gh-pages`
#'
#' @description
#'
#' Instala una acción GitHub que crea el sitio \CRANpkg{pkgdown} de tu paquete
#' en la rama `gh-pages` de tu repositorio.
#'
#' @seealso [ros_build()], [ros_actions_pkgdown_docs()]
#' @export
#'
#' @inheritParams ros_actions_pkgdown_docs
#'
ros_actions_pkgdown_branch <- function(pkg = ".", overwrite = TRUE) {
  # Check destdir

  destdir <- file.path(pkg, ".github", "workflows")
  checkdir <- dir.exists(destdir)
  if (isFALSE(checkdir)) {
    dir.create(destdir, recursive = TRUE)
  }

  # Check .Rbuildignore

  rbuildig <- file.path(pkg, ".Rbuildignore")
  if (!file.exists(rbuildig)) {
    file.create(rbuildig)
  }

  # Add lines to Rbuildignore
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
  # Check gitignore
  gitignore <- file.path(pkg, ".github", ".gitignore")
  if (!file.exists(gitignore)) {
    file.create(gitignore)
  }
  usethis::write_union(
    gitignore,
    c("*.html", "R-version", "depends.Rds")
  )

  # Get action file
  filepath <-
    system.file("yaml/rostemplate-gh-pages.yml", package = "rostemplate")

  # Copy
  result <- file.copy(filepath, destdir, overwrite = overwrite)
  if (result) {
    message("Success!")
  } else {
    message("File not updated")
  }

  invisible()
}
