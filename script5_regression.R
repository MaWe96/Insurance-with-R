# Lägger till passade värden till df_clean, för varsin modell:
model1_diagnostic <- df_clean %>%
  mutate(
    fitted_value = fitted(model1),
    residual = resid(model1),
    model = "Modell 1"
  )

model2_diagnostic <- df_clean %>%
  mutate(
    fitted_value = fitted(model2),
    residual = resid(model2),
    model = "Modell 2"
  )

# Modellernas visualer:
# Jämför predikterat och faktiskt pris
regplot <- bind_rows(model1_diagnostic, model2_diagnostic) %>% 
  ggplot(aes(x = fitted_value, y = charges)) + 
  geom_point(alpha = 0.4, color="blue") +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
  facet_wrap(~model) +
  labs(
    title = "Faktiska och predikerade priser, båda modeller",
    x = "Predikterat pris",
    y = "Faktiskt pris"
  ) +
  theme_minimal()


# Felanalys:
errplot <- bind_rows(model1_diagnostic, model2_diagnostic) %>% 
  ggplot(aes(x = fitted_value, y = residual)) +
  geom_point(alpha = 0.4, color="blue") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  facet_wrap(~model) +
  labs(
    title = "Residualer i enkel och mer avancerad modell",
    x = "Predikterat pris",
    y = "Residual"
  ) +
  theme_minimal()