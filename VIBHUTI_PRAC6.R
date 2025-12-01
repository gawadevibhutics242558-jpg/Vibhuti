
# Pract 6: Merge and Append (No Sales)


library(dplyr)  # For bind_rows function


# 1. CREATE DATASETS


# Dataset 1: January points
january_data <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Mauu", "Sauu", "Nehuu"),
  Jan_Points = c(85, 90, 95)  # Example points
)

# Dataset 2: February points
february_data <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Mauu", "Sauu", "Nehuu"),
  Feb_Points = c(88, 92, 97)  # Example points
)

# Dataset 3: New members to append
new_members <- data.frame(
  ID = c(4, 5),
  Name = c("Ranu", "Tanu"),
  Jan_Points = c(80, 87)  # Points for new members
)

# Display initial datasets
print("--- January Data ---")
print(january_data)
print("--- February Data ---")
print(february_data)


# 2. MERGE DATASETS (JOIN BY ID & NAME)

# Merge January and February points for comparison
merged_data <- merge(january_data, february_data, by = c("ID", "Name"))

print("--- Merged Data ---")
print(merged_data)


# 3. APPEND NEW MEMBERS (STACK ROWS)

# Add new members to January data
final_data_list <- bind_rows(january_data, new_members)

print("--- Final Data List (After Appending) ---")
print(final_data_list)

