## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Load library
library(dplyr)
library(ggplot2)

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total emissions for Motor Vehicles for Baltimore
emissions_by_year_baltimore<- NEI %>%
                                filter(fips == "24510" & type == "ON-ROAD") %>%
                                 group_by(year) %>%
                                 summarize(total_emissions = sum(Emissions))


## Convert emissions_by_year_baltimore$year integer values to a factor
emissions_by_year_baltimore$year <- as.factor(emissions_by_year_baltimore$year)

## Create the plot
ggplot(emissions_by_year_baltimore, aes(x=year, y=total_emissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("Baltimore City PM2.5 Emissions from Vehicle Related Sources")

## Save the plot in png format
dev.copy(png,'plot5.png')
dev.off()

## Observation:
## The motor vehicle emission in Baltimore City shows decreasing trend from 1999 to 2008
## Major downfall is observed between 1999 and 2002

