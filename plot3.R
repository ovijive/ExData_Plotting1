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
with(dataSub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()