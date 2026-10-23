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
  masks <- regmatches(css, gregexpr("--ros-callout-mask: [^\n]+", css))[[1]]

  testthat::expect_length(masks, 6L)
  for (property in c("mask-image", "-webkit-mask-image")) {
    testthat::expect_match(
      css,
      paste0(property, ": var(--ros-callout-mask);"),
      fixed = TRUE
    )
  }
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

testthat::test_that("shared Emacs rules retain the dark palette", {
  css <- paste(read_pkgdown_css(), collapse = "\n")
  variables <- c(
    css_variables(css, '[data-bs-theme="dark"] pre {'),
    css_variables(css, ":root")
  )
  expected <- c(
    fg = "#b7b7b7",
    comment = "#66c966",
    string = "#ff9b9b",
    number = "#ff9c9c",
    muted = "#b7b7b7",
    "function" = "#66c966",
    keyword = "#cea4ff",
    variable = "#e0ac52",
    "alert-border" = "#ff9696"
  )

  for (name in names(expected)) {
    value <- variables[[paste0("--ros-syntax-", name)]]
    testthat::expect_equal(css_resolve_var(value, variables), expected[[name]])
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

testthat::test_that("narrow navbars retain compact title and version sizing", {
  testthat::skip_if_not_installed("sass")

  css <- as.character(sass::sass(
    readLines(pkgdown_file("assets", "BS5", "rostemplate.css"), warn = FALSE),
    cache = NULL,
    options = sass::sass_options(output_style = "expanded")
  ))
  narrow <- regmatches(
    css,
    regexpr(
      "@media \\(max-width: 375px\\) \\{[\\s\\S]*?\n\\}",
      css,
      perl = TRUE
    )
  )

  testthat::expect_match(
    narrow,
    "\\.navbar-brand\\s*\\{\\s*font-size: 1\\.125rem;"
  )
  testthat::expect_match(
    narrow,
    "\\.navbar \\.nav-text\\s*\\{\\s*font-size: 0?\\.65rem;"
  )
})
