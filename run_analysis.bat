@echo off
echo ========================================
echo    R Regression Analysis Launcher
echo ========================================
echo.

echo Checking if R is installed...
R --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: R is not installed or not in PATH
    echo.
    echo Please install R from: https://cran.r-project.org/
    echo Or install RStudio from: https://posit.co/download/rstudio-desktop/
    echo.
    pause
    exit /b 1
)

echo R is installed! Starting analysis...
echo.

echo Step 1: Installing required packages...
Rscript requirements.R
if %errorlevel% neq 0 (
    echo ERROR: Failed to install packages
    pause
    exit /b 1
)

echo.
echo Step 2: Running regression analysis...
Rscript regression_analysis.R
if %errorlevel% neq 0 (
    echo ERROR: Failed to run analysis
    pause
    exit /b 1
)

echo.
echo ========================================
echo    Analysis Complete!
echo ========================================
echo.
echo Generated files:
dir *.png
echo.
echo Check the console output above for results.
echo All plots have been saved as PNG files.
echo.
pause 