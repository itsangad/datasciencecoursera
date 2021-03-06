## Plot 1 :  Global Active Power distribution

# Data file path (place the file in the working directory)
datapath <- "household_power_consumption.txt"

#Load the data set into sourcedata
sourcedata <- read.table(datapath, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#Filter the dataset
filterData <- sourcedata[sourcedata$Date %in% c("1/2/2007","2/2/2007"),]

#Clean up variable to measure
# class(sourcedata$Global_active_power) # character field
vGlobalActivePower <- as.numeric(filterData$Global_active_power) # convert to numeric

# Create plot using base plotting system
png("plot1.png",width = 480, height = 480) #open device connection
hist(vGlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() # close device connection

