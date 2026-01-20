# Añade una insignia de **rOpenSpain** a tu archivo `README`

Añade una insignia de **rOpenSpain** que redirige a
<https://ropenspain.es/> en tu archivo `README`:
[![rOpenSpain](figures/ropenspain-badge.svg)](https://ropenspain.es/)

## Usage

``` r
ros_badge_ropenspain(install = TRUE)
```

## Arguments

- install:

  TRUE/FALSE. Si es `TRUE` la insignia se instala en el archivo
  `README.md/README.Rmd`. Si es `FALSE` muestra un mensaje con el código
  markdown correspondiente.

## Value

Insignia en markdown o mensaje con el código markdown a introducir.

## See also

[`usethis::use_badge()`](https://usethis.r-lib.org/reference/badges.html)

## Examples

``` r
ros_badge_ropenspain(install = FALSE)
#> Badge URL is 
#> [![rOS-badge](https://ropenspain.github.io/rostemplate/reference/figures/ropenspain-badge.svg)](https://ropenspain.es/)
```
