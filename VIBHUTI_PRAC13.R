



library(dplyr)


# 1. READ YOUR WINE DATA

wine_df <- read.csv("D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE/winequality-red.csv")

print("--- 1. Original Wine Dataset ---")
print(head(wine_df))


# 2. IDENTIFYING DUPLICATES 

duplicates_report <- wine_df %>%
  group_by(across(everything())) %>%  # group by ALL columns
  count() %>%                          # count duplicates
  filter(n > 1)                        # keep only duplicates

print("--- 2. Rows that are duplicated (Full duplicate report) ---")
print(duplicates_report)


# 3. REMOVING EXACT DUPLICATE ROWS

clean_exact <- wine_df %>%
  distinct()     # removes full duplicate rows

print("--- 3. Dataset After Removing Exact Duplicates ---")
print(clean_exact)


# 4. HANDLING DUPLICATES BASED ON ONE COLUMN (Example: quality)



unique_quality <- wine_df %>%
  distinct(quality, .keep_all = TRUE)

print("--- 4. Unique Quality Values (Only first appearance kept) ---")
print(unique_quality)
