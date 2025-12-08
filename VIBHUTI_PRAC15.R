setwd("D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE")

car_df <- read.csv("cardata.csv")
print("--- Car Data Loaded Successfully ---")

head(car_df)

print("--- OUTPUT OF str() ---")
str(car_df)

print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(car_df)

factor_cols <- c("FuelType", "Transmission", "Owner", "Seller_Type")

# Only convert columns that actually exist
factor_cols <- factor_cols[factor_cols %in% names(car_df)]

car_df[factor_cols] <- lapply(car_df[factor_cols], as.factor)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(car_df)

avg_kms <- mean(car_df$Kms_Driven, na.rm = TRUE)
max_price <- max(car_df$Selling_Price, na.rm = TRUE)
min_year <- min(car_df$Year, na.rm = TRUE)
max_year <- max(car_df$Year, na.rm = TRUE)

print(paste("Average KM Driven:", avg_kms))
print(paste("Highest Selling Price:", max_price))
print(paste("Oldest Car Year:", min_year))
print(paste("Newest Car Year:", max_year))
