# Get dataset

dataFile <- read.table(file.choose(), header=T, sep=";", na.strings="?")
dataFile$Date <- as.Date(dataFile$Date, format="%d/%m/%Y")

#Subset from original dataset
?subset
dataSub <- subset(dataFile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))



#Converting date & time variables
myDateTime <- paste(as.Date(dataSub$Date), dataSub$Time); dataSub$Datetime <- as.POSIXct(myDateTime)

#Plotting and saving the plot
hist(dataSub$Global_reactive_power, main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", col ="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()