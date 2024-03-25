here::i_am("coding/02_make_output2.R")

data <- readRDS(
  file = here::here("clean_data/simulated_data.rds")
)

library(dplyr)

data <- data %>%
  mutate(testcat=case_when(testcat=="less than annual"~"Less than Annual",
                           testcat=="annual"~"Annual",
                           TRUE~"Greater than Annual")) %>% 
  mutate(testcat=factor(testcat, levels=c("Less than Annual", "Annual", "Greater than Annual"))) 

library(ggplot2)

barplot <- ggplot(data, aes(x=testcat)) +
  geom_bar(fill="lightgreen") +
  labs(
    title="Distribution of HIV Testing Frequency (n=500)",
    x="HIV Testing Frequency",
    y="Number of Individuals"
  ) +
  theme_bw()

ggsave(
  here::here("figure/barplot.jpeg"),
  plot=barplot,
  device="jpeg"
)

# barchart_data <- data.frame(
#   name =c("Less than Annual Testing", "Annual Testing", "Greater than Annual Testing"), value=c(187, 48, 265)
# )
# 
# jpeg(
#   here::here("figure/barplot.jpeg"))
# 
# barplot(height= barchart_data$value, names=barchart_data$name, xlab = "HIV Testing Frequency", ylab = "Number of Individuals (N=500)")
# 
# 
# dev.off()