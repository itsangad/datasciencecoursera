## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## Load library
library(dplyr)

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total emissions for each year for Baltimore City
emissions_by_year_baltimore <- NEI %>%
                                 filter(fips == "24510") %>%
                                  group_by(year) %>%
                                   summarize(total_emissions = sum(Emissions))

## Fill colors in the plot
cols <- c("green", "orange", "yellow", "blue")

## Create the plot
with(emissions_by_year_baltimore, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from Baltimore City Sources", col = cols))

## Save the plot in png format
dev.copy(png,'plot2.png')
dev.off()

## Observation:
## Yes, the total emissions from PM2.5 shows compratively decreasing trend in the Baltimore City from 1999 to 2008

