testthat::test_that("portable brand matches pkgdown brand", {
  pkgdown_path <- system.file(
    "pkgdown/_pkgdown.yml",
    package = "rostemplate",
    mustWork = TRUE
  )
  brand_path <- system.file(
    "brand_yml/_brand.yaml",
    package = "rostemplate",
    mustWork = TRUE
  )

  pkgdown_brand <- yaml::read_yaml(pkgdown_path)$template$bslib$brand
  portable_brand <- yaml::read_yaml(brand_path)

  testthat::expect_equal(portable_brand$color, pkgdown_brand$color)
  testthat::expect_equal(portable_brand$typography, pkgdown_brand$typography)
  testthat::expect_equal(portable_brand$defaults, pkgdown_brand$defaults)
  testthat::expect_named(
    brand.yml::read_brand_yml(brand_path),
    c(
      "meta",
      "logo",
      "color",
      "typography",
      "defaults",
      "path"
    )
  )
})

testthat::test_that("dark theme colors pass contrast checks", {
  css_path <- system.file(
    "pkgdown/assets/BS5/rostemplate.css",
    package = "rostemplate",
    mustWork = TRUE
  )
  pkgdown_path <- system.file(
    "pkgdown/_pkgdown.yml",
    package = "rostemplate",
    mustWork = TRUE
  )

  css <- paste(readLines(css_path), collapse = "\n")
  brand <- yaml::read_yaml(pkgdown_path)$template$bslib$brand
  css_vars <- c(
    brand_css_variables(brand$color$palette),
    css_variables(css, ":root"),
    css_variables(css, '[data-bs-theme="dark"]')
  )

  contrast_pairs <- list(
    "body text" = c("--bs-body-color", "--bs-body-bg"),
    "headings" = c("--bs-heading-color", "--bs-body-bg"),
    "links" = c("--bs-link-color", "--bs-body-bg"),
    "navbar active" = c("--ros-nav-active-fg", "--ros-nav-active-bg"),
    "navbar hover" = c("--ros-nav-hover-fg", "--ros-nav-hover-bg"),
    "footer text" = c("--ros-footer-fg", "--ros-footer-bg"),
    "footer link" = c("--ros-footer-link", "--ros-footer-bg"),
    "copyright text" = c("--ros-copyright-fg", "--ros-copyright-bg"),
    "inline code" = c("--ros-code-dark-fg", "--ros-code-dark-bg"),
    "syntax base" = c("--ros-syntax-dark-fg", "--ros-code-dark-bg"),
    "syntax comment" = c("--ros-syntax-dark-comment", "--ros-code-dark-bg"),
    "syntax string" = c("--ros-syntax-dark-string", "--ros-code-dark-bg"),
    "syntax number" = c("--ros-syntax-dark-number", "--ros-code-dark-bg"),
    "syntax keyword" = c("--ros-syntax-dark-keyword", "--ros-code-dark-bg"),
    "syntax variable" = c("--ros-syntax-dark-variable", "--ros-code-dark-bg")
  )

  contrast <- vapply(
    contrast_pairs,
    \(vars) {
      fg <- css_color(css_resolve_var(css_vars[[vars[[1]]]], css_vars))
      bg <- css_color(css_resolve_var(css_vars[[vars[[2]]]], css_vars))
      contrast_ratio(fg, bg)
    },
    numeric(1)
  )

  testthat::expect_named(contrast, names(contrast_pairs))
  testthat::expect_gte(min(contrast), 4.5)

  yiq <- lapply(
    contrast_pairs,
    \(vars) {
      fg <- css_color(css_resolve_var(css_vars[[vars[[1]]]], css_vars))
      bg <- css_color(css_resolve_var(css_vars[[vars[[2]]]], css_vars))
      c(foreground = yiq_luminance(fg), background = yiq_luminance(bg))
    }
  )

  yiq_polarity <- vapply(
    yiq,
    \(values) {
      if (values[["background"]] >= 128) {
        return(values[["foreground"]] < 128)
      }

      values[["foreground"]] >= 128
    },
    logical(1)
  )

  testthat::expect_true(all(yiq_polarity))
})
