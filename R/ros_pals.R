#' rOpenSpain paletas de color
#'
#' Paletas de colores basadas en el tema de rOpenSpain
#'
#' @family ros_plot
#'
#' @rdname ros_pals
#' @name ros_pals
#'
#' @return Paletas de colores
#'
#' @export
#'
#' @param n Número de colores
#' @param alpha Valor alfa (transparencia) de los colores. alpha = 1 es opaco
#'   y alpha = 0 totalmente transparente
#' @param rev	Valor lógico que indica si los colores se han de mostar en orden
#'   inverso.
#'
#'
#'
#' @examples
#'
#' scales::show_col(ros_green_pal(9))
#'
#' scales::show_col(ros_violet_pal(9))
#'
#' scales::show_col(ros_gradient_pal(9))
#'
#' scales::show_col(ros_qualitative_pal(9))
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
  return(col_end)
}

#' @rdname ros_pals
#'
#' @export
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
  return(col_end)
}

#' @rdname ros_pals
#'
#' @export
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
  return(col_end)
}

#' @rdname ros_pals
#'
#' @export
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
  if (substr(color, 1, 1) == "#" && nchar(color) == 9) {
    alpha <- substr(color, 8, 9)
    colors <- paste(colors, alpha, sep = "")
  }

  if (rev) colors <- rev(colors)

  if (alpha == 1) {
    return(colors)
  }

  colors <- adjustcolor(colors, alpha.f = alpha)

  return(colors)
}
