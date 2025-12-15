df <- read.csv("shades.csv")

print("---- 6. Paired t-test for Shades Dataset ----")

num_var <- names(df)[sapply(df, is.numeric)][1]

set.seed(123)

before_values <- df[[num_var]] - runif(nrow(df), min = 0.1, max = 0.5)
after_values  <- df[[num_var]]

t_test_paired <- t.test(
  before_values,
  after_values,
  paired = TRUE
)

print(t_test_paired)
