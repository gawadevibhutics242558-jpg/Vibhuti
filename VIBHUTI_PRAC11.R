library(dplyr)
library(tidyr)

# 1. Read Your Car Dataset
car_df <- read.csv("C:/Users/mvlui/Downloads/car_dataset.csv",
                   na.strings = c("", "NA")) %>%
  mutate(CarID = row_number()) %>%
  select(CarID, brand, model, price, mileage, fuel, horsepower, transmission)

print("--- 1. Original Wide Data ---")
print(head(car_df))

# 2. pivot_longer
long_car <- car_df %>%
  pivot_longer(
    cols = c(price, mileage, horsepower),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- 2. Long Format ---")
print(head(long_car, 10))

# 3. pivot_wider
wide_car <- long_car %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- 3. Wide Format ---")
print(head(wide_car))

# 4. Fuel-wise Price Pivot
fuel_pivot <- car_df %>%
  select(CarID, fuel, price) %>%
  pivot_wider(
    names_from = fuel,
    values_from = price
  )

print("--- 4. Fuel Pivot ---")
print(head(fuel_pivot))
