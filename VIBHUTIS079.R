# Install required packages (run only once)
install.packages("dplyr")
install.packages("readr")

# Load libraries
library(dplyr)
library(readr)

# Read your CSV file
iris_data <- read_csv("IRIS (1).csv")

# Quick look at the data structure
head(iris_data)


# ----------------------------------------------------
# METHOD 1: Using subset()  (Base R)
# ----------------------------------------------------

# Example 1: Single Condition
# Filter flowers with sepal length > 6
long_sepal_subset <- subset(iris_data, sepal_length > 6)

cat("Number of flowers with sepal_length > 6:", 
    nrow(long_sepal_subset), "\n")
summary(long_sepal_subset$sepal_length)


# Example 2: Multiple Conditions (AND)
# Filter flowers with petal_width > 1 AND sepal_width > 3
wide_petal_wide_sepal_subset <- subset(iris_data, 
                                       petal_width > 1 & sepal_width > 3)

cat("Rows matching (petal_width > 1 & sepal_width > 3):", 
    nrow(wide_petal_wide_sepal_subset), "\n")
head(wide_petal_wide_sepal_subset)


# Example 3: Multiple Conditions (OR)
# Flowers that are species "Iris-setosa" OR have petal_length > 5
special_flowers_subset <- subset(iris_data, 
                                 species == "Iris-setosa" | petal_length > 5)

cat("Rows matching (setosa OR petal_length > 5):", 
    nrow(special_flowers_subset), "\n")
head(special_flowers_subset)


# ----------------------------------------------------
# METHOD 2: Using dplyr::filter() (Modern R)
# ----------------------------------------------------

# Example 1: Single Condition (Using Pipe Operator)
# Filter flowers with petal_length < 2
short_petal_filter <- iris_data |>
  filter(petal_length < 2)

cat("Number with petal_length < 2:", 
    nrow(short_petal_filter), "\n")
summary(short_petal_filter$petal_length)


# Example 2: Multiple Conditions (AND)
# Flowers where species is NOT setosa and sepal_width > 3
not_setosa_wide_sepal_filter <- iris_data |>
  filter(species != "Iris-setosa", sepal_width > 3)

cat("Rows (species != setosa & sepal_width > 3):", 
    nrow(not_setosa_wide_sepal_filter), "\n")
head(not_setosa_wide_sepal_filter)


# Example 3: Using %in% (set membership)
# Filter flowers whose species is either virginica or versicolor
selected_species_filter <- iris_data |>
  filter(species %in% c("Iris-virginica", "Iris-versicolor"))

cat("Rows belonging to two species:", 
    nrow(selected_species_filter), "\n")
table(selected_species_filter$species)
