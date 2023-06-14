
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rostemplate <img src="man/figures/logo.png" align="right" width="120"/>

<!-- badges: start -->

[![rOS-badge](https://ropenspain.github.io/rostemplate/reference/figures/ropenspain-badge.svg)](https://ropenspain.es/)
[![r-universe](https://ropenspain.r-universe.dev/badges/rostemplate)](https://ropenspain.r-universe.dev/rostemplate)
[![R build
status](https://github.com/ropenspain/rostemplate/workflows/R-CMD-check/badge.svg)](https://github.com/ropenspain/rostemplate/actions)
[![codecov](https://codecov.io/gh/ropenspain/rostemplate/branch/main/graph/badge.svg)](https://app.codecov.io/gh/ropenspain/rostemplate)
[![lifecycle](https://lifecycle.r-lib.org/articles/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

Esta librería es una plantilla `pkgdown` adaptada al sitio web de
[rOpenSpain](https://ropenspain.es/).

Esta plantilla es una plantilla privada para uso exclusivo de los
paquetes de rOpenSpain. Por favor, no la uses para otros paquetes.

## Introducción

Este paquete proporciona una plantilla de `pkgdown` adaptada a la
empleada por la comunidad [rOpenSpain](https://ropenspain.es/), que a su
vez es una adaptación de la plantilla
[Universal](https://bootstrapious.com/p/universal-business-e-commerce-template)
creada por
[Bootstrapius](https://bootstrapious.com/p/universal-business-e-commerce-template)
con la variación de color **violet**.

## Configuración previa

En la raíz del proyecto ha de existir un archivo `_pkgdown.yml` con al
menos las siguientes líneas:

``` yaml
template:
  package: rostemplate
  # No pongas la siguiente línea!
  default_assets: false
```

Puedes encontrar información sobre cómo configurar otras opciones en
`_pkgdown.yml` [aquí](https://pkgdown.r-lib.org/articles/pkgdown.html).

Adicionalmente, es necesario añadir al archivo `.Rbuildignore` las
siguientes líneas:

``` default
^\.github$
^docs$
^_pkgdown\.yml$
```

## Uso de la plantilla

Esta sección detalla diferentes opciones para generar un sitio estático
para el paquete deseado con el formato definido por esta plantilla. El
resultado de este paso es la generación de un sitio estático compuesto
de los archivos `html`, `css`, etc. basados en el paquete de R para el
que se está generando el sitio.

### Con GitHub actions - CI

GitHub Actions permite automatizar procesos cuando se activa un
*trigger*. En este caso se han preparado dos acciones que actualizan el
sitio estático cada vez que se añade un *commit* al repositorio.

Los flujos de trabajo consisten en archivos con extensión `.yaml`. La
acción
[rostemplate-docs.yaml](https://github.com/ropenspain/rostemplate/blob/main/inst/yaml/rostemplate-docs.yaml)
crea el sitio estático en la carpeta `./docs` mientras que
[rostemplate-gh-pages.yaml](https://github.com/ropenspain/rostemplate/blob/main/inst/yaml/rostemplate-gh-pages.yaml)
crea el sitio estático en el branch `gh-pages`.

Para configurar esta opción, es necesario disponer en el repositorio de
una carpeta en la ruta `.github/workflows` y copiar la acción deseada en
dicha carpeta.

#### Alternativa usando las funciones de `rostemplate`

Aunque el uso del paquete `rostemplate` en si no es necesario con GitHub
actions, se han desarrollado dos funciones que automatizan esta
configuración de manera automática. Estas funciones simplemente crean el
directorio `.github/workflows` si no existiera previamente y copian los
archivos solicitados en la ruta correspondiente. Adicionalmente, crean
los archivos `.Rbuildignore` y `.github/.gitignore`, que ignoran ciertos
archivos cuando se compila el paquete:

``` r
# Instalación via r-universe

install.packages("rostemplate",
  repos = c("https://ropenspain.r-universe.dev", "https://cloud.r-project.org")
)

# Deploy to gh-branch

rostemplate::ros_actions_pkgdown_branch()


# Deploy to docs folder
rostemplate::ros_actions_pkgdown_docs()
```

Es posible cambiar el evento que desencadena la actualización del sitio:

``` yaml
# Actualiza en cada commit - por defecto
on:
  push:
    branches:
      - main
      - master
      
# Actualiza cuando se modifica un archivo específico: _pkgdown.yaml

on:
  push:
    paths:
      - '_pkgdown.yaml'
```

Más información sobre cómo adaptar los *triggers* de la acción
[aquí](https://docs.github.com/es/free-pro-team@latest/actions/reference/events-that-trigger-workflows).

### RStudio - manual

El sitio estático se puede generar igualmente desde una sesión local en
RStudio. Para ello, es necesario instalar este paquete:

``` r
install.packages("rostemplate",
  repos = c("https://ropenspain.r-universe.dev", "https://cloud.r-project.org")
)
```

Una vez instalado, se ha de ejecutar este script:

``` r
rostemplate::ros_build()
```

La función `rostemplate::ros_build()` no es más que un alias de
`pkgdown::build_site()`, aportando únicamente un control sobre la
configuración del archivo `_pkgdown.yml`

Una vez generado el sitio, es necesario actualizar el repositorio remoto
en GitHub mediante un *commit*.

## GitHub Pages

Una vez generado el sitio estático y subido al repositorio en GitHub, el
último paso es activar el sitio web a través de los *Settings* de
nuestro repositorio (*Setting\>GitHub Pages*), seleccionando el origen
deseado (`gh-pages`, `main/docs`, etc.).
