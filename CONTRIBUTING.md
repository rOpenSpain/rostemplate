# Contribuir a rostemplate

Esta guía explica cómo proponer cambios para **rostemplate**. Antes de
enviar una contribución importante, consulta la [guía de contribución al
desarrollo](https://rstd.io/tidy-contrib) y los [principios de revisión
de código](https://code-review.tidyverse.org/).

## Corregir erratas

Puedes corregir erratas y errores ortográficos o gramaticales de la
documentación directamente desde la interfaz web de **GitHub**, siempre
que edites el archivo fuente. Por lo general, esto significa editar los
[comentarios de
**roxygen2**](https://roxygen2.r-lib.org/articles/roxygen2.html) en un
archivo `.R`, no en un archivo `.Rd`. La primera línea del archivo `.Rd`
indica qué archivo `.R` lo genera.

## Cambios de mayor alcance

Antes de proponer un cambio de mayor alcance, abre una incidencia y
confirma que el equipo de **rOpenSpain** considera que es necesario. Si
encuentras un error, abre una incidencia que lo ilustre con un
[**reprex**](https://www.tidyverse.org/help/#reprex) mínimo. Esto
también te ayudará a escribir una prueba unitaria si es necesario.
Consulta nuestra guía sobre [cómo crear una buena
incidencia](https://code-review.tidyverse.org/issues/) para obtener más
recomendaciones.

### Proceso para crear un pull request

- Crea un *fork* del paquete y clónalo en tu equipo. Si no lo has hecho
  antes, usa
  `usethis::create_from_github("rOpenSpain/rostemplate", fork = TRUE)`.
- Instala todas las dependencias de desarrollo con
  `devtools::install_dev_deps()` y comprueba que el paquete supera
  `R CMD check` mediante `devtools::check()`. Si la comprobación no
  termina sin problemas, pide ayuda antes de continuar.
- Crea una rama de **Git** para el *pull request* (PR) mediante
  `usethis::pr_init("descripcion-breve-del-cambio")`.
- Realiza los cambios, crea los *commits* en **Git** y abre el PR
  mediante
  [`usethis::pr_push()`](https://usethis.r-lib.org/reference/pull-requests.html).
  Sigue después las indicaciones del navegador. El título del PR debe
  describir brevemente el cambio y su cuerpo debe contener
  `Fixes #numero-de-incidencia`.
- Para cambios visibles para el usuario, añade una viñeta al principio
  de `NEWS.md`, justo después del primer encabezado. Sigue el estilo
  descrito en <https://style.tidyverse.org/news.html>.

### Estilo del código

- El código nuevo debe seguir la [guía de estilo de
  **tidyverse**](https://style.tidyverse.org). Puedes usar
  [**Air**](https://posit-dev.github.io/air/) para aplicar este estilo,
  pero no reformatees código que no esté relacionado con el PR.
- Usamos [**roxygen2**](https://cran.r-project.org/package=roxygen2) con
  sintaxis
  [**Markdown**](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html)
  para la documentación.
- Usamos [**testthat**](https://cran.r-project.org/package=testthat)
  para las pruebas unitarias. Las contribuciones que incluyen pruebas
  son más fáciles de aceptar.

## Código de conducta

El proyecto **rostemplate** se publica con un [código de conducta para
colaboradores](https://ropenspain.github.io/rostemplate/CODE_OF_CONDUCT.md).
Al contribuir a este proyecto, aceptas cumplir sus condiciones.
