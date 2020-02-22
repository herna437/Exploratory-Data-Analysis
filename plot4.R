# load and subset the data
data4 <- read.table("household_power_consumption.txt",skip=1,sep=";" , na.strings="?")
names(data4) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data4 <- subset(data4,data4$Date=="1/2/2007" | data4$Date =="2/2/2007")

 
data4$Date <- as.Date(data4$Date, format="%d/%m/%Y")
data4$Time <- strptime(data4$Time, format="%H:%M:%S")
data4[1:1440,"Time"] <- format(data4[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data4[1441:2880,"Time"] <- format(data4[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
data4$Voltage<-as.numeric(as.character(data4$Voltage))
data4$Global_active_power<-as.numeric(as.character(data4$Global_active_power))
data4$Sub_metering_1<-as.numeric(as.character(data4$Sub_metering_1))
data4$Sub_metering_2<-as.numeric(as.character(data4$Sub_metering_2))
data4$Sub_metering_3<-as.numeric(as.character(data4$Sub_metering_3))
data4$Global_reactive_power<-as.numeric(as.character(data4$Global_reactive_power))


#Plot the data
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(data4,{plot(data4$Time,data4$Global_active_power,type="l",  xlab="",ylab="Global Active Power")  
  plot(data4$Time,data4$Voltage, type="l",xlab="datetime",ylab="Voltage")
  plot(data4$Time,data4$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(data4,lines(Time,Sub_metering_1))
  with(data4,lines(Time,Sub_metering_2),col="red")
  with(data4,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)
  plot(data4$Time,as.numeric(as.character(data4$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()