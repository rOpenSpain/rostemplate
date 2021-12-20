#' Instala una acción GitHub que crea tu sitio en la carpeta `/docs`
#'
#' @description
#' Esta acción GitHub genera tu sitio `pkgdown` en la carpeta `docs` de tu
#' repositorio.
#'
#' @details
#' El resultado final es equivalente a ejecutar [ros_build()] con la única
#' diferencia de que este comando se ejecuta en GitHub, en lugar de tener que
#' ser ejecutado por el usuario.
#'
#' @seealso [ros_build()], [ros_actions_pkgdown_branch()]
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

    Rbuildignore <- file.path(pkg, ".Rbuildignore")
    if (!file.exists(Rbuildignore)) {
      file.create(Rbuildignore)
    }

    # Add lines to Rbuildignore
    linesRbuild <- readLines(Rbuildignore)
    newlinesRbuild <-
      unique(c(linesRbuild, "^\\.github$", "^docs$", "^_pkgdown\\.yml$"))
    newlinesRbuild <- newlinesRbuild[newlinesRbuild != ""]
    writeLines(newlinesRbuild, Rbuildignore)

    # Check gitignore

    gitignore <- file.path(pkg, ".github", ".gitignore")
    if (!file.exists(gitignore)) {
      file.create(gitignore)
    }

    # Add lines to gitignore
    lines <- readLines(gitignore)
    newlines <-
      unique(c(lines, "*.html", "R-version", "depends.Rds"))
    newlines <- newlines[newlines != ""]
    writeLines(newlines, gitignore)

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
