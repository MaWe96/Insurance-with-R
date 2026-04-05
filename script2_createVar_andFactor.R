df_clean <- df_clean %>% 
  mutate(
    # Skapa variabler:
    
    bmi_class = case_when(
      bmi > 30.5 ~ "Obese",
      bmi > 27 ~ "Overweight",
      bmi > 24 ~ "Normal",
      bmi > 16 ~ "Underweight",
    ),
    
    historic_score = prior_claims + prior_accidents,
    
    risk_level = if_else(
      bmi >30.5 |
        smoker ==TRUE |
        chronic_condition == TRUE |
        historic_score > 2,
      "High","Low"
    ),
    
    age_group = case_when(
      age > 60 ~ "Senior",
      age > 40 ~ "Middle Age",
      age > 20 ~ "Young Adult",
      age > 0 ~ "Junior"
    ),
    
    exercises_checks = if_else(
      annual_checkups >=1 & exercise_level =="High",
      "Healthy", "Less Healthy"
    ))


# Lista med chr kolumner att konvertera till factor:
cols_to_factor <- c(
  "sex","region","exercise_level","plan_type",
  "bmi_class","risk_level","age_group","exercises_checks")

# En funktion som gör as.factor på kolumnerna listade ovan
factor_func <- function(df) {
  for (col in cols_to_factor) {
    df[[col]] <- as.factor(df[[col]])
  }
  return(df)
}

# Kör funktionen och lagra resultatet i df_clean
df_clean <- factor_func(df_clean)