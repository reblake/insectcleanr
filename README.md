
<!-- README.md is generated from README.Rmd. Please edit that file -->

# insectcleanr

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![DOI](https://zenodo.org/badge/314375251.svg)](https://zenodo.org/badge/latestdoi/314375251)
<!-- badges: end -->

The goal of insectcleanr is to provide functions for building cleaned
data tables of insect data. This code package was developed for internal
use by a SESYNC pursuit team by SESYNC data science staff.

## Publication and Citation

This package has been published on
[Zenodo](https://zenodo.org/record/4555787). It should be cited with the
[DOI](https://doi.org/10.5281/zenodo.4555787) as:

Rachael E. Blake, & Rebecca Turner. (2021, February 22).
reblake/insectcleanr: Initial release (Version 0.1). Zenodo.
<http://doi.org/10.5281/zenodo.4555787>

## Installation

You can install the latest version of insectcleanr from
[GitHub](https://github.com/reblake/insectcleanr) with:

``` r
# install.packages("devtools")
devtools::install_github("reblake/insectcleanr")
```

## Example

Example data in this package is courtesy of Morimoto, N., Kiritani, K.,
Yamamura, K., & Yamanaka, T. (2019). Finding indications of lag time,
saturation and trading inflow in the emergence record of exotic
agricultural insect pests in Japan. Applied Entomology and Zoology,
54(4), 437-450.
[DOI:10.1007/s13355-019-00640-2](https://doi.org/10.1007/s13355-019-00640-2)

This is a basic example which shows you how to get accepted taxonomic
information for insect taxa from GBIF.

``` r
library(insectcleanr)

# list the path(s) to your raw data files
# your path will look different than this; this path loads the example data included in this package
file_list <- system.file("extdata", "Japan_taxa.xlsx", package = "insectcleanr", mustWork = TRUE)

# read in raw data and separate out taxonomic information
taxa_list <- lapply(file_list, separate_taxonomy) %>%
             purrr::reduce(full_join) %>%  # join list of dataframes into one dataframe
             distinct(genus_species) %>%  # get unique taxa names
             arrange(genus_species) %>%  # alphabetical order by taxa name
             select(genus_species) %>%  # select only the column with taxa names
             unlist(., use.names = FALSE)  # make taxa names into a vector
              
# get accepted taxonomic information from GBIF
taxa_accepted <- lapply(taxa_list, get_accepted_taxonomy)
```

A full workflow for making a taxonomy table and other tables is
available in the vignettes.
