# R Package Requirements for Regression Analysis
# Run this script to install all required packages

# List of required packages
required_packages <- c(
  "ggplot2",    # For creating beautiful visualizations
  "dplyr",      # For data manipulation
  "car",        # For additional regression diagnostics
  "broom",      # For tidy model outputs
  "corrplot"    # For correlation matrix visualization
)

# Function to install packages if not already installed
install_if_missing <- function(packages) {
  for (package in packages) {
    if (!require(package, character.only = TRUE)) {
      cat("Installing package:", package, "\n")
      install.packages(package, dependencies = TRUE)
      library(package, character.only = TRUE)
    } else {
      cat("Package", package, "is already installed\n")
    }
  }
}

# Install all required packages
cat("=== Installing Required R Packages ===\n")
install_if_missing(required_packages)

# Verify all packages are loaded
cat("\n=== Verifying Package Installation ===\n")
for (package in required_packages) {
  if (require(package, character.only = TRUE)) {
    cat("✅", package, "loaded successfully\n")
  } else {
    cat("❌", package, "failed to load\n")
  }
}

cat("\n=== Package Installation Complete ===\n")
cat("You can now run regression_analysis.R\n") 