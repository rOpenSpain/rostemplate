# Añade una insignia de **rOpenSpain** a tu archivo `README`

Añade una insignia de **rOpenSpain** que redirige a
<https://ropenspain.es/> en tu archivo `README`:

## Uso

``` r
ros_badge_ropenspain(install = TRUE)
```

## Argumentos

- install:

  Valor lógico. Si es `TRUE`, la insignia se instala en `README.md` o
  `README.Rmd`. Si es `FALSE`, muestra un mensaje con el código Markdown
  correspondiente.

## Valor

Se llama por sus efectos secundarios. Si `install` es `FALSE`, muestra
el código Markdown de la insignia.

## Detalles

[![rOpenSpain](figures/ropenspain-badge.svg)](https://ropenspain.es/)

## Ver también

[`usethis::use_badge()`](https://usethis.r-lib.org/reference/badges.html)

Recursos de identidad visual:
[`ros_pals`](https://ropenspain.github.io/rostemplate/reference/ros_pals.md)

## Ejemplos

``` r
ros_badge_ropenspain(install = FALSE)
#> ℹ URL de la insignia:
#> • [![rOS-badge](https://ropenspain.github.io/rostemplate/reference/figures/ropenspain-badge.svg)](https://ropenspain.es/)
```
