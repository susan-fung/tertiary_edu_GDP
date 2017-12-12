# Docker file for tertiary_edu_GDP
# Susan Fung, Dec, 2017

# Use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# Install ezknitr packages
RUN R -e "install.packages('ezknitr', repos='http://cran.us.r-project.org')"

# Change directory and provide default for executing container
CMD cd C:/Users/I834598/Desktop/tertiary_edu_GDP && make all
