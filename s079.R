# Load the dplyr package
library(dplyr)

# Load your CSV file
meets <- read.csv("meets.csv")

# -----------------------------------------
# Example 1: Sorting by a Single Variable
# -----------------------------------------

# Sort by MEDV in ascending order (lowest to highest)
meets_sorted_medv <- meets |>
  arrange(medv)

# Show first 5 rows
head(meets_sorted_medv, 5)

# -----------------------------------------
# Example 2: Sorting in DESCENDING order
# -----------------------------------------
# Highest crime rate first

meets_sorted_crim_desc <- meets |>
  arrange(desc(crim))

# Show first 5 rows
head(meets_sorted_crim_desc, 5)

# -----------------------------------------
# Example 3: Sorting by TWO columns
# -----------------------------------------
# 1. Sort by CHAS (0 → 1)
# 2. Within each CHAS group, sort by MEDV (high → low)

meets_multi_sort <- meets |>
  arrange(chas, desc(medv))

head(meets_multi_sort, 10)

# -----------------------------------------
# Example 4: Filter + Sort
# -----------------------------------------
# Filter for houses with rooms > 8, then sort by TAX ascending

large_homes_by_tax <- meets |>
  filter(rm > 8) |>
  arrange(tax)

cat("Top 5 largest homes by lowest tax rate:\n")
print(large_homes_by_tax |> select(rm, tax, medv) |> head(5))
