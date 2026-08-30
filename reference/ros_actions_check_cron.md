# Crea un flujo de trabajo de GitHub Actions para comprobar tu paquete

El flujo de trabajo de GitHub Actions creado ejecuta `R CMD check` para
tu paquete. La configuración por defecto ejecuta la comprobación el día
1 de cada mes a las 08:30.

## Uso

``` r
ros_actions_check_cron(pkg = ".", overwrite = TRUE)
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

Consulta cómo configurar la ejecución programada en el siguiente enlace:

<https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#schedule>

La configuración por defecto es `"30 08 1 * *"` ("a las 08:30 del día 1
de cada mes").

Usa [crontab.guru](https://crontab.guru/#30_08_1_*_*) para crear tu
propia configuración cron.

## Ver también

Flujos de trabajo de GitHub Actions:
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md),
[`ros_actions_pkgdown_docs()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_docs.md)

## Ejemplos

``` r
pkg <- file.path(tempdir(), "pkgdown-cron")
if (!dir.exists(pkg)) {
  dir.create(pkg)
}
ros_actions_check_cron(pkg)
#> ✔ Adding "^docs$", "^_pkgdown\\.yml$", "^_pkgdown\\.yaml$", "^\\.github$", and
#>   "^pkgdown$" to /tmp/RtmpwKExIJ/pkgdown-cron/.Rbuildignore.
#> ✔ Adding "*.html", "R-version", and "depends.Rds" to
#>   /tmp/RtmpwKExIJ/pkgdown-cron/.github/.gitignore.
#> ✔ ¡Proceso completado!
```
