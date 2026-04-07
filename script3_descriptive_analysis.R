## 3.1 Betalning bland åldergrupper
age_grouped <- df_clean %>%
  group_by(age_group) %>%
  summarise(
    # medelvärde och median av charges, per åldergrupp.
    mean_charge = round(mean(charges),2),
    median_charge = median(charges),
    n = n(),
    .groups = "drop" # tar bort gruppering av summarise.
  ) %>% 
  mutate(
    # hur många tillhör gruppen, i procent.
    proportion_pct = round((n / sum(n)) *100,1)
  ) %>% 
  arrange(mean_charge)


## 3.2 Betalning bland bmi-kategori
bmi_grouped <- df_clean %>%
  group_by(bmi_class) %>%
  summarise(
    mean_charge = round(mean(charges),2),
    median_charge = round(median(charges),2),
    n = n(),
    .groups = "drop"
  ) %>% 
  mutate(
    # hur många tillhör BMI-kategorin, i procent
    proportion_pct = round((n / sum(n)) *100,1)
  ) %>% 
  arrange(mean_charge) %>% 
  # väljer alla utom n:
  select(-n)


## 3.3 Betalning inom rökning
smoker_grouped <- df_clean %>%
  group_by(smoker) %>%
  summarise(
    mean_charge = round(mean(charges),2),
    median_charge = median(charges),
    n = n(),
    .groups = "drop"
  ) %>%
  mutate(
    # hur många är/inte rökare, i procent
    proportion_pct = round((n / sum(n)) *100,1)
  ) %>% 
  arrange(desc(mean_charge)) %>% 
  select(-n)


## 3.4 Betalning bland rökare + kroniska
smoker_chronic <- df_clean %>%
  group_by(smoker, chronic_condition) %>%
  summarise(
    mean_charge = mean(charges),
    median_charge = median(charges),
    n = n(),
    .groups = "drop"
  ) %>% 
  mutate(
    proportion_pct = round((n / sum(n)) *100,1)
  ) %>% 
  arrange(desc(proportion_pct)) %>% 
  select(-n)
