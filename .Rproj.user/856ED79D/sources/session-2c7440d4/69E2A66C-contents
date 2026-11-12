# DATA550-midterm

# COVID-19 Cases in Mexico

## Project Overview

This project examines the association between sex and COVID-19 clinical outcomes among patients in Mexico. Using a 20% subset of the original dataset, our team investigates pneumonia prevalence, COVID-19 classification, and immunosuppression status.

## Data Source

- **Dataset:** [COVID-19 Cases in Mexico](https://datos.gob.mx/busca/dataset/informacion-referente-a-casos-covid-19-en-mexico)
- **Data File:** `covid_sub.csv`
- **Key Variables:** SEX, AGE, PATIENT_TYPE, PNEUMONIA, INMSUPR, CLASSIFICATION_FINAL

## Project Structure

```text
project/
├── data/
│   ├── covid_sub.csv
│   └── covid_readme.txt
├── scripts/
│   ├── coder1/
│   ├── coder2/
│   └── coder3/
├── outputs/
│   ├── coder1/
│   ├── coder2/
│   └── coder3/
├── reports/
├── misc/
├── Makefile
└── README.md
```

## Instructions for Building the Report

1. Clone the GitHub repository and open the project in RStudio.
2. Ensure R, Make, and the required R packages are installed.
3. Confirm that `covid_sub.csv` is located in the `data/` folder.
4. Open the Terminal in RStudio and run:

```bash
make
```

The Makefile will run the data cleaning and analysis scripts, generate tables and figures, and render the final report.

The completed report will be saved in the `reports/` folder.

## Report Customization

The final report will use R Markdown parameters to allow users to customize the analysis without modifying the underlying code.

Users can select:

- **Outcome:** Pneumonia, COVID-19 classification, or immunosuppression.
- **Population:** Overall study population or results stratified by sex.

Once implemented, these parameters will allow users to generate customized reports through the Makefile.
