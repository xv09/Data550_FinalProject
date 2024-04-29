#REPORT-ASSOCIATED RULES
#render report
FinalProjectRMarkdown.html: coding/03_render_report.R coding/FinalProjectRMarkdown.Rmd table/table1.rds figure/barplot.jpeg
	Rscript coding/03_render_report.R

#table 1
table/table1.rds: coding/01_make_output1.R clean_data/simulated_data.rds
	Rscript coding/01_make_output1.R

#barplot
figure/barplot.jpeg: coding/02_make_output2.R clean_data/simulated_data.rds
	Rscript coding/02_make_output2.R

#clean
clean:
	rm -f figure/*.jpeg && rm -f table/*.rds && rm -f coding/*.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"

#DOCKER-ASSOCIATED RULES
PROJECTFILES = coding/01_make_output1.R coding/02_make_output2.R coding/03_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

#rule to build image
project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t xv09/finalprojectimage .
	touch $@

#rule to build report automatically in our container 
final_report/FinalProjectRMarkdown.html:
	docker run -v "$$(pwd)"/report:/project/report xv09/finalprojectimage
	