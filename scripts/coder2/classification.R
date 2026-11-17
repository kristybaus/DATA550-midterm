here::i_am("scripts/coder2/classification.R")

library(tidyverse)   
library(here)        
library(knitr)  
library(kableExtra) 

covid_raw <- read_csv(here::here("data/covid_sub.csv"))

covid_clean <- covid_raw %>%
  select(SEX, CLASIFFICATION_FINAL) %>%
  drop_na() %>%
  mutate(
    sex = factor(str_to_title(SEX), levels = c("Female", "Male")),
    classification = paste("Code", CLASIFFICATION_FINAL)
  )


classification_sex_summary <- covid_clean %>%
  count(classification, sex) %>%
  group_by(sex) %>%
  mutate(pct = round(100 * n / sum(n), 1)) %>%
  ungroup() %>%
  mutate(cell = paste0(n, " (", pct, "%)"))

table2_classification_by_sex <- classification_sex_summary %>%
  select(classification, sex, cell) %>%
  pivot_wider(names_from = sex, values_from = cell, values_fill = "0 (0%)") %>%
  rename(Classification = classification)

classification_sex_counts <- table(covid_clean$classification, covid_clean$sex)
chisq_result <- chisq.test(classification_sex_counts)
chisq_p_value <- ifelse(chisq_result$p.value < 0.001, "< 0.001", 
                        round(chisq_result$p.value, 3))

footnote_text <- paste0(
  "Percentages are column percentages (within sex). ",
  "Chi-square test of independence: X-squared = ",
  round(chisq_result$statistic, 2), ", df = ", chisq_result$parameter,
  ", p ", chisq_p_value, "."
)

table2_display <- kable(table2_classification_by_sex,
                        format = "html",
                        col.names = c("Classification", "Female, n (%)", "Male, n (%)"),
                        align = c("l", "r", "r"),
                        caption = "Table 2. COVID-19 classification by sex, n (column %)") %>%
  kable_styling(full_width = FALSE) %>%
  footnote(general = footnote_text, general_title = "Note: ")

table2_display

saveRDS(
  table2_classification_by_sex,
  here::here("outputs/coder2/table2_classification_by_sex.rds"))


figure2_classification_by_sex <- ggplot(
  classification_sex_summary,
  aes(x = classification, y = pct, fill = sex)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = paste0(sprintf("%.1f", pct), "%")),
            position = position_dodge(width = 0.9),
            vjust = -0.4, size = 3) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(
    title = "COVID-19 Classification by Sex",
    subtitle = paste0("Percentages calculated within sex; chi-square p ", chisq_p_value),
    x = "Final classification code",
    y = "Percentage of patients within sex (%)",
    fill = "Sex",
    caption = "Covid Test Findings - Codes 1-3: Patient was diagnosed with 
    COVID-19 in different degrees. Codes 4+: Patient was not a carrier of COVID-19
    or the test was inconclusive."
  ) +
  theme_minimal()

figure2_classification_by_sex

ggsave(here::here("outputs/coder2/figure2_classification_by_sex.png"),
       figure2_classification_by_sex, width = 9, height = 5.5)

