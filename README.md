# tertiary_edu_GDP

## Hypothesis/Objective:
The hypothesis I want to test is whether there is correlation between tertiary education attainment and national GDP

## Data sets
I am going to use four data sets for this project:

#### 1. Population with Tertiary Education:
-	Population with tertiary education is defined as those having completed the highest level of education, by age group. This includes both theoretical programs leading to advanced research or high skill professions such as medicine and more vocational programs leading to the labour market. The measure is percentage of same age population.

- Source:
https://data.oecd.org/eduatt/population-with-tertiary-education.htm

#### 2. Gapminder
- Source: The `gapminder` dataset that comes with the r package "dplyr"

#### 3. ISO Country Code
- The dataset match the ISO Alpha-3 country code (eg. CAD) with the name (eg. Canada)
The gapminder data set list the country as English names while the Tertiary Education data set list countries in ISO

- Source: r package "countrycode"

#### 4. Country Latitude and Longitude
- The country latitude and longitude data is used for plotting world map

- Source: `map_data` from r package "ggplot2"

## Method
1. Wrangle the four data sets into one table.
2. Explore the data set by visualizing the data by plotting the GDP per Capita on the y-axis and the tertiary education attainment on the y-axis
3. Use the `cor.test` function in r to find the p-value to test the significance of the correlation
4. Visualize the GDP per capita and tertiary education attainment on a world map

## How to Run
1. Clone the `tertiary_edu_GDP` repository from Github
2. On your favorite terminal, navigate to the directory you want to clone the `tertiary_edu_GDP` repository
3. Type the following command in your terminal:
```
git clone https://github.com/susan-fung/tertiary_edu_GDP.git
Rscript src/data_wrangling.R "data/tertiary.csv" "data/gap_map_edu.csv"
Rscript src/corr.R "data/gap_map_edu.csv" "data/corr.csv"
Rscript src/viz.R "data/gap_map_edu.csv" "result/figure"
Rscript -e "ezknitr::ezknit('src/report.Rmd', out_dir = 'doc')"
```
