# DATA550-midterm

# COVID-19 Cases in Mexico

## Project Overview

This project examines the association between sex and COVID-19 clinical outcomes among patients in Mexico. Using a 20% subset of the original dataset, our team investigates pneumonia prevalence, COVID-19 classification, immunosuppression, and hospitalization status.

## Team Members and Analyses

| Team Member | Role | Analysis |
|---|---|---|
| Kristina Baus | Team Lead | Repository management, code integration, and report development |
| Sheena Lim | Coder 1 | Pneumonia and sex |
| Lauren McGarvey | Coder 2 | COVID-19 classification and sex |
| Elenzie France | Coder 3 | Immunosuppression and sex |
| Abigail Yemisrach | Coder 4 | Hospitalization and sex |

Each coder contributes a summary table and figure to the final report.

## Data Source

- **Dataset:** [COVID-19 Cases in Mexico](https://datos.gob.mx/busca/dataset/informacion-referente-a-casos-covid-19-en-mexico)
- **Data File:** `covid_sub.csv`

Key variables include:
- `SEX`: Patient sex
- `AGE`: Patient age
- `PNEUMONIA`: Pneumonia status
- `CLASIFFICATION_FINAL`: COVID-19 classification
- `INMSUPR`: Immunosuppression status
- `PATIENT_TYPE`: Outpatient or hospitalized status

## Project Structure

```text
DATA550-midterm/
├── data/
│   └── covid_sub.csv
├── scripts/
│   ├── coder1/
│   │   └── pneumonia.R
│   ├── coder2/
│   │   └── classification.R
│   ├── coder3/
│   │   └── immunosuppression.R
│   ├── coder4/
│   │   └── analysis.R
│   └── render_report.R
├── outputs/
│   ├── coder1/
│   ├── coder2/
│   ├── coder3/
│   └── coder4/
├── report.Rmd
├── Makefile
├── README.md
└── report.html
```

## Instructions for Building the Report

Install the R packages by running the following command in the RStudio Console:

```r
install.packages(c(
  "tidyverse",
  "here",
  "rmarkdown",
  "knitr",
  "gtsummary",
  "kableExtra"
))
```

1. Clone the GitHub repository and open the project in RStudio.
2. Ensure R, Make, and the required R packages are installed.
3. Confirm that `covid_sub.csv` is located in the `data/` folder.
4. Open the Terminal in RStudio and run:

```bash
make
```

The Makefile will run the data cleaning and analysis scripts, generate tables and figures, and render the final report.

The completed report will be saved in the project root.

## Report Customization

The final report will use R Markdown parameters to allow users to customize the analysis without modifying the underlying code.

The `outcome` parameter determines which analysis is included in the report.

| Value | Description |
|---|---|
| `all` | Displays all four analyses |
| `pneumonia` | Displays the pneumonia analysis |
| `classification` | Displays the COVID-19 classification analysis |
| `immunosuppression` | Displays the immunosuppression analysis |
| `hospitalization` | Displays the hospitalization analysis |

Once implemented, this parameter will allow users to generate customized reports through the Makefile.
