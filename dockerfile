# Docker file for tertiary_edu_GDP
# Susan Fung, Dec, 2017

# Use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# Restore the R environment from packrat
RUN Rscript -e "packrat::restore()"

# Run Makefile
RUN make all
