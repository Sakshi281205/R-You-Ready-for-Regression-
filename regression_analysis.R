# =============================================================================
# R REGRESSION ANALYSIS: Data Science Toolkit
# =============================================================================
# This script demonstrates real-world regression analysis using R's built-in datasets
# We'll explore two legendary datasets: mtcars and iris
# =============================================================================

# Load required libraries
library(ggplot2)
library(dplyr)
library(car)
library(broom)
library(corrplot)

# Set seed for reproducibility
set.seed(123)

# =============================================================================
# DATASET 1: MTCARS - Motor Trend Car Road Tests
# =============================================================================
cat("=== DATASET 1: MTCARS ANALYSIS ===\n")
cat("Exploring the relationship between car performance variables\n\n")

# Load and examine the mtcars dataset
data(mtcars)
cat("Dataset dimensions:", dim(mtcars), "\n")
cat("Variables:", names(mtcars), "\n\n")

# Basic summary statistics
cat("Summary Statistics for MTCARS:\n")
print(summary(mtcars))

# Correlation analysis
cat("\nCorrelation Matrix (key variables):\n")
correlation_vars <- c("mpg", "wt", "hp", "disp", "cyl")
cor_matrix <- cor(mtcars[correlation_vars])
print(round(cor_matrix, 3))

# Create correlation plot
png("mtcars_correlation_plot.png", width=800, height=600)
corrplot(cor_matrix, method="color", type="upper", 
         tl.col="black", tl.srt=45, addCoef.col="black",
         title="MTCARS Correlation Matrix", mar=c(0,0,2,0))
dev.off()

# =============================================================================
# REGRESSION 1: MPG vs Weight (Simple Linear Regression)
# =============================================================================
cat("\n=== REGRESSION 1: MPG vs Weight ===\n")

# Fit the model
model1 <- lm(mpg ~ wt, data=mtcars)
cat("Model Summary:\n")
print(summary(model1))

# Model diagnostics
cat("\nModel Diagnostics:\n")
print(anova(model1))

# Residual analysis
residuals1 <- residuals(model1)
fitted1 <- fitted(model1)

# Create diagnostic plots
png("mtcars_diagnostic_plots.png", width=1200, height=800)
par(mfrow=c(2,2))
plot(model1, main="MTCARS: MPG vs Weight - Diagnostic Plots")
dev.off()

# =============================================================================
# REGRESSION 2: MPG vs Multiple Predictors (Multiple Linear Regression)
# =============================================================================
cat("\n=== REGRESSION 2: MPG vs Multiple Predictors ===\n")

# Fit multiple regression model
model2 <- lm(mpg ~ wt + hp + cyl + disp, data=mtcars)
cat("Multiple Regression Model Summary:\n")
print(summary(model2))

# Model comparison
cat("\nModel Comparison (R-squared):\n")
cat("Simple Regression R²:", round(summary(model1)$r.squared, 4), "\n")
cat("Multiple Regression R²:", round(summary(model2)$r.squared, 4), "\n")

# =============================================================================
# VISUALIZATION 1: MTCARS Analysis
# =============================================================================
cat("\n=== CREATING MTCARS VISUALIZATIONS ===\n")

# Scatter plot with regression line
p1 <- ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(aes(color=cyl), size=3, alpha=0.7) +
  geom_smooth(method="lm", color="red", se=TRUE) +
  labs(title="MTCARS: MPG vs Weight with Cylinder Count",
       x="Weight (1000 lbs)", y="Miles per Gallon",
       color="Cylinders") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size=14, face="bold"))

ggsave("mtcars_scatter_plot.png", p1, width=10, height=8, dpi=300)

# Residual plot
p2 <- ggplot(data.frame(fitted=fitted1, residuals=residuals1), 
             aes(x=fitted, y=residuals)) +
  geom_point(color="blue", alpha=0.7) +
  geom_hline(yintercept=0, color="red", linetype="dashed") +
  labs(title="MTCARS: Residual Plot",
       x="Fitted Values", y="Residuals") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size=14, face="bold"))

ggsave("mtcars_residual_plot.png", p2, width=10, height=8, dpi=300)

# =============================================================================
# DATASET 2: IRIS - Fisher's Iris Dataset
# =============================================================================
cat("\n=== DATASET 2: IRIS ANALYSIS ===\n")
cat("Exploring the relationship between iris flower measurements\n\n")

# Load and examine the iris dataset
data(iris)
cat("Dataset dimensions:", dim(iris), "\n")
cat("Variables:", names(iris), "\n")
cat("Species:", unique(iris$Species), "\n\n")

# Basic summary statistics
cat("Summary Statistics for IRIS:\n")
print(summary(iris))

# =============================================================================
# REGRESSION 3: Petal Length vs Petal Width (Simple Linear Regression)
# =============================================================================
cat("\n=== REGRESSION 3: Petal Length vs Petal Width ===\n")

# Fit the model
model3 <- lm(Petal.Length ~ Petal.Width, data=iris)
cat("Model Summary:\n")
print(summary(model3))

# Model diagnostics
cat("\nModel Diagnostics:\n")
print(anova(model3))

