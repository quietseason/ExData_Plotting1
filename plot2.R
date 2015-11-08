library(lubridate)

##Read the data
ds <- read.table("household_power_consumption.txt",header = T,sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
myData <- ds[ds$Date %in% c("1/2/2007","2/2/2007"),]

##Making plot
par(mfrow = c(1,1))
with(myData,plot(as.integer(dmy_hms(paste(Date, Time))),Global_active_power,type = "l", xaxt = "n", yaxt = "n", xlab = "",ylab = "Global Active Power (kilowatts)"))
axis(1, at=c(1170288000,1170374400,1170460800), labels = c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6),labels = c(0,2,4,6))

##Copy the plot to png file
dev.copy(png,file = "plot2.png")
dev.off()
