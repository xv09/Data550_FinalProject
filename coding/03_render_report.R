here::i_am("coding/03_render_report.R")

library(rmarkdown)

rmarkdown::render(
  here::here("coding/FinalProjectRMarkdown.Rmd")
)