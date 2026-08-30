testthat::test_that("los recursos esenciales se instalan completos", {
  resources <- c(
    "favicon.svg",
    "favicon.ico",
    "favicon-96x96.png",
    "apple-touch-icon.png",
    "web-app-manifest-192x192.png",
    "web-app-manifest-512x512.png",
    "site.webmanifest",
    "BS5/rostemplate.css",
    "BS5/rostemplate.min.css",
    "BS5/texture-bw.png",
    "BS5/texture-bw-inverted.png"
  )
  paths <- pkgdown_file("assets", resources)

  testthat::expect_equal(file.exists(paths), rep(TRUE, length(resources)))
  testthat::expect_gt(min(unname(file.info(paths)$size)), 0)
})

testthat::test_that("el manifiesto web referencia los iconos instalados", {
  manifest_path <- pkgdown_file("assets", "site.webmanifest")
  manifest <- yaml::read_yaml(manifest_path)
  icon_files <- sub("^/", "", vapply(manifest$icons, `[[`, "", "src"))
  icon_sizes <- vapply(manifest$icons, `[[`, "", "sizes")
  icon_paths <- pkgdown_file("assets", icon_files)

  testthat::expect_setequal(icon_sizes, c("192x192", "512x512"))
  testthat::expect_equal(file.exists(icon_paths), rep(TRUE, length(icon_paths)))
  testthat::expect_gt(min(unname(file.info(icon_paths)$size)), 0)
})

testthat::test_that("el logotipo portable existe dentro de brand_yml", {
  brand_path <- brand_file("_brand.yml")
  brand <- yaml::read_yaml(brand_path)
  logo <- sub("^\\./", "", brand$logo$images$header)
  logo_path <- brand_file(logo)

  testthat::expect_true(file.exists(logo_path))
  testthat::expect_gt(file.size(logo_path), 0)
})

testthat::test_that("schemaorg.json contiene metadatos de software", {
  schema <- yaml::read_yaml(template_file("schemaorg.json"))

  testthat::expect_equal(schema[["@context"]], "https://schema.org")
  testthat::expect_type(schema[["@graph"]], "list")
  testthat::expect_gt(length(schema[["@graph"]]), 0)
})
