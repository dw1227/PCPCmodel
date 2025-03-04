% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PCPCmodel.R
\name{calculate_eGA}
\alias{calculate_eGA}
\title{Calculate Epigenetic Gestational Age}
\usage{
calculate_eGA(beta_matrix)
}
\arguments{
\item{beta_matrix}{A matrix or data frame of beta values, with CpG sites as rows and samples as columns. Row names should be CpG IDs, and column names should be sample IDs.}
}
\value{
A named numeric vector of gestational ages, with sample IDs as names.
}
\description{
This function computes the epigenetic gestational age (eGA) for multiple samples based on a matrix or data frame of beta values.
}
\details{
Placental Clock

This package provides a function to calculate the epigenetic gestational age (eGA)
using a predefined linear model based on beta values of specific CpG sites.
}
