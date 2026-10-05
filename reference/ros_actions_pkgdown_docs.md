# Crea un sitio en `/docs` mediante GitHub Actions

Instala un flujo de trabajo de GitHub Actions que genera el sitio
[pkgdown](https://CRAN.R-project.org/package=pkgdown) del paquete en la
carpeta `docs` del repositorio.

## Uso

``` r
ros_actions_pkgdown_docs(pkg = ".", overwrite = TRUE)
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

El resultado final es equivalente a ejecutar
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md),
pero este comando se ejecuta en GitHub, no localmente.

Para publicar el sitio en la rama `gh-pages` en lugar de la carpeta
`docs`, usa
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md).

## Generación del sitio

Usa
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md)
para generar el sitio de forma local. Consulta
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html)
para las opciones de generación.

## Ver también

Flujos de trabajo de GitHub Actions:
[`ros_actions_check_cron()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_check_cron.md),
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md)

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
#>   "^pkgdown$" to /tmp/RtmpJB7NVf/pkgdown-docs/.Rbuildignore.
#> ✔ Adding "*.html", "R-version", and "depends.Rds" to
#>   /tmp/RtmpJB7NVf/pkgdown-docs/.github/.gitignore.
#> ✔ ¡Proceso completado!
```