# Residual analysis
residuals3 <- residuals(model3)
fitted3 <- fitted(model3)

# Create diagnostic plots
png("iris_diagnostic_plots.png", width=1200, height=800)
par(mfrow=c(2,2))
plot(model3, main="IRIS: Petal Length vs Petal Width - Diagnostic Plots")
dev.off()

# =============================================================================
# REGRESSION 4: Petal Length vs Multiple Predictors
# =============================================================================
cat("\n=== REGRESSION 4: Petal Length vs Multiple Predictors ===\n")

# Fit multiple regression model
model4 <- lm(Petal.Length ~ Petal.Width + Sepal.Length + Sepal.Width, data=iris)
cat("Multiple Regression Model Summary:\n")
print(summary(model4))

# Model comparison
cat("\nModel Comparison (R-squared):\n")
cat("Simple Regression R²:", round(summary(model3)$r.squared, 4), "\n")
cat("Multiple Regression R²:", round(summary(model4)$r.squared, 4), "\n")

# =============================================================================
# VISUALIZATION 2: IRIS Analysis
# =============================================================================
cat("\n=== CREATING IRIS VISUALIZATIONS ===\n")

# Scatter plot with regression line and species coloring
p3 <- ggplot(iris, aes(x=Petal.Width, y=Petal.Length)) +
  geom_point(aes(color=Species), size=3, alpha=0.7) +
  geom_smooth(method="lm", color="red", se=TRUE) +
  labs(title="IRIS: Petal Length vs Petal Width by Species",
       x="Petal Width (cm)", y="Petal Length (cm)",
       color="Species") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size=14, face="bold"))

ggsave("iris_scatter_plot.png", p3, width=10, height=8, dpi=300)

# Residual plot
p4 <- ggplot(data.frame(fitted=fitted3, residuals=residuals3), 
             aes(x=fitted, y=residuals)) +
  geom_point(color="green", alpha=0.7) +
  geom_hline(yintercept=0, color="red", linetype="dashed") +
  labs(title="IRIS: Residual Plot",
       x="Fitted Values", y="Residuals") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size=14, face="bold"))

ggsave("iris_residual_plot.png", p4, width=10, height=8, dpi=300)

# =============================================================================
# COMPARATIVE ANALYSIS
# =============================================================================
cat("\n=== COMPARATIVE ANALYSIS ===\n")

# Create a comparison table
comparison_data <- data.frame(
  Dataset = c("MTCARS", "MTCARS", "IRIS", "IRIS"),
  Model_Type = c("Simple", "Multiple", "Simple", "Multiple"),
  R_Squared = c(
    round(summary(model1)$r.squared, 4),
    round(summary(model2)$r.squared, 4),
    round(summary(model3)$r.squared, 4),
    round(summary(model4)$r.squared, 4)
  ),
  Adjusted_R_Squared = c(
    round(summary(model1)$adj.r.squared, 4),
    round(summary(model2)$adj.r.squared, 4),
    round(summary(model3)$adj.r.squared, 4),
    round(summary(model4)$adj.r.squared, 4)
  )
)

cat("Model Performance Comparison:\n")
print(comparison_data)

# =============================================================================
# PREDICTION EXAMPLES
# =============================================================================
cat("\n=== PREDICTION EXAMPLES ===\n")

# MTCARS predictions
new_car <- data.frame(wt=3.5, hp=150, cyl=6, disp=200)
mtcars_prediction <- predict(model2, newdata=new_car, interval="prediction")
cat("MTCARS Prediction for new car (wt=3.5, hp=150, cyl=6, disp=200):\n")
cat("Predicted MPG:", round(mtcars_prediction[1], 2), "\n")
cat("95% Prediction Interval:", round(mtcars_prediction[2:3], 2), "\n\n")

# IRIS predictions
new_flower <- data.frame(Petal.Width=1.5, Sepal.Length=6.0, Sepal.Width=3.0)
iris_prediction <- predict(model4, newdata=new_flower, interval="prediction")
cat("IRIS Prediction for new flower (Petal.Width=1.5, Sepal.Length=6.0, Sepal.Width=3.0):\n")
cat("Predicted Petal Length:", round(iris_prediction[1], 2), "cm\n")
cat("95% Prediction Interval:", round(iris_prediction[2:3], 2), "cm\n")

# =============================================================================
# CONCLUSION
# =============================================================================
cat("\n=== ANALYSIS CONCLUSION ===\n")
cat("✅ Successfully performed regression analysis on two datasets\n")
cat("✅ Created comprehensive visualizations and diagnostic plots\n")
cat("✅ Generated prediction examples with confidence intervals\n")
cat("✅ All plots saved as PNG files in the current directory\n")
cat("\nFiles created:\n")
cat("- mtcars_correlation_plot.png\n")
cat("- mtcars_diagnostic_plots.png\n")
cat("- mtcars_scatter_plot.png\n")
cat("- mtcars_residual_plot.png\n")
cat("- iris_diagnostic_plots.png\n")
cat("- iris_scatter_plot.png\n")
cat("- iris_residual_plot.png\n")

cat("\n🎉 Regression analysis complete! Your data science toolkit is ready! 🎉\n") 