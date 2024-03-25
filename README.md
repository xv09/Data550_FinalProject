# Data 550 Final Project

> Part 4 Organization and GitHub Repository

------------------------------------------------------------------------

## Initial code description

`coding/01_make_output1.R`

  - creates table 1 with participant demographic information
  - saves table 1 as a `.rds` object in `table/` folder

`coding/02_make_output2.R`

  - creates barplot of number of participants by testing frequency (less than
  annual, annual, and greater than annual)
  - saves barplot as `.jpeg` object in `figure\` folder
  
`coding/03_render_report.R`
 
  - renders `report.Rmd`

`FinalProjectRMarkdown.Rmd`

  - reads table and figure made by `coding/01_make_output1.R` and 
    `coding/02_make_output2.R`
    
  To produce final report
  - download the project files on a local computer and save it in the desired location
  - in terminal, `cd` into the project directory
  - type/run `MAKE` in terminal