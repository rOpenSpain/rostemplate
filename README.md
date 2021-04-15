# rostemplate

<!-- badges: start -->
[![rOS-badge](https://ropenspain.github.io/rostemplate/reference/figures/ropenspain-badge.svg)](https://ropenspain.es/)
[![R build status](https://github.com/ropenspain/rostemplate/workflows/R-CMD-check/badge.svg)](https://github.com/ropenspain/rostemplate/actions)
[![codecov](https://codecov.io/gh/ropenspain/rostemplate/branch/main/graph/badge.svg)](https://codecov.io/gh/ropenspain/rostemplate)
[![lifecycle](https://lifecycle.r-lib.org/articles/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html)
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
