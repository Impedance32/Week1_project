data <- read.table("household_power_consumption.txt")

FullTimeDate <- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, FullTimeDate)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

subsetdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

png("plot3.png", width=480, height=480)
with(subsetdata, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_2,type="l", col= "red")
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_3,type="l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col = c("black", "red", "blue"))
dev.off()