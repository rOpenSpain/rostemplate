# rostemplate (development version)

- Corrige la instalación de workflows desde `ros_actions_check_cron()`, `ros_actions_pkgdown_branch()` y `ros_actions_pkgdown_docs()`, y hace que `ros_build()` respete el argumento `pkg`.
- Añade una nueva paleta de colores `ros_metro_madrid_pal()`.
- Nuevo modo oscuro.

# rostemplate 0.2.0

**Importante:** la configuración mínima en `_pkgdown.yaml` ha de ser:

``` yaml
template:
  bootstrap: 5
  package: rostemplate
```

Otros cambios:

- Adaptación a Bootstrap 5 con la nueva versión de **pkgdown**.
- Añade paletas de colores.
- Documentación en castellano.

# rostemplate 0.0.4

- Actualiza el logo y los favicons, creados con **hexSticker**.
- Actualiza los workflows de GitHub Actions.
- Renombra las funciones principales.
- Usa el paquete **testthat**.

# rostemplate 0.0.3

- Añade `ros_badge_ropenspain()`:
  [![rOS-badge](https://ropenspain.github.io/rostemplate/reference/figures/ropenspain-badge.svg)](https://ropenspain.es/)

# rostemplate 0.0.2

- Traslada el paquete a [**rOpenSpain**](https://github.com/rOpenSpain/rostemplate).

# rostemplate 0.0.1

- Primera versión estable.
