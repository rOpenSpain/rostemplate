# Instala una acción GitHub que genera tu sitio en la rama `gh-pages`

Instala una acción GitHub que crea el sitio
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

  Sobreescribe la acción si ya se encuntra instalada.

## Ver también

[`ros_build()`](https://ropenspain.github.io/rostemplate/reference/ros_build.md),
[`ros_actions_pkgdown_docs()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_docs.md)
