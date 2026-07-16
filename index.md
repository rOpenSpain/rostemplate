
<!-- index.md is generated from index.Rmd. Please edit that file -->

# rostemplate <img src="man/figures/logo.png" align="right" width="120"/>

<!-- badges: start -->

[![rOS-badge](https://ropenspain.github.io/rostemplate/reference/figures/ropenspain-badge.svg)](https://ropenspain.es/)
[![r-universe](https://ropenspain.r-universe.dev/badges/rostemplate)](https://ropenspain.r-universe.dev/rostemplate)
[![R build
status](https://github.com/ropenspain/rostemplate/workflows/R-CMD-check/badge.svg)](https://github.com/ropenspain/rostemplate/actions)
[![codecov](https://codecov.io/gh/ropenspain/rostemplate/branch/main/graph/badge.svg)](https://app.codecov.io/gh/ropenspain/rostemplate)
[![lifecycle](https://lifecycle.r-lib.org/articles/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

Este paquete proporciona una plantilla **pkgdown** adaptada al sitio web
de [rOpenSpain](https://ropenspain.es/).

Esta plantilla es una plantilla privada para uso exclusivo de los
paquetes de **rOpenSpain**. Por favor, no la uses para otros paquetes.

## Introducción

La plantilla de **pkgdown** está adaptada a la empleada por la comunidad
[rOpenSpain](https://ropenspain.es/), que a su vez es una adaptación de
la plantilla
[Universal](https://devcows.github.io/hugo-universal-theme/) creada por
[DevCows](https://github.com/devcows) con la variación de color
**violet**.

## Configuración previa

En la raíz del proyecto ha de existir un archivo `_pkgdown.yaml` con al
menos las siguientes líneas:

<div class="code-with-filename">

<div class="code-with-filename-file">

<pre><strong>_pkgdown.yaml</strong></pre>

``` yaml
template:
  bootstrap: 5
  package: rostemplate
  # No pongas la siguiente línea!
  default_assets: false
```

</div>

</div>

Puedes encontrar información sobre cómo configurar otras opciones en
`_pkgdown.yaml` [aquí](https://pkgdown.r-lib.org/articles/pkgdown.html).

Adicionalmente, es necesario añadir al archivo `.Rbuildignore` las
siguientes líneas:

<div class="code-with-filename">

<div class="code-with-filename-file">

<pre><strong>.Rbuildignore</strong></pre>

``` default
^\.github$
^docs$
^_pkgdown\.yaml$
```

</div>

</div>

## Uso de la plantilla

Esta sección detalla diferentes opciones para generar un sitio
**pkgdown** con el formato definido por esta plantilla. El resultado es
un sitio estático compuesto por archivos `html`, `css` y otros recursos
basados en el paquete de **R** correspondiente.

### Con workflows de GitHub Actions

GitHub Actions permite automatizar procesos cuando se activa un
*trigger*. En este caso se han preparado dos workflows que actualizan el
sitio **pkgdown** cada vez que se añade un *commit* al repositorio.

Los workflows son archivos con extensión `.yaml`. El workflow
[rostemplate-docs.yaml](https://github.com/ropenspain/rostemplate/blob/main/inst/yaml/rostemplate-docs.yaml)
crea el sitio **pkgdown** en la carpeta `./docs`, mientras que
[rostemplate-gh-pages.yaml](https://github.com/ropenspain/rostemplate/blob/main/inst/yaml/rostemplate-gh-pages.yaml)
crea el sitio **pkgdown** en la rama `gh-pages`.

Para configurar esta opción, es necesario disponer en el repositorio de
una carpeta en la ruta `.github/workflows` y copiar el workflow deseado
en dicha carpeta.

#### Alternativa usando las funciones de rostemplate

Aunque el uso del paquete **rostemplate** en sí no es necesario con
GitHub Actions, se han desarrollado dos funciones que automatizan esta
configuración. Estas funciones crean el directorio `.github/workflows`
si no existiera previamente y copian los archivos solicitados en la ruta
correspondiente. Adicionalmente, crean los archivos `.Rbuildignore` y
`.github/.gitignore`, que ignoran ciertos archivos cuando se compila el
paquete:

``` r
# Instalación vía r-universe
install.packages(
  "rostemplate",
  repos = c("https://ropenspain.r-universe.dev", "https://cloud.r-project.org")
)

# O usando pak.
pak::pak("ropenspain/rostemplate")

# Publicar en la rama gh-pages
rostemplate::ros_actions_pkgdown_branch()

# Publicar en la carpeta docs
rostemplate::ros_actions_pkgdown_docs()
```

Es posible cambiar el evento que desencadena la actualización del sitio:

<div class="code-with-filename">

<div class="code-with-filename-file">

<pre><strong>rostemplate-gh-pages.yaml</strong></pre>

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

</div>

</div>

Más información sobre cómo adaptar los *triggers* del workflow
[aquí](https://docs.github.com/es/free-pro-team@latest/actions/reference/events-that-trigger-workflows).

### RStudio - manual

El sitio estático se puede generar igualmente desde una sesión local en
**RStudio**. Para ello, es necesario instalar este paquete:

``` r
install.packages(
  "rostemplate",
  repos = c("https://ropenspain.r-universe.dev", "https://cloud.r-project.org")
)
```

Una vez instalado, se ha de ejecutar este script:

``` r
rostemplate::ros_build()
```

La función `rostemplate::ros_build()` es un alias de
`pkgdown::build_site()` que añade un control sobre la configuración del
archivo `_pkgdown.yaml`.

Una vez generado el sitio, es necesario actualizar el repositorio remoto
en GitHub mediante un *commit*.

## GitHub Pages

Una vez generado el sitio estático y subido al repositorio en GitHub, el
último paso es activar el sitio web a través de los *Settings* del
repositorio (*Settings \> GitHub Pages*) y seleccionar el origen deseado
(`gh-pages`, `main/docs`, etc.).
