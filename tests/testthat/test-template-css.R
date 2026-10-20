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

testthat::test_that("copy buttons and active pills preserve contrast", {
  css <- paste(read_pkgdown_css(), collapse = "\n")
  copy <- css_block(css, ".btn-copy-ex:hover,")
  copy_default <- css_block(css, "\n.btn-copy-ex {")
  pills <- css_block(css, ".nav-pills .nav-link.active:hover,")

  testthat::expect_match(copy, "color: var(--ros-copy-fg);", fixed = TRUE)
  testthat::expect_match(copy_default, "color: var(--ros-white);", fixed = TRUE)
  testthat::expect_match(
    copy_default,
    "background-color: var(--ros-violet-dark);",
    fixed = TRUE
  )
  testthat::expect_match(
    copy,
    "background-color: var(--ros-copy-bg);",
    fixed = TRUE
  )
  testthat::expect_match(
    pills,
    "color: var(--ros-nav-active-fg);",
    fixed = TRUE
  )
})

testthat::test_that("callout masks use theme colors without embedded colors", {
  css <- paste(read_pkgdown_css(), collapse = "\n")
  masks <- regmatches(css, gregexpr("\tmask-image: [^\n]+", css))[[1]]
  webkit_masks <- regmatches(
    css,
    gregexpr("\t-webkit-mask-image: [^\n]+", css)
  )[[1]]

  testthat::expect_length(masks, 6L)
  testthat::expect_equal(sub("-webkit-", "", webkit_masks, fixed = TRUE), masks)
  testthat::expect_no_match(
    paste(masks, collapse = "\n"),
    "rgb\\(|style=| fill="
  )
  testthat::expect_match(css, "background-color: currentColor;", fixed = TRUE)
  testthat::expect_match(css, "mask-size: contain;", fixed = TRUE)
  testthat::expect_no_match(css, "filter: brightness\\(1\\.7\\)")

  for (type in c("info", "success", "warning", "danger")) {
    testthat::expect_match(
      css,
      paste0("color: var(--bs-", type, "-text-emphasis);"),
      fixed = TRUE
    )
  }
})

testthat::test_that("reduced motion disables callout toggle transitions", {
  css <- paste(read_pkgdown_css(), collapse = "\n")
  reduced <- css_block(css, "@media (prefers-reduced-motion: reduce)")

  testthat::expect_match(
    css_block(reduced, ".callout .callout-btn-toggle .callout-toggle::before"),
    "transition: none;",
    fixed = TRUE
  )
})
