# ==============================================================================
# R Script: Handling Missing Values (Data Cleaning)
# Dataset: Car Data
# ==============================================================================

# Install & load required libraries
# install.packages("dplyr")
# install.packages("tidyr")
library(dplyr)
library(tidyr)   # for replace_na()

# ==============================================================================
# 1. IMPORT DATASET
# ==============================================================================

# Read car dataset
car_df <- read.csv("C:/Users/mvlui/Downloads/cardata.csv", na.strings = c("", "NA"))

print("--- 1. Original Data (First 6 Rows) ---")
print(head(car_df))

# Count missing values in each column
print("--- Count of Missing Values per Column ---")
print(colSums(is.na(car_df)))

# ==============================================================================
# 2. METHOD A: REMOVE MISSING VALUES (na.omit)
# ==============================================================================

clean_omit <- na.omit(car_df)

print("--- 2. Data After na.omit() ---")
print(paste("Original rows:", nrow(car_df)))
print(paste("Rows remaining:", nrow(clean_omit)))
print(head(clean_omit))

# ==============================================================================
# 3. METHOD B: REPLACE MISSING VALUES (replace_na)
# ==============================================================================

# Strategy for cardata:
# Car_Name       → Replace NA with "Unknown"
# Year           → Replace NA with median year
# Selling_Price  → Replace with median Selling Price
# Present_Price  → Replace with median Present Price
# Kms_Driven     → Replace with median Kms Driven
# Fuel_Type      → Replace NA with "Unknown"
# Seller_Type    → Replace NA with "Unknown"
# Transmission   → Replace NA with "Unknown"
# Owner          → Replace NA with 0

median_year          <- median(car_df$Year, na.rm = TRUE)
median_selling       <- median(car_df$Selling_Price, na.rm = TRUE)
median_present       <- median(car_df$Present_Price, na.rm = TRUE)
median_kms           <- median(car_df$Kms_Driven, na.rm = TRUE)

clean_replace <- car_df %>%
  replace_na(list(
    Car_Name      = "Unknown",
    Year          = median_year,
    Selling_Price = median_selling,
    Present_Price = median_present,
    Kms_Driven    = median_kms,
    Fuel_Type     = "Unknown",
    Seller_Type   = "Unknown",
    Transmission  = "Unknown",
    Owner         = 0
  ))

print("--- 3. Data After replace_na() ---")
print(head(clean_replace, 6))

# Check if any NA values remain
print("--- Remaining NAs After Replacement ---")
print(colSums(is.na(clean_replace)))
