# Compress with sass
library(sass)

lns <- readLines("inst/pkgdown/assets/BS5/rostemplate.css")

sass(
  lns,
  "inst/pkgdown/assets/BS5/rostemplate.min.css",
  cache = NULL,
  options = sass_options(output_style = "compressed")
)
