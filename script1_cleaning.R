df_clean <- df %>% 
  mutate(
    # Skapa variabler:
    
    # Ta bort C och sätt som int
    customer_id = str_replace(customer_id, "C", ""),
    customer_id = as.integer(customer_id),
    
    age = as.integer(age),
    
    # Trim, lower och title
    region = str_trim(region),
    region = str_to_lower(region),
    region = str_to_title(region),
    
    # Ersätt NA med median (räkna bort NA för median kalkylen)
    bmi = replace_na(bmi, median(bmi, na.rm = TRUE)),
    
    children = as.integer(children),
    
    smoker = str_trim(smoker),
    smoker = str_to_lower(smoker),
    smoker = case_when(
      smoker == "yes" ~ TRUE,
      smoker == "no" ~ FALSE
    ),
    
    chronic_condition = case_when(
      chronic_condition == "yes" ~ TRUE,
      chronic_condition == "no" ~ FALSE
    ),
    
    exercise_level = str_trim(exercise_level),
    exercise_level = str_to_lower(exercise_level),
    exercise_level = str_to_title(exercise_level),
    exercise_level = replace_na(exercise_level, "Unknown"),
    
    plan_type = str_trim(plan_type),
    plan_type = str_to_lower(plan_type),
    plan_type = str_to_title(plan_type),
    
    prior_accidents = as.integer(prior_accidents),
    prior_claims = as.integer(prior_claims),

    annual_checkups = as.integer(annual_checkups),
    annual_checkups = replace_na(annual_checkups, median(annual_checkups, na.rm = TRUE))
    )