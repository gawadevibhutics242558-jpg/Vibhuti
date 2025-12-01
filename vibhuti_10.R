
# R Script: Creating New Variables (Transformations & Calculations)
# Dataset: Wine Quality Data (winequality-red.csv)
library(dplyr)
library(tidyr)


# 1. SETUP: Import the Dataset


# Set working directory (optional)
setwd("C:/Users/mvlui/Downloads")

# Import wine data
df <- read.csv("winequality-red.csv", na.strings = c("", "NA"))

print("--- Original Data ---")
print(head(df))

# PRE-CLEANING:
# Replace missing values in numeric fields (if any)
df_clean <- df %>%
  mutate(
    alcohol  = replace_na(alcohol, 0),
    sulphates = replace_na(sulphates, 0),
    quality = replace_na(quality, 0)
  )

print("--- Cleaned Baseline Data ---")
print(head(df_clean))


# 2. METHOD A: ARITHMETIC CALCULATIONS

# Scenario: Calculate a 'Final_Alcohol' value after subtracting sulphate effect.
# Formula: Alcohol - (Alcohol * Sulphates / 100)

df_calc <- df_clean %>%
  mutate(
    Sulphate_Effect = alcohol * (sulphates / 100),
    Final_Alcohol = alcohol - Sulphate_Effect
  )

print("--- Method A: Arithmetic Results (Final Alcohol) ---")
print(df_calc %>% select(alcohol, sulphates, Final_Alcohol) %>% head())


# 3. METHOD B: CONDITIONAL LOGIC (ifelse)

# Scenario: Create a 'Quality_Label' based on the quality score.

df_logic <- df_clean %>%
  mutate(
    Quality_Label = ifelse(quality > 6, "Top Quality", "Average"),
    Alcohol_Category = ifelse(alcohol > 10, "Strong", "Light")
  )

print("--- Method B: Logic Results (Labels) ---")
print(df_logic %>% select(quality, Quality_Label, alcohol, Alcohol_Category) %>% head())


# 4. METHOD C: TEXT TRANSFORMATION (paste)

# Create a descriptive text summary for each wine

df_text <- df_clean %>%
  mutate(
    Wine_Summary = paste(
      "Wine with", alcohol, "% alcohol and acidity level", fixed.acidity
    )
  )

print("--- Method C: Text Transformation ---")
print(head(df_text$Wine_Summary))


# 5. ALL TOGETHER (Standard Workflow)


final_dataset <- df_clean %>%
  mutate(
    Final_Alcohol = alcohol - (alcohol * sulphates / 100),
    Is_High_Value = ifelse(Final_Alcohol > 10, TRUE, FALSE),
    Status_Report = paste0(
      "Quality: ", round(quality, 1),
      " | Alcohol: ", alcohol, "%"
    )
  )

print("--- Final Combined Dataset ---")
print(head(final_dataset))

