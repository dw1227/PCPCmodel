# PCPCmodel

The **PCPCmodel** package provides tools to calculate epigenetic gestational age (eGA) using a predefined linear equation based on beta values of specific CpG sites.

## Installation

To install the package from GitHub:

```R
# Install devtools if not already installed
install.packages("devtools")

devtools::install_github("dw1227/PCPCmodel")
```

## Features

- **`calculate_eGA`**: Computes the epigenetic gestational age (eGA) for multiple samples using a matrix or data frame of beta values.
- **`get_required_cpgs`**: Returns the list of CpG sites required for the calculation of eGA.

## Usage

### Example

```R
library(PCPCmodel)

# Load example beta values from a CSV file
beta_matrix <- read.csv("example_beta_values.csv", row.names = 1)

# Calculate eGA using the beta matrix
eGA <- calculate_eGA(as.matrix(beta_matrix))
print(eGA)

# Get required CpG sites
required_cpgs <- get_required_cpgs()
print(required_cpgs)
```

## Internal Dataset

The package includes an internal dataset `coefficients` containing the coefficients for the CpG sites used in the model. This dataset is used internally by the package functions.

## License

This package is licensed under the GPL-3 License. 

