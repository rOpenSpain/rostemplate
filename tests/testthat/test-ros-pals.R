testthat::test_that("las paletas devuelven el número de colores solicitado", {
  palettes <- list(
    green = ros_green_pal,
    violet = ros_violet_pal,
    gradient = ros_gradient_pal,
    qualitative = ros_qualitative_pal,
    metro_madrid = ros_metro_madrid_pal
  )

  colors <- lapply(palettes, \(palette) palette(5, alpha = 1))

  testthat::expect_equal(
    lengths(colors),
    stats::setNames(rep(5L, 5), names(palettes))
  )
  testthat::expect_equal(
    vapply(
      colors,
      \(color) all(grepl("^#[[:xdigit:]]{6}$", color)),
      logical(1)
    ),
    stats::setNames(rep(TRUE, 5), names(palettes))
  )
})

testthat::test_that("las paletas aplican transparencia e inversión", {
  palettes <- list(
    green = ros_green_pal,
    violet = ros_violet_pal,
    gradient = ros_gradient_pal,
    qualitative = ros_qualitative_pal,
    metro_madrid = ros_metro_madrid_pal
  )

  for (palette in palettes) {
    opaque <- palette(4, alpha = 1)
    transparent <- palette(4, alpha = 0.5)

    testthat::expect_equal(palette(4, alpha = 1, rev = TRUE), rev(opaque))
    testthat::expect_equal(
      grepl("^#[[:xdigit:]]{8}$", transparent),
      rep(TRUE, 4)
    )
  }
})

testthat::test_that("ros_metro_madrid_pal() limita solicitudes excesivas", {
  testthat::expect_snapshot(colors <- ros_metro_madrid_pal(14, alpha = 1))
  testthat::expect_length(colors, 12)
})
