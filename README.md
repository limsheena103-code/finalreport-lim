# ELOVL2 Methlyation, age, and Alzheimer's Disease

This project examines DNA methlyation at cg16867657, a CpG site in the ELOVL2 gene, which is believed to increase methlyation with age. Thus, it should regres on chronological age and Alzheimer's status. 

# Data

The data come from the Kaggle dataset Age Assessment & Disease Risk Prediction. The full download is too large to include in this repository (about 9.5 GB compressed and 61 GB uncompressed), so two smaller files are included instead:
- data/trainmap.csv: sample ID, age, gender, sample type, and disease status for each training sample, extracted from the Kaggle download.
- output/elovl2.rds: methylation values at cg16867657 for every training sample, created by code/01_clean_data.R from traindata.csv in the Kaggle download.

Note: output/elovl2.rds is included becuase the full methylation file is too large for github. 

# Building The Report

Run from project folder to create finalproject2_Lim.html:
```
make
```

Run to delete generated outputs:
```
make clean
```
Note: elovl2.rds is not deleted

# Files in Repo

code/01_clean_data.R: Extracts cg16867657 from the raw data and joins it to identifying sample information and saves as output/data_clean.rds

code/02_make table.R: fits regression model and saves output/table_one.rds and output/fit.rds

code/03_make_figure.R: Makes the scatterplot of methylation by age and saves output/figure_one.png

finalproject2_Lim.Rmd: R markdown report that create .html

makefile: runs report in order to make report