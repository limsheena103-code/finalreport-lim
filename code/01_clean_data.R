here::i_am("code/01_clean_data.R")
library(dplyr)

zip_path <- here::here("data.zip")                       
elovl2_path <- here::here("output/elovl2.rds")

map <- read.csv(unz(zip_path, "ai4bio_trainset/trainmap.csv"))   # sample_id, age, gender, sample_type, disease

if (!file.exists(elovl2_path)) {                        
  con <- unz(zip_path, "ai4bio_trainset/traindata.csv", open = "r")
  header <- readLines(con, n = 1)                        
  
  repeat {
    line <- readLines(con, n = 1)                        
    if (grepl("^\"?cg16867657", line)) break             # stop at the ELOVL2 site
  }
  close(con)
  
  elovl2 <- data.frame(
    sample_id   = gsub('"', "", strsplit(header, ",")[[1]])[-1],   
    methylation = as.numeric(strsplit(line, ",")[[1]][-1])
  )
  saveRDS(elovl2, file = elovl2_path)
}

elovl2 <- readRDS(elovl2_path)

data <- map |>
  filter(disease %in% c("control", "Alzheimer's disease")) |>
  inner_join(elovl2, by = "sample_id") |>
  mutate(group = factor(disease,
                        levels = c("control", "Alzheimer's disease"),
                        labels = c("Control", "Alzheimer's disease")))   # Control = reference group

saveRDS(data, file = here::here("output/data_clean.rds"))