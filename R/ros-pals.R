#' Paletas de colores de **rOpenSpain**
#'
#' Paletas de colores basadas en el tema de **rOpenSpain**.
#'
#' @rdname ros_pals
#' @name ros_pals
#'
#' @param n Número de colores.
#' @param alpha Valor alfa (transparencia) de los colores. `alpha = 1` es opaco
#'   y `alpha = 0` es totalmente transparente.
#' @param rev Valor lógico. Si es `TRUE`, devuelve los colores en orden inverso.
#'
#' @returns Un vector de colores.
#'
#' @family palettes
#' @family branding
#'
#' @export
#' @encoding UTF-8
ros_green_pal <- function(n = 4, alpha = 0.9, rev = FALSE) {
  cols <- c("#98c00b", "#e0ecb5")
  if (rev) {
    cols <- rev(cols)
  }

  ramp <- colorRampPalette(cols)
  if (alpha == 1) {
    return(ramp(n))
  }
  col_end <- adjustcolor(ramp(n), alpha.f = alpha)
  col_end
}

#' @rdname ros_pals
#'
#' @export
#' @encoding UTF-8
ros_violet_pal <- function(n = 4, alpha = 0.9, rev = FALSE) {
  cols <- c("#986dbd", "#e0d3eb")
  if (rev) {
    cols <- rev(cols)
  }

  ramp <- colorRampPalette(cols)
  if (alpha == 1) {
    return(ramp(n))
  }
  col_end <- adjustcolor(ramp(n), alpha.f = alpha)
  col_end
}

#' @rdname ros_pals
#'
#' @export
#' @encoding UTF-8
ros_gradient_pal <- function(n = 4, alpha = 0.9, rev = FALSE) {
  cols <- c("#98c00b", "#e0ecb5", "#e0d3eb", "#986dbd")
  if (rev) {
    cols <- rev(cols)
  }

  ramp <- colorRampPalette(cols)
  if (alpha == 1) {
    return(ramp(n))
  }
  col_end <- adjustcolor(ramp(n), alpha.f = alpha)
  col_end
}

#' @rdname ros_pals
#'
#' @export
#' @encoding UTF-8
ros_qualitative_pal <- function(n = 6, alpha = 0.9, rev = FALSE) {
  color <- "#98c00b"

  rgb_col <- col2rgb(color)
  hsv_col <- rgb2hsv(rgb_col)[, 1]
  hue <- hsv_col[1]
  sat <- hsv_col[2]
  val <- hsv_col[3]
  cols <- seq(hue, hue + 1, by = 1 / n)
  cols <- cols[seq_len(n)]
  cols[cols > 1] <- cols[cols > 1] - 1
  colors <- hsv(cols, sat, val)

  if (rev) {
    colors <- rev(colors)
  }

  if (alpha == 1) {
    return(colors)
  }

  colors <- adjustcolor(colors, alpha.f = alpha)

  colors
}

#' @rdname ros_pals
#'
#' @export
#' @encoding UTF-8
#'
#' @examplesIf requireNamespace("scales", quietly = TRUE)
#' scales::show_col(ros_green_pal(9))
#'
#' scales::show_col(ros_violet_pal(9))
#'
#' scales::show_col(ros_gradient_pal(9))
#'
#' scales::show_col(ros_qualitative_pal(9))
#'
#' scales::show_col(ros_metro_madrid_pal(9))
ros_metro_madrid_pal <- function(n = 4, alpha = 0.9, rev = FALSE) {
  cols <- c(
    "#39b5e6",
    "#e0292f",
    "#ffe114",
    "#b6551a",
    "#96bf0d",
    "#9a9999",
    "#ff7c00",
    "#f373b7",
    "#990d66",
    "#1b0c80",
    "#136926",
    "#999933"
  )

  if (n > length(cols)) {
    cli::cli_warn(
      paste(
        "{.fn ros_metro_madrid_pal} solo dispone de {length(cols)} colores,",
        "menos de los solicitados ({n})."
      )
    )
    n <- length(cols)
  }

  colors <- cols[seq_len(n)]

  if (rev) {
    colors <- rev(colors)
  }

  if (alpha == 1) {
    return(colors)
  }

  colors <- adjustcolor(colors, alpha.f = alpha)

  colors
}
