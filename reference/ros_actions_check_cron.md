# Crea una acción GitHub que comprueba tu paquete de manera regular

La acción GitHub creada ejecuta `R CMD check` para tu paquete. La
configuración por defecto ejecuta el check de manera mensual los dias 1
de mes a las 08:30 AM.

## Uso

``` r
ros_actions_check_cron(pkg = ".", overwrite = TRUE)
```

## Argumentos

- pkg:

  Ruta a la raíz del paquete.

- overwrite:

  Sobreescribe la acción si ya se encuntra instalada.

## Detalles

Puedes aprender cómo configurar la acción cron en el siguiente link:

<https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#schedule>

La configuración por defecto `"30 08 1 * *""` ("A las 08:30 del
dia-del-mes 1.").

Usa [crontab.guru](https://crontab.guru/#30_08_1_*_*) para crear tus
propia configuración cron.
