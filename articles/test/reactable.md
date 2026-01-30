# reactable example

``` r
data <- MASS::Cars93[
  1:50,
  c("Manufacturer", "Model", "Type", "AirBags", "Price")
]

library(reactable)

reactable(
  data,
  selection = "multiple",
  onClick = "select",
  rowStyle = list(cursor = "pointer"),
  filterable = TRUE,
  highlight = TRUE,
  searchable = TRUE,
  showPageSizeOptions = TRUE,
  striped = TRUE,
  defaultColDef = colDef(vAlign = "center", minWidth = 150),
  paginationType = "jump",
  elementId = "cars",
  columns = list(
    Manufacturer = colDef(
      sticky = "left",
      rowHeader = TRUE,
      name = "",
      cell = function(value) {
        htmltools::strong(value)
      }
    )
  )
)
```
