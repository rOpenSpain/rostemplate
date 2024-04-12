#' Instala una acción GitHub que crea tu sitio en la carpeta `/docs`
#'
#' @description
#' Esta acción GitHub genera tu sitio \CRANpkg{pkgdown} en la carpeta `docs`
#' de tu repositorio.
#'
#' @details
#' El resultado final es equivalente a ejecutar [ros_build()] con la única
#' diferencia de que este comando se ejecuta en GitHub, en lugar de tener que
#' ser ejecutado por el usuario.
#'
#' @seealso [ros_build()], [ros_actions_pkgdown_branch()].
#'
#' @export
#'
#' @param pkg Ruta a la raíz del paquete.
#' @param overwrite Sobreescribe la acción si ya se encuntra instalada.
#'
ros_actions_pkgdown_docs <-
  function(pkg = ".", overwrite = TRUE) {
    # Check destdir

    destdir <- file.path(pkg, ".github", "workflows")
    checkdir <- dir.exists(destdir)
    if (isFALSE(checkdir)) {
      dir.create(destdir, recursive = TRUE)
    }

    # Check .Rbuildignore

    rbuildignore <- file.path(pkg, ".Rbuildignore")
    if (!file.exists(rbuildignore)) {
      file.create(rbuildignore)
    }

    # Add lines to Rbuildignore
    usethis::write_union(
      rbuildignore,
      c(
        "^docs$", "^_pkgdown\\.yml$", "^_pkgdown\\.yaml$",
        "^\\.github$", "^pkgdown$"
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
      system.file("yaml/rostemplate-docs.yaml", package = "rostemplate")

    # Copy
    result <- file.copy(filepath, destdir, overwrite = overwrite)
    if (result) {
      message("Success!")
    } else {
      message("File not updated")
    }

    return(invisible())
  }
