FROM rocker/r-ubuntu as base

RUN mkdir /project
WORKDIR /project

RUN mkdir coding
RUN mkdir figure
RUN mkdir table
RUN mkdir clean_data
COPY clean_data clean_data
COPY coding coding
COPY Makefile .
COPY coding/FinalProjectRMarkdown.Rmd .

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.RENV_PATHS_CACHE

RUN Rscript -e "renv::restore()"

RUN apt-get update && apt-get install -y pandoc

RUN mkdir report

CMD make && mv coding/FinalProjectRMarkdown.html report