here::i_am("code/02_make_table.R")

data <- readRDS(here::here("output/data_clean.rds"))

fit <- lm(methylation ~ age + group, data = data)

table_one <- round(summary(fit)$coefficients, 3)
rownames(table_one) <- c("Intercept", "Age (per year)", "Alzheimer's disease")   

saveRDS(table_one, file = here::here("output/table_one.rds"))
saveRDS(fit, file = here::here("output/fit.rds"))                              