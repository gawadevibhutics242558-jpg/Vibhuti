
library(dplyr)

wine_df <- read.csv("D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE/winequality-red.csv")

print("--- 1. Original Wine Dataset ---")
print(head(wine_df))

duplicates_report <- wine_df %>%
  group_by(across(everything())) %>%  
  count() %>%                         
  filter(n > 1)                       

print("--- 2. Rows that are duplicated (Full duplicate report) ---")
print(duplicates_report)

clean_exact <- wine_df %>%
  distinct()   
print("--- 3. Dataset After Removing Exact Duplicates ---")
print(clean_exact)

unique_quality <- wine_df %>%
  distinct(quality, .keep_all = TRUE)

print("--- 4. Unique Quality Values (Only first appearance kept) ---")
print(unique_quality)
