

data <- read.table("household_power_consumption.txt")
datause <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
hist(as.numeric(as.character(data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()


