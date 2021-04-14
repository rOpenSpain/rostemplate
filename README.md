# rostemplate

<!-- badges: start -->
[![R build status](https://github.com/ropenspain/rostemplate/workflows/R-CMD-check/badge.svg)](https://github.com/ropenspain/rostemplate/actions)
[![codecov](https://codecov.io/gh/ropenspain/rostemplate/branch/main/graph/badge.svg)](https://codecov.io/gh/ropenspain/rostemplate)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![rOS-badge](https://img.shields.io/badge/rOpenSpain--green?style=social&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABmJLR0QA/wD/AP+gvaeTAAAAB3RJTUUH5AwHABsBxxfdgAAAAF50RVh0UmF3IHByb2ZpbGUgdHlwZSBpcHRjAAppcHRjCiAgICAgIDI4CjM4NDI0OTRkMDQwNDAwMDAwMDAwMDAwZjFjMDI2ZTAwMDM1MjQ2NDcxYzAyMDAwMDAyMDAwNDAwCmCaPZ4AAARaSURBVFjDxZddbBRVFMf//zuzu+30A9qCpRDbWKKWiIQHA0TAIFCJMcUCIhAEoxATiab4oNEHE/VRE+EBTJRAlGglEENLQpCKCC0fIWqbqBBoASl0u7Ur/WLdzu7MvceHLfIRaQrspv9kXiaTe35z/vecew9xl6pvegniQSmHT1DhfQIFRuQjz9WHLUv51XO+uav1ONIPv/thLfIe8uBGrYlUXEfF9SBKAQCCqIj52mjzWbQ1eb7gwSCWza9ND8Cuvc/DKcmHaMlVNpdAYSPJ6QDU7d+KSKsY2SLa1FohdTXe7ePFZ3fdO0D9idUQjYAKqDlUeItkJYisYVcU+AI5DiObtK8PUtEdCPtY88LukQPsbXwZbsxmTmGyggpvklwJouCuzBWJiUi9GNms3WQzbdtUz/l2eIC6H1+BPT4O80/gAVpYQ3IDyHLcj0Q6RWSHGLNt8kxePndEsPTp2lsBRPrQ0LwRTijXibmxKgOpATEDgIX0SCDyB8Et2XbW7t74332Lpm9EjjMXVFQAMFYENWXlhTMqpo2fFwhajoggnSIJrU3y4rnek62nu08IzCYCUaaSIA+PK845+syy0pKQQyC9sW+R0cDR/ZGuS229TwFos69Hy80PcPaiccgvsCCZAiDgJYDTv/biUlvqlX3DJEBrgdaSOYChDNxsr8Ioa9QB7KFNCAJQJEjeoZwlUwCp9XuiCb1nWzuCIXVbYGBMYRALlhTDyVVp3x92wFbwfN2xeEXFsbFFzoqbA5BAbMBD06GLmDW/CE5eMO0lah89/Tr6EwkXOtEJMBX1JoCrfw2i5VQ4Y61BdUf6oZQF39OpMvTNrY8WSAY7k9K+B6basRmVMjTig0Nn0qgACGQotIxOI1IZdXhEnZDX7c88BwEqXrc8BUAE4HsuIGyDyEDmUk1oD/j9VB/C7TEXgA8AalnlLiTjCXgJ+cpoWS5Gvocgmb6LSOoyculcHDs3XdDbPzl7LHIlVqPIKyRTh1H17FrEzntJ2tKgk/5KY/QGEfntfmwhU3/d0+2j7ssObP3gzIXGA+F3YgPuUkD2OXbIF5Eb94G1r+4BAOxpWN7/WOXU7W0nWxtUUK032qwjOEkpDh1bI0i3RQxe0/i5sQc/7eu82t7WX6u12ZoXcFpdnRTP+Ih57vBzQX3jKiyeW823P9z65M7PW3ZWrS4tn7WwCMEsBWPkjj77vuBsyzUc2ht2zzT3NCRc71OL6rgR8f+v3oYdTGwqKEJ5BguzcwLvTptZNLdy6US7fEouaAnE3Eg3QIT/HMThuoj5pSna3N87uJlgvUBiZSWT0B4J39toNsHJR1d8AAQLBVhVOD77jVkLih+dVzWBxZNCAIG+qIfjB6NoOhC53NUR+0IgOwBEHCuIuE7Tfs6yQlhZ9hwAlpPq49LJY7rW1EyR196bKo9MLeq1bWsbgMdz7GwGVSBzvcSijaAKWgDmBYL2kVAo0Ayg2qIV4siH7f/0L7Kq+91zoPR0AAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTEyLTA3VDAwOjI3OjAwKzAwOjAwWgYBiAAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0xMi0wN1QwMDoyNzowMCswMDowMCtbuTQAAAAASUVORK5CYII=)](https://ropenspain.es/)
<!-- badges: end -->


This package is a `pkgdown` template adapted to 
[rOpenSpain](https://ropenspain.es/) site.

This is a private template for use by core rOpenSpain packages. 
Please don’t use it for your own code.

Guidelines on how to use this template 
package on 
[this vignette](https://ropenspain.github.io/rostemplate/articles/rostemplate.html) 
(Spanish).

## Setup

Add a `_pkgdown.yml` file that contains at least these lines:

```yaml
template:
  package: rostemplate
```

Also, add a `.Rbuildignore` file on the root of your repo with these lines:

```
^\.github$
^docs$
^_pkgdown\.yml$
```

## Using `rostemplate`

It is possible to deploy your `pkgdown` site along with `rostemplate` via CI 
(GitHub Actions) or locally, that provides more control but it is 
not automatic.

### Option A: Deploy using GitHub Actions

It is not necessary to install `rostemplate` itself. Just select the GitHub
action that you want to use for deploy the `pkgdown` version of your page
([rostemplate-docs.yaml](https://github.com/ropenspain/rostemplate/blob/main/inst/yaml/rostemplate-docs.yaml) or [rostemplate-gh-pages.yaml](https://github.com/ropenspain/rostemplate/blob/main/inst/yaml/rostemplate-gh-pages.yaml)) and copy the file into your 
`.github/workflows/` folder.

### Option B: Deploy installing `rostemplate` 

Install the package from the GitHub repo:

```r
# Deploy to gh-branch
if (require("remotes")) {
  remotes::install_github("ropenspain/rostemplate",
                          build_vignettes = TRUE)
}
```

You can use any of the three functions included. `ros_gh_actions_branch()` and 
`ros_gh_actions_docs_folder()` would set up the actions described before but 
the deployment would be still performed by a GitHub action.

For building locally your package into your `docs` folder use:

```r

rostemplate::ros_build()

# or you can use also

pkgdown::build_site

```

## Commit to GitHub and deploy

Last step is commit to GitHub, wait until the GitHub action ends (in the case
you chose to deploy in that way) and deploy the website via 
*YOUR_GITHUB_REPO>Settings>GitHub Pages*.
