# åldersgrupp col plot
ageplot <- ggplot(age_grouped, 
       mapping = aes(
         x = reorder(age_group, mean_charge), 
         y = mean_charge, 
         fill = mean_charge)) +
  geom_col() +
  labs(
    title = "Betalning (medel) bland åldersgrupp", 
    x = "Ålder",
    y = "Betalning"
  )

# bmi-klasser col plot
bmiplot <- ggplot(bmi_grouped,
       mapping = aes(
         x = reorder(bmi_class, mean_charge),
         y = mean_charge, 
         fill = mean_charge)) +
  geom_col() +
  labs(
    title = "Betalning (medel) bland BMI-klass", 
    x = "BMI",
    y = "Betalning"
  )

# true/false col plot
smoke_chron_plot <- ggplot(smoker_chronic,
       mapping = aes(
         x = smoker,
         y = mean_charge,
         fill = chronic_condition)) +
  geom_col(position = "dodge") +
  labs(
    title = "Betalning (medel) bland rökare och kroniska",
    x = "Rökare",
    y = "Betalning",
    fill = "Kronisk"
  )