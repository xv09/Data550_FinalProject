# Data 550 Final Project

------------------------------------------------------------------------
## Building Docker Image
The Docker image called `finalprojectimage` can be built by running `Make project_image' in the Terminal or pulling the image from the public repository it lives in [here](https://hub.docker.com/repository/docker/xv09/finalprojectimage/general) using Docker pull command.

## Running automated version of Docker image
command
Run the containerized code by typing `make final_report/FinalProjectRMarkdown.html` into the terminal. This command mounts a local directory called `report` to the container and allows for the retrieval of the final .html document titled `FinalProjectRMarkdown.html` that is produced.

NOTE: this target was designed for a Mac/Linux OS. Windows systems using git bash may require an extra `/` at the start of a file path when mounting the directory. 

  
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
    
 
