# WIP

Testing a new pkgdown template.

Code sample

```r

library(sf)
## Linking to GEOS 3.5.1, GDAL 2.2.2, PROJ 4.9.2
library(jsonlite)
library(dplyr)
## 
## Attaching package: 'dplyr'
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union

#Shape
cntries = st_read("https://ec.europa.eu/eurostat/cache/GISCO/distribution/v2/countries/geojson/CNTR_RG_20M_2016_3035.geojson",
                  stringsAsFactors = FALSE)
## Reading layer `CNTR_RG_20M_2016_3035' from data source `https://ec.europa.eu/eurostat/cache/GISCO/distribution/v2/countries/geojson/CNTR_RG_20M_2016_3035.geojson' using driver `GeoJSON'
## Simple feature collection with 257 features and 6 fields
## geometry type:  MULTIPOLYGON
## dimension:      XY
## bbox:           xmin: -7142317 ymin: -9160665 xmax: 16932290 ymax: 15428010
## CRS:            3035

# Include trade blocks
df <- fromJSON("https://raw.githubusercontent.com/dieghernan/Country-Codes-and-International-Organizations/master/outputs/Countrycodesfull.json")
ISO_memcol <- function(df,
                       orgtosearch) {
  ind <- match(orgtosearch, unlist(df[1, "org_id"]))
  or <- lapply(1:nrow(df), function(x)
    unlist(df[x, "org_member"])[ind])
  or <- data.frame(matrix(unlist(or)), stringsAsFactors = F)
  names(or) <- orgtosearch
  df2 <- as.data.frame(cbind(df, or, stringsAsFactors = F))
  return(df2)
}
df <- ISO_memcol(df, "EU")
df <- ISO_memcol(df, "EFTA")
df <- ISO_memcol(df, "EuroArea")


cntries = merge(cntries,
                df,
                by.x = "ISO3_CODE",
                by.y = "ISO_3166_3",
                all.x = TRUE)

library(cartography)


#Limits EU
#Plot base map
plot(
  st_geometry(cntries),
  xlim = c(2200000, 7150000),
  ylim = c(1380000, 5500000),
)
plot(st_geometry(cntries), add = TRUE)
plot(st_geometry(cntries[!is.na(cntries$EU),]), col = "grey60", add = TRUE)
plot(st_geometry(cntries[!is.na(cntries$EFTA),]), col = "black", add = TRUE)
#Add hatching
hatchedLayer(
  cntries[!is.na(cntries$EuroArea),],
  pattern = "right2left",
  col = "white",
  density = 3,
  add = TRUE
)
legendTypo(
  "topright",
  title.txt = "",
  categ = c("EU", "EFTA"),
  col = c("grey60", "black"),
  nodata = FALSE
)

legendHatched(
  "right",
  title.txt = "Within EU",
  categ = "Euro\nArea",
  patterns = "right2left",
  frame = TRUE
)
layoutLayer(
  title = "European Trade Blocks",
  theme = "grey.pal",
  sources = "© EuroGeographics for the administrative boundaries.",
  author =  paste0("cartography ", packageVersion("cartography")),
  scale = 500,
  frame = TRUE
)
```