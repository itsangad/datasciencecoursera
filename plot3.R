## Plot 3 :  Energy Sub Metering per day

# Data file path (place the file in the working directory)
datapath <- "household_power_consumption.txt"

#Load the data set into sourcedata
sourcedata <- read.table(datapath, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#Filter the dataset
filterData <- sourcedata[sourcedata$Date %in% c("1/2/2007","2/2/2007"),]

#Clean up variable to measure
# class(sourcedata$Sub_metering_1) # character field
vSub_metering_1 <- as.numeric(filterData$Sub_metering_1) # convert to numeric
vSub_metering_2 <- as.numeric(filterData$Sub_metering_2) # convert to numeric
vSub_metering_3 <- as.numeric(filterData$Sub_metering_3) # convert to numeric

# Combine date and time variables
vDateTime <- paste(filterData$Date, filterData$Time, sep = " ")

# Convert vDateTime to "POSIXlt" class
vDateTimeConverted <- strptime(vDateTime, "%d/%m/%Y %H:%M:%S")
#class(vDateTimeConverted)


# Create plot using base plotting system
png("plot3.png",width = 480, height = 480) #open device connection
plot(vDateTimeConverted,vSub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(vDateTimeConverted, vSub_metering_2, col = "red")
lines(vDateTimeConverted, vSub_metering_3, col = "blue")

# Adding the legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off() # close device connection

