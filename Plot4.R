# Project 1 Plot 4
#
sourceData <- "./household_power_consumption.txt" 
AllData <- read.table(sourceData , header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
SelectedData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(AllData) 

# change date format 
SelectedData$Date <- as.Date(SelectedData$Date, format = "%d/%m/%Y") 
SelectedData$DateTime <- as.POSIXct(paste(SelectedData$Date, SelectedData$Time)) 

#  
par(mfrow=c(2,2))  
# upper left 
plot(SelectedData$DateTime, SelectedData$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")  
# upper right 
plot(SelectedData$DateTime, SelectedData$Voltage, type="l", xlab="datetime", ylab="Voltage")    
# bottom left 
plot(SelectedData$DateTime, SelectedData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="") 
lines(SelectedData$DateTime, SelectedData$Sub_metering_2, type="l", col="red") 
lines(SelectedData$DateTime, SelectedData$Sub_metering_3, type="l", col="blue") 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
# bottom right 
plot(SelectedData$DateTime, SelectedData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")   

## Save to file 
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 