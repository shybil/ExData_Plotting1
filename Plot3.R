# Project 1 Plot 3
#
sourceData <- "./household_power_consumption.txt" 
AllData <- read.table(sourceData , header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
SelectedData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(AllData) 

# change date format 
SelectedData$Date <- as.Date(SelectedData$Date, format = "%d/%m/%Y") 
SelectedData$DateTime <- as.POSIXct(paste(SelectedData$Date, SelectedData$Time)) 
#
plot(SelectedData$DateTime, SelectedData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="") 
lines(SelectedData$DateTime, SelectedData$Sub_metering_2, type="l", col="red") 
lines(SelectedData$DateTime, SelectedData$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue")) 

## Save to file 
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 