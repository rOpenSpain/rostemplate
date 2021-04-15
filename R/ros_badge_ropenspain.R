#' Add a rOpenSpain badge to your `README` file
#'
#'
#' @description
#'
#' Add an rOpenSpain badge pointing to <https://ropenspain.es/> on your `README`
#' file:
#'
#' \ifelse{html}{\href{https://ropenspain.es/}{\figure{ropenspain-badge.svg}{options: alt='rOpenSpain'}}}{\strong{rOpenSpain}}
#'
#' @export
#'
#' @return A markdown badge or a message with the markdown code to be pasted.
#'
#' @seealso [`usethis::use_badge()`]
#'
#' @param install TRUE/FALSE. On TRUE the badge would be installed on your
#' README.md/.Rmd. On FALSE a message with the Rmarkdown code would be
#' displayed.
#'
#' @examples
#'
#' ros_badge_ropenspain(install = FALSE)
ros_badge_ropenspain <- function(install = TRUE) {
  stopifnot(is.logical(install))

  # Add pkg
  badge <- "https://ropenspain.github.io/rostemplate/reference/figures/ropenspain-badge.svg"

  href <- "https://ropenspain.es/"

  if (install) {
    # nocov start
    usethis::use_badge("rOS-badge", href = href, src = badge)
    # nocov end
  } else {
    message(
      "Badge URL is ", "\n",
      "[![rOS-badge](",
      badge, ")](", href, ")"
    )
  }
}
