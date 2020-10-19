## Plot 2 :  Global Active Power per day

# Data file path (place the file in the working directory)
datapath <- "household_power_consumption.txt"

#Load the data set into sourcedata
sourcedata <- read.table(datapath, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#Filter the dataset
filterData <- sourcedata[sourcedata$Date %in% c("1/2/2007","2/2/2007"),]

#Clean up variable to measure
# class(sourcedata$Global_active_power) # character field
vGlobalActivePower <- as.numeric(filterData$Global_active_power) # convert to numeric

# Combine date and time variables
vDateTime <- paste(filterData$Date, filterData$Time, sep = " ")

# Convert vDateTime to "POSIXlt" class
vDateTimeConverted <- strptime(vDateTime, "%d/%m/%Y %H:%M:%S")
#class(vDateTimeConverted)


# Create plot using base plotting system
png("plot2.png",width = 480, height = 480) #open device connection
plot(vDateTimeConverted,vGlobalActivePower, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() # close device connection

