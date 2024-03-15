#' Crea una acción GitHub que comprueba tu paquete de manera regular
#'
#' @description
#' La acción GitHub creada ejecuta `R CMD check` para tu paquete.
#' La configuración por defecto ejecuta el check de manera mensual los dias 1
#' de mes a las 08:30 AM.
#'
#' @details
#' Puedes aprender cómo configurar la acción cron en el siguiente link:
#' <https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#schedule>.
#'
#' La configuración por defecto  `'30 08 1 * *'` ("A las 08:30 del
#' dia-del-mes 1.").
#'
#' Usa [crontab.guru](https://crontab.guru/#30_08_1_*_*) para crear tus propia
#' configuración cron.
#'
#'
#' @export
#'
#' @inheritParams ros_actions_pkgdown_docs
#'
ros_actions_check_cron <-
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
    linesrbuild <- readLines(rbuildignore)
    newlinesrbuild <-
      unique(c(linesrbuild, "^\\.github$", "^docs$", "^_pkgdown\\.yml$"))
    newlinesrbuild <- newlinesrbuild[newlinesrbuild != ""]
    writeLines(newlinesrbuild, rbuildignore)

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
      system.file("yaml/roscron-check-standard.yaml", package = "rostemplate")

    # Copy
    result <- file.copy(filepath, destdir, overwrite = overwrite)
    if (result) {
      message("Success!")
    } else {
      message("File not updated")
    }

    return(invisible())
  }
