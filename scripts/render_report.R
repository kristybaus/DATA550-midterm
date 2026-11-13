library(rmarkdown)
library(here)

here::i_am("scripts/render_report.R")

render(
  here::here("report.Rmd"),
  output_file = "report.html",
  knit_root_dir = here::here()
)
