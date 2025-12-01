
# R Script: Text Manipulation with stringr (for cardata.csv)
# Functions: str_sub(), str_split(), separate()


# Install packages if not already installed
# install.packages("stringr")
# install.packages("tidyr")

library(stringr)
library(tidyr)
library(dplyr)


# 1. IMPORT DATASET


car_df <- read.csv("C:/Users/mvlui/Downloads/cardata.csv")

print("--- Original Dataset (First 6 Rows) ---")
print(head(car_df))


# 2. USING str_sub() (Substring)


# Extract first 3 characters (Brand Code)
car_df$Brand_Code <- str_sub(car_df$Car_Name, 1, 3)

# Extract last 2 characters (Ending)
car_df$Name_Ending <- str_sub(car_df$Car_Name, -2, -1)

print("--- Data after str_sub() ---")
print(car_df %>% select(Car_Name, Brand_Code, Name_Ending) %>% head())


# 3. USING str_split() (Split String)


# A. Basic split (list output)
split_list <- str_split(car_df$Car_Name, " ")

print("--- Basic Split Example (List output) ---")
print(split_list[[1]])   # First car's split

# B. Split using simplify = TRUE
split_matrix <- str_split(car_df$Car_Name, " ", simplify = TRUE)

# Add as new columns (dynamic number of columns)
car_df <- bind_cols(car_df, as.data.frame(split_matrix))

print("--- Data after str_split() (Word columns) ---")
print(head(car_df))


# 4. BONUS: Proper Safe Splitting with separate()


# Create up to 4 parts to avoid losing data
tidy_car <- car_df %>%
  separate(Car_Name,
           into = c("Name1", "Name2", "Name3", "Name4"),
           sep = " ",
           fill = "right",     # Fill missing with NA
           extra = "merge")    # Merge extra words into last column

print("--- Separate() Output (Safe Splitting) ---")
print(tidy_car %>% select(Name1, Name2, Name3, Name4) %>% head())
