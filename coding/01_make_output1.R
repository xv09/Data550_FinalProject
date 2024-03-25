here::i_am("coding/01_make_output1.R")

data <- readRDS(
  file = here::here("clean_data/simulated_data.rds")
)

suppressPackageStartupMessages(library(table1))
library(dplyr)
library(gtsummary)

table_1 <- data %>%
  select(-id)%>%
  mutate(testcat=factor(testcat, labels = c("Less than annual", "Annual","Greater than annual"))) %>%
  mutate(prep=factor(prep, labels = c("No", "Yes"))) %>%
  tbl_summary(by="testcat",
              label = list(
                age ~ "Age (y)",
                race ~ "Race",
                income ~ "Household Income (/year)",
                education ~ "Highest Education Obtained",
                prep ~ "PrEP use in past 12 months",
                stigma ~ "Ever experienced stigma",
                rurality ~ "Rural/Urban Classification (NCHS 2013)",
                food_sec ~ "Experienced Food Insecurity",
                region ~ "Region",
                insurance ~ "Insurance Status"
              )) %>% add_overall() %>%
  modify_caption("Table 1. Participant Characteristics by HIV Testing Frequency") %>% bold_labels()


table_1

saveRDS(
  table_1, file = here::here("table/table1.rds")
)