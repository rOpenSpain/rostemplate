#' Añade una insignia de **rOpenSpain** a tu archivo `README`
#'
#' Añade una insignia de **rOpenSpain** que redirige a <https://ropenspain.es/>
#' en tu archivo `README`:
#'
#' ```{r, echo=FALSE, results='asis'}
#'
#' cat(paste0(
#'   "\\ifelse{html}{\\href{https://ropenspain.es/}{\\figure{",
#'   "ropenspain-badge.svg}{options: alt='rOpenSpain'}}}",
#'   "{**rOpenSpain**}"
#' ))
#'
#' ```
#'
#' @param install Valor lógico. Si es `TRUE`, la insignia se instala en
#'   `README.md` o `README.Rmd`. Si es `FALSE`, muestra un mensaje con el
#'   código Markdown correspondiente.
#'
#' @returns Se llama por sus efectos secundarios. Si `install` es `FALSE`,
#'   muestra el código Markdown de la insignia.
#'
#' @seealso [usethis::use_badge()]
#'
#' @family branding
#'
#' @export
#' @encoding UTF-8
#'
#' @examples
#' ros_badge_ropenspain(install = FALSE)
ros_badge_ropenspain <- function(install = TRUE) {
  stopifnot(is.logical(install))

  # Prepara las URL de la insignia.
  badge <- paste0(
    "https://ropenspain.github.io/rostemplate/reference/",
    "figures/ropenspain-badge.svg"
  )

  href <- "https://ropenspain.es/"

  if (install) {
    # nocov start
    usethis::use_badge("rOS-badge", href = href, src = badge)
    # nocov end
  } else {
    cli::cli_inform(c(
      "i" = "URL de la insignia:",
      "*" = paste0("[![rOS-badge](", badge, ")](", href, ")")
    ))
  }
}
