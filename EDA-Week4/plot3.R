## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Load library
library(dplyr)
library(ggplot2)

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total emissions for each year for Baltimore City
emissions_by_year_baltimore <- NEI %>%
                                filter(fips == "24510") %>%
                                 group_by(year, type) %>%  ## added "type" in the group by
                                  summarize(total_emissions = sum(Emissions))


## Convert emissions_by_year_baltimore$year integer values to a factor
emissions_by_year_baltimore$year <- as.factor(emissions_by_year_baltimore$year)

## Create the plot
ggplot(emissions_by_year_baltimore, aes(x=year, y=total_emissions)) + geom_bar(stat="identity") + facet_grid(. ~ type) + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("Baltimore City PM2.5 Emissions by Type")

## Save the plot in png format
dev.copy(png,'plot3.png')
dev.off()

## Observation:
## Nonroad, nonpoint and on-road shows relatively decreasing trends
## While, Point shows an increasing trend from 1999 to 2008

