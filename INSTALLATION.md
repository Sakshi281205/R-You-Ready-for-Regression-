# Installation Guide for R Regression Analysis

## 🚀 Quick Start

### Step 1: Install R

#### Windows
1. **Download R**: Visit [https://cran.r-project.org/bin/windows/base/](https://cran.r-project.org/bin/windows/base/)
2. **Download the latest version** (e.g., R-4.3.2-win.exe)
3. **Run the installer** and follow the installation wizard
4. **Add R to PATH** during installation (recommended)

#### Alternative: Install RStudio (Recommended)
1. **Download RStudio**: Visit [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)
2. **Install RStudio Desktop** (this will also install R if not already present)
3. **Launch RStudio** and use the integrated R console

### Step 2: Install Required Packages

Once R is installed, open R or RStudio and run:

```r
# Install required packages
install.packages(c("ggplot2", "dplyr", "car", "broom", "corrplot"))

# Verify installation
library(ggplot2)
library(dplyr)
library(car)
library(broom)
library(corrplot)
```

### Step 3: Run the Analysis

#### Option 1: Using R Console
```r
# Navigate to your project directory
setwd("C:/Users/saksh/R-You-Ready-for-Regression-")

# Run the analysis
source("regression_analysis.R")
```

#### Option 2: Using RStudio
1. Open `regression_analysis.R` in RStudio
2. Click "Source" button or press Ctrl+Shift+Enter

#### Option 3: Using Command Line
```bash
# If R is in your PATH
Rscript regression_analysis.R
```

## 📊 Expected Output

After running the script, you should see:

### Console Output
- Dataset summaries and statistics
- Regression model results
- Model comparison tables
- Prediction examples

### Generated Files
- `mtcars_correlation_plot.png`
- `mtcars_diagnostic_plots.png`
- `mtcars_scatter_plot.png`
- `mtcars_residual_plot.png`
- `iris_diagnostic_plots.png`
- `iris_scatter_plot.png`
- `iris_residual_plot.png`

## 🔧 Troubleshooting

### R Not Found
- Ensure R is installed and added to PATH
- Try restarting your terminal/command prompt
- Use full path to R executable

### Package Installation Issues
```r
# Update R packages
update.packages()

# Install from CRAN with dependencies
install.packages("ggplot2", dependencies = TRUE)
```

### Permission Issues
- Run R/RStudio as administrator
- Check folder permissions
- Ensure write access to project directory

## 📚 Additional Resources

- [R Installation Guide](https://cran.r-project.org/doc/manuals/r-release/R-admin.html)
- [RStudio Installation](https://posit.co/download/rstudio-desktop/)
- [Package Installation Help](https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Installing-packages)

## 🎯 Next Steps

Once R is installed and the script runs successfully:

1. **Explore the generated plots** in your project directory
2. **Modify the script** to experiment with different variables
3. **Try other datasets** by replacing mtcars/iris with other built-in datasets
4. **Add your own data** and adapt the analysis

---

**Need help?** Check the R documentation or community forums for additional support! 