# Susan Fung, Dec 2017

# This makefile automates the creation of report for the correlation
# between GDP and tertiary education attainment analysis

# Usage: make all

all: doc/report.md

data/gap_map_edu.csv: data/tertiary.csv src/data_wrangling.R
src/data_wrangling.R "data/tertiary.csv" "data/gap_map_edu.csv"

data/corr.csv: src/corr.R data/gap_map_edu.csv
	Rscript src/corr.R "data/gap_map_edu.csv" "data/corr.csv"

result/figure/scatter.png result/figure/map.png:data/gap_map_edu.csv src/viz.R
	Rscript src/viz.R "data/gap_map_edu.csv" "result/figure"

doc/report.md: src/report.Rmd result/figure/scatter.png result/figure/map.png data/corr.csv
	Rscript -e "ezknitr::ezknit('src/report.Rmd', out_dir = 'doc')"

#clean up intermediate files
clean:
	rm -f data/gap_map_edu.csv
	rm -f data/corr.csv
  rm -f result/figure/scatter.png
  rm -f result/figure/map.png
  rm -f doc/report.md
  rm -f doc/report.html
