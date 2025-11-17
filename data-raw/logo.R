## code to prepare `logo` dataset goes here

library(ggplot2)
library(hexSticker)
library(sf)

path <- as.matrix(data.frame(
  x = c(9, 514, 514, 261, 138, 138, 9, 9),
  y = c(450, 450, 154, 9, 81, 317, 317, 450)
))

l <- st_cast(st_linestring(path), "POLYGON")

sp <- ggplot(l) +
  geom_sf(fill = "#97bf13", color = "black", size = 1.5) +
  theme_void()


sticker(
  sp,
  package = "",
  filename = "man/figures/logo.png",
  s_height = 1.88,
  s_width = 1.88,
  s_x = 1,
  s_y = 0.75,
  h_fill = "#aecd47",
  h_color = NA
)
