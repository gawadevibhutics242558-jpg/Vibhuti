# ==============================================================================
# 1. IMPORT DATASET
# ==============================================================================

# Load dplyr package
library(dplyr)

# Read your CSV file using full path
car <- read.csv("C:/Users/mvlui/Downloads/cardata.csv")

# View first 3 rows
print("--- Original Dataset (First 3 rows) ---")
print(head(car, 3))

# ==============================================================================
# 2. SELECTING VARIABLES (Keeping Columns)
# ==============================================================================

# A. Select specific columns by name
selected_cols <- car %>%
  select(Car_Name, Year, Selling_Price)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

# B. Select a range of adjacent columns
# (Year to Kms_Driven)
range_cols <- car %>%
  select(Year:Kms_Driven)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

# C. Select using helper functions (columns starting with S)
starts_with_S <- car %>%
  select(starts_with("S"))

print("--- Selected Columns Starting with 'S' ---")
print(head(starts_with_S, 3))

# ==============================================================================
# 3. DROPPING VARIABLES (Removing Columns)
# ==============================================================================

# A. Drop a single column: Owner
dropped_one <- car %>%
  select(-Owner)

print("--- Dataset with 'Owner' Dropped ---")
print(names(dropped_one))

# B. Drop multiple columns: Fuel_Type and Seller_Type
dropped_multiple <- car %>%
  select(-Fuel_Type, -Seller_Type)

print("--- Dataset with 'Fuel_Type' and 'Seller_Type' Dropped ---")
print(names(dropped_multiple))

# C. Drop a range of columns: Selling_Price to Seller_Type
dropped_range <- car %>%
  select(-(Selling_Price:Seller_Type))

print("--- Dataset with Range Dropped (Selling_Price to Seller_Type) ---")
print(names(dropped_range))
