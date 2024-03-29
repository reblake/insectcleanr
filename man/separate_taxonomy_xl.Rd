% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/separate_functions.R
\name{separate_taxonomy_xl}
\alias{separate_taxonomy_xl}
\title{separate_taxonomy_xl: a function that cleans the dataframes and separates taxonomy columns using xl files}
\usage{
separate_taxonomy_xl(df_location)
}
\arguments{
\item{df_location}{location of files containing raw insect data}
}
\value{
dataframe
}
\description{
separate_taxonomy_xl: a function that cleans the dataframes and separates taxonomy columns using xl files
}
\examples{
\dontrun{
file_list <- system.file("extdata", "Japan_taxa.xlsx", package = "insectcleanr", mustWork = TRUE)
taxa_list <- lapply(file_list, separate_taxonomy_xl)
}
}
