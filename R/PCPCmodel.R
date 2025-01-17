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
  required_cpgs <- get_required_cpgs 
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



#' @title Get Required CpG Sites
#' @description Returns the list of CpG sites required for the calculation of epigenetic gestational age.
#' @return A character vector of CpG site IDs.
#' @export
get_required_cpgs <- function() {
  coefficients_data <- coefficients
  return(setdiff(coefficients_data$CpG, "(Intercept)"))
}

