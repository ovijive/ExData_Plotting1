# Get dataset

dataFile <- read.table(file.choose(), header=T, sep=";", na.strings="?")
dataFile$Date <- as.Date(dataFile$Date, format="%d/%m/%Y")

#Subset from original dataset
?subset
dataSub <- subset(dataFile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting date & time variables
myDateTime <- paste(as.Date(dataSub$Date), dataSub$Time); 
dataSub$Datetime <- as.POSIXct(myDateTime)

#Plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataSub, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l",  xlab="", ylab="Voltage (volt)")
  plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()