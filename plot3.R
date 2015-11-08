library(lubridate)

##Read the data
ds <- read.table("household_power_consumption.txt",header = T,sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
myData <- ds[ds$Date %in% c("1/2/2007","2/2/2007"),]

##Making plot
par(mfrow = c(1,1))
with(myData,plot(as.integer(dmy_hms(paste(Date, Time))),Sub_metering_1,type = "l", xaxt = "n", yaxt = "n", xlab = "",ylab = "Energy sub metering"))
with(myData,lines(as.integer(dmy_hms(paste(Date, Time))),Sub_metering_2,col = "red"))
with(myData,lines(as.integer(dmy_hms(paste(Date, Time))),Sub_metering_3,col = "blue"))
axis(1, at=c(1170288000,1170374400,1170460800), labels = c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30),labels = c(0,10,20,30))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c("solid","solid","solid"))

##Copy the plot to png file
dev.copy(png,file = "plot3.png")
dev.off()
