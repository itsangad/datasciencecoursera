## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Load library
library(dplyr)

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total emissions for each year
emissions_by_year <- NEI %>%
                      group_by(year) %>%
                       summarize(total_emissions = sum(Emissions))

## Fill colors in the plot
cols <- c("green", "orange", "yellow", "blue")

## Create the plot
with(emissions_by_year, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from All Sources", col = cols))

## Save the plot in png format
dev.copy(png,'plot1.png')
dev.off()

## Observation:
## Yes, the total emissions from PM2.5 shows decreasing trend in the United States from 1999 to 2008
