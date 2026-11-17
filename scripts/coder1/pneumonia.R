here::i_am("scripts/coder1/pneumonia.R")

library(ggplot2)
library(dplyr)
library(gtsummary)

data <- read.csv(
  file = here::here("data/covid_sub.csv")
)

table1 <- data |>
  filter(!is.na(PNEUMONIA)) |>
  mutate(
    SEX = factor(SEX, labels = c("Female", "Male"))) |>
  tbl_cross(
    row = PNEUMONIA,
    col = SEX,
    percent = "column",                     
    margin = NULL                          
  ) |>
  add_p(source_note = TRUE)                 

figure1 <- data |>
  filter(!is.na(PNEUMONIA)) |>
  mutate(PNEUMONIA = factor(PNEUMONIA, levels = c("Yes", "No"))) |>
  count(SEX, PNEUMONIA) |>
  group_by(SEX) |>
  mutate(pct = n / sum(n) * 100) |>                               
  ungroup() |>
  ggplot(aes(x = factor(SEX), y = pct, fill = PNEUMONIA)) +
  geom_col(position = "dodge") +
  labs(title = "Pneumonia by Sex", x = "Sex", y = "Percent", fill = "Pneumonia") +
  theme_minimal()

saveRDS(
  table1,
  file = here::here("outputs/coder1/table1.rds")
)

ggsave(
  here::here("outputs/coder1/figure1.png"),
  device = "png"
)
