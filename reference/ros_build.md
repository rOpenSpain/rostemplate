# Genera tu sitio [pkgdown](https://CRAN.R-project.org/package=pkgdown) en local

Esta función es un wrapper de
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html).

## Uso

``` r
ros_build(pkg = ".", ...)
```

## Argumentos

- pkg:

  Path to package.

- ...:

  Arguments passed on to
  [`pkgdown::build_site`](https://pkgdown.r-lib.org/reference/build_site.html)

  `examples`

  :   Run examples?

  `run_dont_run`

  :   Run examples that are surrounded in \dontrun?

  `seed`

  :   Seed used to initialize random number generation in order to make
      article output reproducible. An integer scalar or `NULL` for no
      seed.

  `lazy`

  :   If `TRUE`, will only rebuild articles and reference pages if the
      source is newer than the destination.

  `override`

  :   An optional named list used to temporarily override values in
      `_pkgdown.yml`

  `preview`

  :   If `TRUE`, or `is.na(preview) && interactive()`, will preview
      freshly generated section in browser.

  `devel`

  :   Use development or deployment process?

      If `TRUE`, uses lighter-weight process suitable for rapid
      iteration; it will run examples and vignettes in the current
      process, and will load code with
      [`pkgload::load_all()`](https://pkgload.r-lib.org/reference/load_all.html).

      If `FALSE`, will first install the package to a temporary library,
      and will run all examples and vignettes in a new process.

      `build_site()` defaults to `devel = FALSE` so that you get high
      fidelity outputs when you building the complete site;
      `build_reference()`, `build_home()` and friends default to
      `devel = TRUE` so that you can rapidly iterate during development.

  `new_process`

  :   If `TRUE`, will run `build_site()` in a separate process. This
      enhances reproducibility by ensuring nothing that you have loaded
      in the current process affects the build process.

  `install`

  :   If `TRUE`, will install the package in a temporary library so it
      is available for vignettes.

  `quiet`

  :   If `FALSE`, generate build messages for build functions that take
      `quiet` arguments.

## Detalles

La única diferencia con
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html)
es que te recuerda los pasos a seguir para configurar `rostemplate`, y
pide confirmación antes de ejecutar
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html).
El resultado se genera en la carpeta `/docs`.

Al contrario que
[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md),
esta acción se ejecuta por el usuario.

## Ver también

[`ros_actions_pkgdown_branch()`](https://ropenspain.github.io/rostemplate/reference/ros_actions_pkgdown_branch.md),
[`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html).
