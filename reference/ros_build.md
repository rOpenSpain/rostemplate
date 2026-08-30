# Genera tu sitio [pkgdown](https://CRAN.R-project.org/package=pkgdown) en local

Esta función envuelve
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html).

## Uso

``` r
ros_build(pkg = ".", ...)
```

## Argumentos

- pkg:

  Ruta a la raíz del paquete.

- ...:

  Argumentos adicionales que se pasan a
  [`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html).

## Valor

Se llama por sus efectos secundarios y devuelve `NULL` de forma
invisible.

## Detalles

La única diferencia con
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html)
es que te recuerda los pasos a seguir para configurar `rostemplate` y
pide confirmación antes de ejecutar
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html).
El resultado se genera en la carpeta `/docs`.

A diferencia de
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md),
este proceso se ejecuta de forma local.

## Ver también

[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html).

Sitios pkgdown:
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md),
[`ros_actions_pkgdown_docs()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_docs.md)

## Ejemplos

``` r
if (FALSE) { # interactive()
ros_build()
}
```
