#! /usr/bin/env Rscript
# Susan Fung, Dec 2017

# This script read in data from tertiary.csv and combines it with ISO country code, GDP per capita
# and country latitude and longitude data.
# The wrangled data set is exported as csv.

# Source of my Population with tertiary education csv: 
# https://data.oecd.org/eduatt/population-with-tertiary-education.htm
# Population with tertiary education is defined as those having completed the 
# highest level of education, by age group. This includes both theoretical programmes
# leading to advanced research or high skill professions such as medicine and more vocational 
# programmes leading to the labour market. The measure is percentage of same age population.

# Since the most updated year in gapminder is 2007, I only looked at the year 2007
# I look at only the 25-34 age group in the tertiary education dataset since I am in that age group

# Usage: Rscript data_wrangling.R "path to tertiary.csv" "path to save the wrangled csv"

library(dplyr)
library(gapminder)
library(countrycode)
library(ggplot2)

args <- commandArgs(trailingOnly = TRUE)
from <- args[1]
to <- args[2]

# Get the country latitude and longitude data
map<-map_data("world") %>%
  mutate(ISO = countrycode(region, "country.name", "iso3c"))

# Get the gapminder dataset for 2007
gap<-gapminder%>%
  filter(year==2007)%>%
  mutate(ISO = countrycode(country, "country.name", "iso3c"))

# Get the tertiary education data for 2007 and age group 25-34
edu<-read.csv(from, strip.white=TRUE)
edu<-edu%>%
  filter(TIME==2007)%>%
  filter(SUBJECT=="25_34")%>%
  select("ï..LOCATION","Value")%>%
  rename("ISO"="ï..LOCATION", "tertiary"="Value")

# Combine the gapminder data with country latitude and longitude data
gap_map<-left_join(gap,map,by="ISO")

# Combine gapminder data, country latitude and longitude data with tertiary education data
gap_map_edu<-left_join(gap_map,edu,by="ISO")

# Filter out NA rows
gap_map_edu<-gap_map_edu %>%
  filter(!is.na(tertiary))

# Export wrangled data set as csv
write.table(gap_map_edu, to, sep = ",",row.names = FALSE, col.names = TRUE)