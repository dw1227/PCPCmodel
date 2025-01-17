#' Placental Clock
#'
#' This package provides a function to calculate the epigenetic gestational age (eGA)
#' using a predefined linear model based on beta values of specific CpG sites.

#' @title Calculate Epigenetic Gestational Age
#' @description This function computes the epigenetic gestational age (eGA) for multiple samples based on a matrix or data frame of beta values.
#' @param beta_matrix A matrix or data frame of beta values, with CpG sites as rows and samples as columns. Row names should be CpG IDs, and column names should be sample IDs.
#' @return A named numeric vector of gestational ages, with sample IDs as names.
#' @export
calculate_eGA <- function(beta_matrix) {
  # Read coefficients from the internal data
  coefficients_data <- coefficients

  # Extract required CpGs and coefficients
  required_cpgs <- coefficients_data$CpG
  coefficients <- setNames(coefficients_data$Coefficient, coefficients_data$CpG)

  # Check if all required CpGs are present in the input
  missing_cpgs <- setdiff(required_cpgs, rownames(beta_matrix))
  if (length(missing_cpgs) > 0) {
    stop("The following CpGs are missing in the input: ", paste(missing_cpgs, collapse = ", "))
  }

  # Subset the beta matrix to include only required CpGs
  beta_subset <- beta_matrix[required_cpgs, , drop = FALSE]

  # Calculate eGA for each sample
  intercept <- coefficients["(Intercept)"]
  eGA <- intercept + colSums(beta_subset * coefficients[required_cpgs])

  # Set sample IDs as names of the output vector
  names(eGA) <- colnames(beta_matrix)

  return(eGA)
}

# Example data
# beta_matrix <- matrix(
#   c(0.5, 0.7, 0.3, 0.6, 0.8, 0.4),
#   nrow = 3, byrow = TRUE,
#   dimnames = list(c("cg00000029", "cg00000108", "cg00000109"), c("Sample1", "Sample2"))
# )
# calculate_eGA(beta_matrix)

#' @title Get Required CpG Sites
#' @description Returns the list of CpG sites required for the calculation of epigenetic gestational age.
#' @return A character vector of CpG site IDs.
#' @export
get_required_cpgs <- function() {
  coefficients_data <- coefficients
  return(coefficients_data$CpG)
}

# Internal dataset
# usethis::use_data(coefficients, internal = TRUE, overwrite = TRUE)

# Create a package structure and documentation
# usethis::create_package("PCPCmodel")
# usethis::use_roxygen_md()
# devtools::document()
# Build and install the package with devtools::install()



 # coefficients <- read.csv("wsu_coefficients.csv", stringsAsFactors = FALSE)
 # usethis::use_data(coefficients, internal = TRUE, overwrite = TRUE)

 # devtools::document()
# library(PCPCmodel)
# beta_matrix <- matrix(
#   c(0.5, 0.7, 0.3, 0.6, 0.8, 0.4),
#   nrow = 3, byrow = TRUE,
#   dimnames = list(c("cg00000029", "cg00000108", "cg00000109"), c("Sample1", "Sample2"))
# )
# calculate_eGA(beta_matrix)
# PCPCmodel::get_required_cpgs()
