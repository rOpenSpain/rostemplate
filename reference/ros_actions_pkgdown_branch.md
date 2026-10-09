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

Devuelve [NULL](https://rdrr.io/r/base/NULL.html) de forma invisible. Se
llama por sus efectos secundarios.

## Detalles

Para publicar el sitio en la carpeta `docs` en lugar de la rama
`gh-pages`, usa
[`ros_actions_pkgdown_docs()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_docs.md).

## Generación del sitio

Usa
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md)
para generar el sitio de forma local. Consulta
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html)
para las opciones de generación.

## Ver también

Flujos de trabajo de GitHub Actions:
[`ros_actions_check_cron()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_check_cron.md),
[`ros_actions_pkgdown_docs()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_docs.md)

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
#>   "^pkgdown$" to /tmp/RtmpoXeNwu/pkgdown-branch/.Rbuildignore.
#> ✔ Adding "*.html", "R-version", and "depends.Rds" to
#>   /tmp/RtmpoXeNwu/pkgdown-branch/.github/.gitignore.
#> ✔ ¡Proceso completado!
```
