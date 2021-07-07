## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Load library
library(dplyr)
library(ggplot2)

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset of Coal Combustion based on EI.Sector variable
coal_SCCs <- SCC %>%
              filter(grepl("coal", EI.Sector, ignore.case=TRUE)) %>%
               select(SCC)

## Total emissions related to coal-combustion
emissions_by_year_coal<- NEI %>%
                          filter(SCC %in% coal_SCCs$SCC) %>%
                           group_by(year) %>%
                            summarize(total_emissions = sum(Emissions))


## Convert emissions_by_year_coal$year integer values to a factor
emissions_by_year_coal$year <- as.factor(emissions_by_year_coal$year)

## Create the plot
ggplot(emissions_by_year_coal, aes(x=year, y=total_emissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("US PM2.5 Emissions from Coal Related Sources")

## Save the plot in png format
dev.copy(png,'plot4.png')
dev.off()

## Observation:
## Except for 2008, for others the coal combustion related emissions have been somewhat similar.

