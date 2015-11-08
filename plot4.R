library(lubridate)

##Read the data
ds <- read.table("household_power_consumption.txt",header = T,sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
myData <- ds[ds$Date %in% c("1/2/2007","2/2/2007"),]


par(mfrow = c(2,2))
par(mar = c(4,4,2.5,4))
##Making 1st plot
with(myData,{
    ##1st plot
    plot(as.integer(dmy_hms(paste(Date, Time))),Global_active_power,type = "l", xaxt = "n", yaxt = "n", xlab = "",ylab = "Global Active Power")
    axis(1, at=c(1170288000,1170374400,1170460800), labels = c("Thu","Fri","Sat"))
    axis(2, at=c(0,2,4,6),labels = c(0,2,4,6))
    ##2nd plot
    plot(as.integer(dmy_hms(paste(Date, Time))),Voltage, type = "l", xaxt = "n", yaxt = "n", xlab = "datetime",ylab = "Voltage")
    axis(1, at=c(1170288000,1170374400,1170460800), labels = c("Thu","Fri","Sat"))
    axis(2, at=c(234,238,242,246),labels = c(234,238,242,246))
    ##3rd plot
    plot(as.integer(dmy_hms(paste(Date, Time))),Sub_metering_1,type = "l", xaxt = "n", yaxt = "n", xlab = "",ylab = "Energy sub metering")
    lines(as.integer(dmy_hms(paste(Date, Time))),Sub_metering_2,col = "red")
    lines(as.integer(dmy_hms(paste(Date, Time))),Sub_metering_3,col = "blue")
    axis(1, at=c(1170288000,1170374400,1170460800), labels = c("Thu","Fri","Sat"))
    axis(2, at=c(0,10,20,30),labels = c(0,10,20,30))
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c("solid","solid","solid"),bty = "n", cex = 0.7)
    ##4th plot
    plot(as.integer(dmy_hms(paste(Date, Time))),Global_reactive_power, type = "l", xaxt = "n", yaxt = "n", xlab = "datetime",ylab = "Global_reactive_power")
    axis(1, at=c(1170288000,1170374400,1170460800), labels = c("Thu","Fri","Sat"))
    axis(2, at=c(0.0,0.1,0.2,0.3,0.4,0.5),labels = c(0.0,0.1,0.2,0.3,0.4,0.5))
})

##Copy the plot to png file
dev.copy(png,file = "plot4.png")
dev.off()
