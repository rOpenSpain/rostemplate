# Crea un sitio en `/docs` mediante GitHub Actions

Este flujo de trabajo de GitHub Actions genera el sitio
[pkgdown](https://CRAN.R-project.org/package=pkgdown) en la carpeta
`docs` del repositorio.

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

Se llama por sus efectos secundarios y devuelve `NULL` de forma
invisible.

## Detalles

El resultado final es equivalente a ejecutar
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md),
pero este comando se ejecuta en GitHub, no localmente.

## Ver también

Sitios pkgdown:
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md),
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md)

Flujos de trabajo de GitHub Actions:
[`ros_actions_check_cron()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_check_cron.md),
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md)

## Ejemplos

``` r
pkg <- file.path(tempdir(), "pkgdown-docs")
if (!dir.exists(pkg)) {
  dir.create(pkg)
}
ros_actions_pkgdown_docs(pkg)
#> ✔ Adding "^docs$", "^_pkgdown\\.yml$", "^_pkgdown\\.yaml$", "^\\.github$", and
#>   "^pkgdown$" to /tmp/Rtmp7JgT3n/pkgdown-docs/.Rbuildignore.
#> ✔ Adding "*.html", "R-version", and "depends.Rds" to
#>   /tmp/Rtmp7JgT3n/pkgdown-docs/.github/.gitignore.
#> ✔ ¡Proceso completado!
```
