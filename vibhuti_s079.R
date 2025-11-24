# Install required packages
install.packages(c("readr", "psych"))

library(readr)    # For fast data loading
library(psych)    # For detailed descriptive statistics

# Load the SHADES dataset
my_data <- read.csv("shades.csv")

# View the first few rows
head(my_data)

# View the last few rows
tail(my_data)

# Get the dimensions (rows and columns)
dim(my_data)

# Print dimensions more clearly
cat("Dimensions (Rows, Columns): ", dim(my_data), "\n")

# Get the structure of the dataset
str(my_data)

# Summary of the dataset
summary(my_data)

# Get the column names
names(my_data)
cat("Column Names: ", names(my_data), "\n")

# Detailed descriptive statistics
describe(my_data)

