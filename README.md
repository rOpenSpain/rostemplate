# rostemplate

<!-- badges: start -->
[![R build status](https://github.com/dieghernan/pkgdowntemp/workflows/R-CMD-check/badge.svg)](https://github.com/dieghernan/pkgdowntemp/actions)
[![codecov](https://codecov.io/gh/dieghernan/rostemplate/branch/main/graph/badge.svg)](https://codecov.io/gh/dieghernan/rostemplate)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->


This package is a `pkgdown` template adapted to 
[rOpenSpain](https://ropenspain.es/) site.

This package is a proof of concept. Guidelines on how to use this template 
package on 
[this vignette](https://dieghernan.github.io/rostemplate/articles/rostemplate.html) 
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
([rostemplate-docs.yaml](https://github.com/dieghernan/rostemplate/blob/main/inst/yaml/rostemplate-docs.yaml) or [rostemplate-gh-pages.yaml](https://github.com/dieghernan/rostemplate/blob/main/inst/yaml/rostemplate-gh-pages.yaml)) and copy the file into your 
`.github/workflows/` folder.

### Option B: Deploy installing `rostemplate` 

Install the package from the GitHub repo:

```r
# Deploy to gh-branch
if (require("remotes")) {
  remotes::install_github("dieghernan/rostemplate",
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
