testthat::test_that("la plantilla configura pkgdown y Bootstrap 5", {
  config_path <- pkgdown_file("_pkgdown.yml")

  config <- yaml::read_yaml(config_path)

  testthat::expect_equal(config$template$bootstrap, 5)
  testthat::expect_equal(config$template$`math-rendering`, "katex")
  testthat::expect_true(config$template$`light-switch`)
  testthat::expect_equal(config$navbar, list(type = "light", bg = "light"))
  testthat::expect_named(
    config$template$bslib$brand,
    c("color", "typography", "defaults")
  )
})

testthat::test_that("las plantillas HTML conservan los hooks de pkgdown", {
  required_hooks <- list(
    "layout.html" = c(
      "{{{ head }}}",
      "{{{ navbar }}}",
      "{{{ content }}}",
      "{{{ footer }}}",
      "{{{ after-body }}}"
    ),
    "navbar.html" = c("{{#navbar}}", "{{#left}}", "{{#right}}"),
    "footer.html" = c("{{#footer}}", "{{#left}}", "{{#right}}"),
    "content-home.html" = c("{{{index}}}", "{{#sidebar}}"),
    "in-header.html" = "BS5/rostemplate.min.css"
  )

  for (template in names(required_hooks)) {
    template_path <- system.file(
      "pkgdown",
      "templates",
      template,
      package = "rostemplate",
      mustWork = TRUE
    )
    template_text <- paste(readLines(template_path), collapse = "\n")

    for (hook in required_hooks[[template]]) {
      testthat::expect_match(template_text, hook, fixed = TRUE)
    }
  }
})

testthat::test_that("la plantilla HTML referencia recursos instalados", {
  references <- c(
    "BS5/rostemplate.min.css",
    "apple-touch-icon.png",
    "logo.png",
    "ROS-logo.png"
  )
  assets <- pkgdown_file("assets", references)

  testthat::expect_equal(file.exists(assets), rep(TRUE, length(references)))
  testthat::expect_gt(min(file.size(assets)), 0)
})

testthat::test_that("el enlace de inicio referencia la identidad rOpenSpain", {
  config <- yaml::read_yaml(pkgdown_file("_pkgdown.yml"))
  link <- config$home$links[[1]]

  testthat::expect_equal(link$href, "https://ropenspain.es/")
  testthat::expect_match(link$text, "ROS-logo.png", fixed = TRUE)
  testthat::expect_match(link$text, "rOpenSpain", fixed = TRUE)
})
