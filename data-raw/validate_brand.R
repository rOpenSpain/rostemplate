library(brand.yml)

# Validate in JSON format
json_brand <- yaml::read_yaml("inst/brand_yml/_brand.yml") |>
  jsonlite::toJSON(pretty = TRUE, auto_unbox = TRUE)

schema_json <- jsonlite::read_json(
  "https://posit-dev.github.io/brand-yml/schema/brand.schema.json"
) |>
  jsonlite::toJSON(pretty = TRUE, auto_unbox = TRUE)

tmp_json_file <- tempfile(fileext = ".json")
jsonlite::write_json(schema_json, tmp_json_file)

jsonvalidate::json_validate(
  json_brand,
  schema = tmp_json_file,
  verbose = TRUE
)
