library(httr2)

paste0(
  "https://raw.githubusercontent.com/devcows/hugo-universal-theme/refs/",
  "heads/master/static/css/style.violet.css"
) |>
  request() |>
  req_perform() |>
  resp_body_string() |>
  writeLines(con = "data-raw/style.violet.css")


# Compress with sass
library(sass)

lns <- readLines("inst/pkgdown/assets/BS5/rostemplate.css")

sass(
  lns,
  "inst/pkgdown/assets/BS5/rostemplate.min.css",
  cache = NULL,
  options = sass_options(output_style = "compressed")
)
