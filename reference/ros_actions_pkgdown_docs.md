# Instala una acción GitHub que crea tu sitio en la carpeta `/docs`

Esta acción GitHub genera tu sitio
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

  Sobreescribe la acción si ya se encuntra instalada.

## Detalles

El resultado final es equivalente a ejecutar
[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md)
con la única diferencia de que este comando se ejecuta en GitHub, en
lugar de tener que ser ejecutado por el usuario.

## Ver también

[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md),
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md).
