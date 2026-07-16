# Instala un workflow de GitHub Actions que crea tu sitio en `/docs`

Este workflow de GitHub Actions genera tu sitio
[pkgdown](https://CRAN.R-project.org/package=pkgdown) en la carpeta
`docs` de tu repositorio.

## Uso

``` r
ros_actions_pkgdown_docs(pkg = ".", overwrite = TRUE)
```

## Argumentos

- pkg:

  Ruta a la raíz del paquete.

- overwrite:

  Sobrescribe el workflow si ya se encuentra instalado.

## Valor

Se llama por sus efectos secundarios y devuelve `NULL` de forma
invisible.

## Detalles

El resultado final es equivalente a ejecutar
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md),
con la diferencia de que este comando se ejecuta en GitHub en lugar de
ejecutarse localmente.

## Ver también

Sitios pkgdown:
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md),
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md)

## Ejemplos

``` r
pkg <- file.path(tempdir(), "pkgdown-docs")
if (!dir.exists(pkg)) {
  dir.create(pkg)
}
ros_actions_pkgdown_docs(pkg)
#> ✔ Adding "^docs$", "^_pkgdown\\.yml$", "^_pkgdown\\.yaml$", "^\\.github$", and
#>   "^pkgdown$" to /tmp/Rtmpkx1Wnb/pkgdown-docs/.Rbuildignore.
#> ✔ Adding "*.html", "R-version", and "depends.Rds" to
#>   /tmp/Rtmpkx1Wnb/pkgdown-docs/.github/.gitignore.
#> Success!
```
