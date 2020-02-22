data3 <- read.table("household_power_consumption.txt",skip=1,sep=";" , na.strings="?")
names(data3) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data3 <- subset(data3,data3$Date=="1/2/2007" | data3$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
data3$Date <- as.Date(data3$Date, format="%d/%m/%Y")
data3$Time <- strptime(data3$Time, format="%H:%M:%S")
data3[1:1440,"Time"] <- format(data3[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data3[1441:2880,"Time"] <- format(data3[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot3.png", width=480, height=480)

# calling the basic plot functions
plot(data3$Time,data3$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data3,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data3,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data3,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")
dev.off()