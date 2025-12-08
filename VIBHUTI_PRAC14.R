
# R Script: Extracting Date Components using lubridate (Wine Dataset Version)


# 1. INSTALL & LOAD LIBRARIES

# Run this ONCE:
install.packages("lubridate")

# Load libraries
library(lubridate)
library(dplyr)


# 2. SET WORKING DIRECTORY

setwd("D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE")
print(list.files())


# 3. LOAD WINE DATASET

wine <- read.csv("winequality-red.csv")
head(wine)


# 4. ADD DATE COLUMN

wine$date_recorded <- seq(
  from = as.Date("2023-01-01"),
  length.out = nrow(wine),
  by = "day"
)


# 5. PARSE & EXTRACT DATE COMPONENTS

wine_dates_processed <- wine %>%
  mutate(
    Actual_Date = ymd(date_recorded),
    Year_Num = year(Actual_Date),
    Month_Num = month(Actual_Date),
    Month_Name = month(Actual_Date, label = TRUE),
    Day_Num = day(Actual_Date),
    Weekday_Num = wday(Actual_Date),
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE),
    Quarter = quarter(Actual_Date),
    Day_of_Year = yday(Actual_Date)
  )

print(head(wine_dates_processed))


# 6. SYSTEM DATE & TIME

current_time <- now()

print(paste("Current Year:", year(current_time)))
print(paste("Current Month:", month(current_time)))
print(paste("Current Day:", day(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))
