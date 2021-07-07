## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?

## Load library
library(dplyr)
library(ggplot2)

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total emissions for Motor Vehicles for Baltimore and California by Year and Fips (Counties)
emissions_by_year_compare<- NEI %>%
                                filter(fips %in% c("24510", "06037") & type == "ON-ROAD") %>%
                                 group_by(year, fips) %>%
                                  summarize(total_emissions = sum(Emissions))


## Convert emissions_by_year_compare$year integer values to a factor
emissions_by_year_compare$year <- as.factor(emissions_by_year_compare$year)

## Adding County Names
emissions_by_year_compare$county_name <- factor(emissions_by_year_compare$fips, levels=c("06037", "24510"), labels=c("Los Angeles County", "Baltimore City"))

## Create the plot
ggplot(emissions_by_year_compare, aes(x=year, y=total_emissions)) + geom_bar(stat="identity", aes(fill=county_name), position = "dodge") + guides(fill=guide_legend(title=NULL)) +
  labs(x="Year", y="PM2.5 Emissions (tons)") +
  ggtitle("Vehicle PM2.5 Emissions - Baltimore City and LA County") +
  theme(legend.position="bottom")

## Save the plot in png format
dev.copy(png,'plot6.png')
dev.off()

## Observation:
## The motor vehicle emission in Baltimore City shows decreasing trend from 1999 to 2008
## While the motor vehicle emission in California shows slight increasing trend from 1999 to 2005

