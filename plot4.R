## Plot 4 :  Multiple plots in a screen

# Data file path (place the file in the working directory)
datapath <- "household_power_consumption.txt"

#Load the data set into sourcedata
sourcedata <- read.table(datapath, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#Filter the dataset
filterData <- sourcedata[sourcedata$Date %in% c("1/2/2007","2/2/2007"),]

#Clean up variable to measure

# class(sourcedata$Global_active_power) # character field
vGlobalActivePower <- as.numeric(filterData$Global_active_power) # convert to numeric

# class(sourcedata$Global_reactive_power) # character field
vGlobalReactivePower <- as.numeric(filterData$Global_reactive_power)

# class(sourcedata$Voltage) # character field
vVoltage <- as.numeric(filterData$Voltage)

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
png("plot4.png",width = 480, height = 480) #open device connection

# set the screen orientation
par(mfrow = c(2,2))

# Chart 1
plot(vDateTimeConverted, vGlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Chart 2
plot(vDateTimeConverted, vVoltage, type="l", xlab="datetime", ylab="Voltage")

# Chart 3
plot(vDateTimeConverted,vSub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(vDateTimeConverted, vSub_metering_2, col = "red")
lines(vDateTimeConverted, vSub_metering_3, col = "blue")

# Adding the legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"),bty = 0)

# Chart 4
plot(vDateTimeConverted, vGlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() # close device connection

