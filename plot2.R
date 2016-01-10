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
plot(dataSub$Global_active_power~dataSub$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Saving plot in .pdf
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()