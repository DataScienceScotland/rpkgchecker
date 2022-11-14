
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rpkgchecker

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

Tools to check R package dependencies, minimum R versions and comparison
with internal copy of package install files.

The package can be used to generate a list of direct download links for
packages and dependent packages, for example:

  - If need to acquire a new package, this tool will check for any
    dependent packages required.
  - If wish to upgrade to a specific version of a package, this will
    check if available in the CRAN repository to be used for your
    release of R.
  - If wish to acquire a new copy of all packages on a server currently
    and any check for any new dependencies.

## Where packages are searched

The process makes use of the base R `available.packages` function.

The `contriburl` argument of `available.packages` allows to specify the
URL for a particular repository.

This package’s functions `available_packages_tb` and
`available_packages_long` allow for a specific CRAN repository to be
specified with the `cran_repo_url` argument.

However, by default this `cran_repo_url` is set to search compiled
Windows Binary repositories based on the R release being used while
running the function.

Behind the scenes this code is used to derive the Windows Binary URL for
the current R release and then search it in `available.packages`:

``` r
search_url <- utils::contrib.url(
      repos = "https://cran.r-project.org/",
      type = "win.binary"
    )
    
  available_packages <- utils::available.packages(
    contriburl = search_url,
    filters = c("duplicates"), ignore_repo_cache = TRUE
  )    
```

In locked down systems where Windows dominates this is thought to be the
most useful search.

## Installation

Install the package from GitHub with devtools.

``` r
devtools::install_github("tomwilsonsco/rpkgchecker@main")
```

## Example

This shows a possible workflow using the available functions.

``` r
library(rpkgchecker) # load the rpkgchecker package

# get a tibble of available packages with 1 dependent package per row
available_long_tb <- available_packages_long()

# filter to a specific package, here "fabletools"
# this will get all dependencies by querying its dependency tree recursively
required_tb <- search_requirements(available_long_tb, "fabletools")

# get all packages stored on a shared server as windows binaries
server_tb <- existing_server_packages("//s1428a/R_Packages/R_3_6_3_Packages")

# compare the required packages with those available and indicate which 
# need to be acquired or upgraded
compare_tb <- compare_available_server(required_tb, server_tb)
```

## Acquiring searching dependencies for all existing packages on a server

In locked down IT situations, might have internal server storing R
packages for install internally.

The functions in this package can be used to refresh the download link
for the latest package versions corresponding to current R release and
check for new dependencies.

``` r
# get a tibble of available packages with 1 dependent package per row
available_long_tb <- available_packages_long()

# get all packages stored on a shared server as windows binaries
server_tb <- existing_server_packages("//s1428a/R_Packages/R_3_6_3_Packages")

# search for all existing server packages, depdendent packages and return install versions and links corresponding to current R release.
search_multiple_tb <- search_requirements_multiple(available_long_tb, 
                                                   server_tb$server_package)
```
