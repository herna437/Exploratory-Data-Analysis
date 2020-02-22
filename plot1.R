png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(data$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main=NULL)
title(main="Global Active Power")
dev.off()