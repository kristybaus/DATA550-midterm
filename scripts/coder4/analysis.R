# Coder 4: Abigail Yemisrach, Hospitalization by Sex
# DATA 550 Midterm Project

library(ggplot2)

# Load data
covid <- read.csv("data/covid_sub.csv")

# Create age groups
covid$AGE_GROUP <- cut(
  covid$AGE,
  breaks = c(-Inf, 17, 34, 49, 64, Inf),
  labels = c("0-17", "18-34", "35-49", "50-64", "65+")
)

# Create output directory
dir.create("outputs/coder4", recursive = TRUE, showWarnings = FALSE)

# Table 4: Hospitalization status by sex
hospital_table <- table(
  Hospitalization = factor(
    covid$PATIENT_TYPE,
    levels = c("hospitalization", "returned home")
  ),
  Sex = factor(covid$SEX, levels = c("female", "male"))
)

# Calculate column percentages
hospital_pct <- prop.table(hospital_table, margin = 2) * 100

# Combine counts and percentages
table4 <- matrix(
  sprintf("%d (%.1f%%)", hospital_table, hospital_pct),
  nrow = nrow(hospital_table),
  dimnames = dimnames(hospital_table)
)



# Chi-square test
chi_result <- chisq.test(hospital_table)

print(table4)
print(chi_result)



# Save table and test
saveRDS(
  list(table = table4, chi_square = chi_result),
  "outputs/coder4/table4.rds"
)



# Figure 4: Percentage hospitalized by age group and sex
plot_data <- subset(
  covid,
  !is.na(AGE_GROUP) &
    SEX %in% c("female", "male") &
    PATIENT_TYPE %in% c("hospitalization", "returned home")
)



plot_data$hospitalized <- plot_data$PATIENT_TYPE == "hospitalization"

# Calculate percentage hospitalized within each age/sex group
hospital_summary <- aggregate(
  hospitalized ~ AGE_GROUP + SEX,
  data = plot_data,
  FUN = function(x) mean(x) * 100
)



figure4 <- ggplot(
  hospital_summary,
  aes(x = AGE_GROUP, y = hospitalized, fill = SEX)
) +
  geom_col(position = "dodge") +
  labs(
    title = "Hospitalization by Age Group and Sex",
    x = "Age Group",
    y = "Hospitalized (%)",
    fill = "Sex"
  ) +
  theme_minimal()



print(figure4)

ggsave(
  "outputs/coder4/figure4.png",
  plot = figure4,
  width = 8,
  height = 5,
  dpi = 300
)

