sourceData <- "./household_power_consumption.txt" 
AllData <- read.table(sourceData , header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
SelectedData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(AllData) 

# change date format 
SelectedData$Date <- as.Date(SelectedData$Date, format = "%d/%m/%Y") 
SelectedData$DateTime <- as.POSIXct(paste(SelectedData$Date, SelectedData$Time)) 

## Plot 2 
plot(SelectedData$DateTime,SelectedData$Global_active_power, type="l",lwd=1, ylab="Global Active Power (kilowatts)", xlab="") 

## Saving to file 
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 