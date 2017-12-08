#! /usr/bin/env Rscript
# Susan Fung, Dec 2017

# This script reads in data from the wrangled data set that contains tertiary education, ISO country code, GDP per capita and country latitude and longitude data.
# This script also calculates the Pearson correlation coefficient and p-value between tertiary education attainment and GDP per capita.
# The analysis is exported as csv.

# Usage: Rscript corr.R "path to gap_map_edu.csv" "path to save the correlation analysis csv"

library(broom)

args <- commandArgs(trailingOnly = TRUE)
from <- args[1]
to <- args[2]

# Read in wrangled data set
gap_map_edu<-read.csv(from, strip.white=TRUE)

# Calculate Pearson correlation coefficient and p-value
corr<-tidy(cor.test(gap_map_edu$gdpPercap,gap_map_edu$tertiary))
print(corr)

# Export analysis as csv
write.table(corr, to, sep = ",",row.names = FALSE, col.names = TRUE)

