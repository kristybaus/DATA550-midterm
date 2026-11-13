.PHONY: all clean

# Build final report
all: report.html

# Render report
report.html: report.Rmd scripts/render_report.R \
	outputs/coder1/table1.rds outputs/coder1/figure1.png \
	outputs/coder2/table2.rds outputs/coder2/figure2.png \
	outputs/coder3/table3.rds outputs/coder3/figure3.png \
	outputs/coder4/table4.rds outputs/coder4/figure4.png
	Rscript scripts/render_report.R

# Coder 1: Pneumonia and sex
outputs/coder1/table1.rds outputs/coder1/figure1.png &: scripts/coder1/pneumonia.R data/covid_sub.csv
	Rscript scripts/coder1/pneumonia.R

# Coder 2: COVID-19 classification and sex
outputs/coder2/table2.rds outputs/coder2/figure2.png &: scripts/coder2/classification.R data/covid_sub.csv
	Rscript scripts/coder2/classification.R

# Coder 3: Immunosuppression and sex
outputs/coder3/table3.rds outputs/coder3/figure3.png &: scripts/coder3/immunosuppression.R data/covid_sub.csv
	Rscript scripts/coder3/immunosuppression.R

# Coder 4: 
outputs/coder4/table4.rds outputs/coder4/figure4.png &: scripts/coder4/____.R data/covid_sub.csv
	Rscript scripts/coder4/analysis.R

# Remove generated outputs
clean:
	rm -f report.html
	rm -f outputs/coder1/*.rds outputs/coder1/*.png
	rm -f outputs/coder2/*.rds outputs/coder2/*.png
	rm -f outputs/coder3/*.rds outputs/coder3/*.png
	rm -f outputs/coder4/*.rds outputs/coder4/*.png

