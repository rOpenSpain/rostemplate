testthat::test_that("el CSS minificado coincide con la fuente", {
  testthat::skip_if_not_installed("sass")

  source_path <- pkgdown_file("assets", "BS5", "rostemplate.css")
  minified_path <- pkgdown_file("assets", "BS5", "rostemplate.min.css")
  expected <- sass::sass(
    readLines(source_path, warn = FALSE),
    cache = NULL,
    options = sass::sass_options(output_style = "compressed")
  )
  expected <- sub("\n$", "", as.character(expected))
  actual <- paste(readLines(minified_path, warn = FALSE), collapse = "\n")

  testthat::expect_equal(actual, expected)
})

testthat::test_that("el CSS usa solo variables generadas por la marca", {
  css <- paste(read_pkgdown_css(), collapse = "\n")
  palette_names <- names(read_pkgdown_brand()$color$palette)
  generated_vars <- paste0(
    "--brand-",
    gsub("-", "_", palette_names, fixed = TRUE)
  )
  definitions <- extract_css_vars(
    css,
    "--brand-[A-Za-z0-9_-]+[[:space:]]*:"
  )
  used_vars <- extract_css_vars(css, "--brand-[A-Za-z0-9_-]+")

  testthat::expect_length(definitions, 0)
  testthat::expect_gt(length(used_vars), 0)
  testthat::expect_setequal(setdiff(used_vars, generated_vars), character())
})

testthat::test_that("las hojas CSS cubren los modos claro y oscuro", {
  css_paths <- pkgdown_file(
    "assets",
    "BS5",
    c("rostemplate.css", "rostemplate.min.css")
  )
  css <- lapply(
    css_paths,
    \(path) paste(readLines(path, warn = FALSE), collapse = "\n")
  )
  selectors <- c(
    ":root",
    '[data-bs-theme="dark"]',
    ".navbar",
    "#footer",
    "#copyright",
    ".callout"
  )

  for (stylesheet in css) {
    for (selector in selectors) {
      testthat::expect_match(stylesheet, selector, fixed = TRUE)
    }
  }

  testthat::expect_lt(file.size(css_paths[[2]]), file.size(css_paths[[1]]))
})
