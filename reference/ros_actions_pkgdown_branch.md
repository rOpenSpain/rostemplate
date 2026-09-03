# Crea un sitio en `gh-pages` mediante GitHub Actions

Instala un flujo de trabajo de GitHub Actions que genera el sitio
[pkgdown](https://CRAN.R-project.org/package=pkgdown) del paquete en la
rama `gh-pages` del repositorio.

## Uso

``` r
ros_actions_pkgdown_branch(pkg = ".", overwrite = TRUE)
```

## Argumentos

- pkg:

  Ruta a la raíz del paquete.

- overwrite:

  Sobrescribe el flujo de trabajo si ya está instalado.

## Valor

Se llama por sus efectos secundarios y devuelve `NULL` de forma
invisible.

## Ver también

Sitios pkgdown:
[`ros_actions_pkgdown_docs()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_docs.md),
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md)

Flujos de trabajo de GitHub Actions:
[`ros_actions_check_cron()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_check_cron.md),
[`ros_actions_pkgdown_docs()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_docs.md)

## Ejemplos

``` r
pkg <- file.path(tempdir(), "pkgdown-branch")
if (!dir.exists(pkg)) {
  dir.create(pkg)
}
ros_actions_pkgdown_branch(pkg)
#> ✔ Adding "^docs$", "^_pkgdown\\.yml$", "^_pkgdown\\.yaml$", "^\\.github$", and
#>   "^pkgdown$" to /tmp/Rtmp9J9R7F/pkgdown-branch/.Rbuildignore.
#> ✔ Adding "*.html", "R-version", and "depends.Rds" to
#>   /tmp/Rtmp9J9R7F/pkgdown-branch/.github/.gitignore.
#> ✔ ¡Proceso completado!
```
