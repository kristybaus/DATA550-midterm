library(here)
library(readr)

here::i_am("scripts/coder3/immunosuppression.R")

data <- read.csv(
  file = here::here("data/covid_sub.csv")
)

# Table3
library(gtsummary)
library(tidyverse)

table3 <- data |>
  filter(!is.na(INMSUPR)) |>
  mutate(
    SEX = str_to_title(SEX),
    INMSUPR = factor(INMSUPR,
                     levels = c("Yes", "No"),
                     labels = c("Immunosuppressed", "Not Immunosuppressed"))
  ) |>
  select(SEX, INMSUPR) |>
  tbl_summary(
    by = SEX,
    label = INMSUPR ~ "Immunosuppression Status"
  ) |>
  modify_spanning_header(all_stat_cols() ~ "**Immunosuppression Status by Sex**") |>
  add_p()

saveRDS(
  table3,
  file = here::here("outputs/coder3/table3.rds")
)

# Figure3
# % immunosuppression by pt. type and sex
data_summary <- data |>
  filter(!is.na(INMSUPR)) |>
  group_by(PATIENT_TYPE, SEX) |>
  summarise(pct_inmsupr = mean(INMSUPR == "Yes") * 100, .groups = "drop") |>
  mutate(
    PATIENT_TYPE = factor(PATIENT_TYPE,
                          levels = c("hospitalization", "returned home"),
                          labels = c("Hospitalization", "Returned Home")),
    SEX = str_to_title(SEX)
  )

# grouped bar chart

figure3 <- ggplot(data_summary, aes(x = PATIENT_TYPE, y = pct_inmsupr, fill = SEX)) +
  geom_col(position = position_dodge(width = 0.6), width = 0.5) +
  geom_text(aes(label = round(pct_inmsupr, 1)),
            position = position_dodge(width = 0.6), vjust = -0.5) +
  labs(
    title = "Immunosuppression by Sex Among Hospitalized vs. Non-Hospitalized Patients",
    x = NULL,
    y = "Patients Who Are Immunosuppressed (%)",
    fill = NULL
  )
  

ggsave(
  here::here("outputs/coder3/figure3.png"),
  plot = figure3,
  device = "png",
  width = 7,
  height = 5,
  units = "in"
)
