# Crea un workflow de GitHub Actions que comprueba tu paquete regularmente

El workflow de GitHub Actions creado ejecuta `R CMD check` para tu
paquete. La configuración por defecto ejecuta el check de manera mensual
los días 1 de cada mes a las 08:30.

## Uso

``` r
ros_actions_check_cron(pkg = ".", overwrite = TRUE)
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

Puedes aprender cómo configurar la acción cron en el siguiente enlace:

<https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#schedule>

La configuración por defecto es `"30 08 1 * *"` ("a las 08:30 del día 1
de cada mes").

Usa [crontab.guru](https://crontab.guru/#30_08_1_*_*) para crear tu
propia configuración cron.

## Ejemplos

``` r
pkg <- file.path(tempdir(), "pkgdown-cron")
if (!dir.exists(pkg)) {
  dir.create(pkg)
}
ros_actions_check_cron(pkg)
#> ✔ Adding "^docs$", "^_pkgdown\\.yml$", "^_pkgdown\\.yaml$", "^\\.github$", and
#>   "^pkgdown$" to /tmp/Rtmp2HXM7h/pkgdown-cron/.Rbuildignore.
#> ✔ Adding "*.html", "R-version", and "depends.Rds" to
#>   /tmp/Rtmp2HXM7h/pkgdown-cron/.github/.gitignore.
#> Success!
```
