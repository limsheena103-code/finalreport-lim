here::i_am("code/03_make_figure.R")
library(ggplot2)

data <- readRDS(here::here("output/data_clean.rds"))

figure_one <- ggplot(data, aes(x = age, y = methylation, color = group)) +
  geom_point(alpha = 0.4) +                                
  geom_smooth(method = "lm") +                        
  labs(x = "Age (years)", y = "ELOVL2 methylation (cg16867657)", color = "Group")

ggsave(here::here("output/figure_one.png"), plot = figure_one,
       width = 7, height = 5, dpi = 300)                   