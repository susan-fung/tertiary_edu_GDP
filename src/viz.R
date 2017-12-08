#! /usr/bin/env Rscript
# Susan Fung, Dec 2017

# This script reads in data from the wrangled data set that contains tertiary education, ISO country 
# code, GDP per capita and country latitude and longitude data.
# This script makes two visualizations and they are saved as png

# Usage: Rscript viz.R "path to gap_map_edu.csv" "path to save the visualizations"

library(ggplot2)

args <- commandArgs(trailingOnly = TRUE)
from <- args[1]
path1<-args[2]

# Read in data from the wrangled data set
gap_map_edu<-read.csv(from, strip.white=TRUE)

# Make a scatter graph
scatter<-ggplot(gap_map_edu, aes(gdpPercap,tertiary))+
  geom_point(aes(color=continent), size = 3)+
  geom_smooth(method = "lm", color = "grey")+
  labs(title="World Tertiary Education Attaintment and GDP")
ggsave(filename = "scatter.png", plot = scatter, path = path1)

# Make a world map
map<-ggplot(gap_map_edu) +
  geom_polygon(aes(x = long, y = lat, group = group, fill = tertiary))+
  scale_fill_gradient(low = "white", high = "blue", name="Tertiary Education Attaintment %")+
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank())+
  labs(title="World Tertiary Education Attaintment by Country")
ggsave(filename = "map.png", plot = map, path = path1)
