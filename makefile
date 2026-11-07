all: finalproject2_Lim.html

output/data_clean.rds: code/01_clean_data.R data.zip
	Rscript code/01_clean_data.R

output/table_one.rds output/fit.rds: code/02_make_table.R output/data_clean.rds
	Rscript code/02_make_table.R

output/figure_one.png: code/03_make_figure.R output/data_clean.rds
	Rscript code/03_make_figure.R

finalproject2_Lim.html: finalproject2_Lim.Rmd output/data_clean.rds output/table_one.rds output/fit.rds output/figure_one.png
	Rscript -e "rmarkdown::render('finalproject2_Lim.Rmd')"
	.PHONY: clean

.PHONY: clean
clean:
	rm -f output/data_clean.rds output/table_one.rds output/fit.rds output/figure_one.png finalproject2_Lim.html