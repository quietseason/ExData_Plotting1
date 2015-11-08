##Read the data
ds <- read.table("household_power_consumption.txt",header = T,sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
myData <- ds[ds$Date %in% c("1/2/2007","2/2/2007"),]

##Making plot
par(mfrow = c(1,1))
hist(myData$Global_active_power,xlab = "Global Active Power(kilowatts)",main = "Global Active Power",col = "red")

##Copy the plot to png file
dev.copy(png,file = "plot1.png")
dev.off()
