# DATA550-midterm

COVID-19 Cases in Mexico: Midterm Project

Project Overview

This project examines the association between sex and COVID-19 clinical outcomes among patients in Mexico. Using a 20% subset of the original dataset, our team investigates pneumonia prevalence, COVID-19 classification, and immunosuppression status.

Data Source

Dataset: COVID-19 Cases in Mexico

Key Variables: SEX, AGE, PATIENT_TYPE, PNEUMONIA, INMSUPR, CLASSIFICATION_FINAL

Project Structure

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

Instructions for Building the Report

Clone the GitHub repository and open the project in RStudio.

Ensure R and Make are installed on your computer.

Place the dataset in the data/ folder.

Open the Terminal in RStudio and run:

make

The Makefile will execute the required scripts, generate tables and figures, and render the final report.

To rebuild the report after making changes, run make again. The generated report will be saved in the reports/ folder.

Report Customization

The final report will use R Markdown parameters to allow users to customize the analysis without modifying the underlying code.

Users can select:

Outcome: Pneumonia, COVID-19 classification, or immunosuppression.

Population: Overall study population or results stratified by sex.

The Makefile will support generating the report with the selected parameters once these options are implemented.
