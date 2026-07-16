# Instala un workflow de GitHub Actions que genera tu sitio en `gh-pages`

Instala un workflow de GitHub Actions que crea el sitio
[pkgdown](https://CRAN.R-project.org/package=pkgdown) de tu paquete en
la rama `gh-pages` de tu repositorio.

## Uso

``` r
ros_actions_pkgdown_branch(pkg = ".", overwrite = TRUE)
```

## Argumentos

- pkg:

  Ruta a la raíz del paquete.

- overwrite:

  Sobrescribe el workflow si ya se encuentra instalado.

## Valor

Se llama por sus efectos secundarios y devuelve `NULL` de forma
invisible.

## Ver también

Sitios pkgdown:
[`ros_actions_pkgdown_docs()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_docs.md),
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md)

## Ejemplos

``` r
pkg <- file.path(tempdir(), "pkgdown-branch")
if (!dir.exists(pkg)) {
  dir.create(pkg)
}
ros_actions_pkgdown_branch(pkg)
#> ✔ Adding "^docs$", "^_pkgdown\\.yml$", "^_pkgdown\\.yaml$", "^\\.github$", and
#>   "^pkgdown$" to /tmp/RtmpIZGS9V/pkgdown-branch/.Rbuildignore.
#> ✔ Adding "*.html", "R-version", and "depends.Rds" to
#>   /tmp/RtmpIZGS9V/pkgdown-branch/.github/.gitignore.
#> Success!
```
