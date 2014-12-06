sourceData <- "./household_power_consumption.txt" 
AllData <- read.table(sourceData , header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
SelectedData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(AllData) 

 
datetime <- paste(as.Date(SelectedData$Date), SelectedData$Time) 
SelectedData$Datetime <- as.POSIXct(datetime) 
globalActivePower <- as.numeric(SelectedData$Global_active_power)
 
## Plot 1 
hist(globalActivePower, main="Global Active Power",  
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
 

## Saving to file 
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 