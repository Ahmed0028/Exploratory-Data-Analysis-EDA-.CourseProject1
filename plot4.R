FullDataset <- read.table("/Volumes/Files /Coursera/Data Science /EDA/household_power_consumption.txt",header=T, sep=';', na.strings="?", 
+                           nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

subSetData <- FullDataset[FullDataset$Date %in% c("1/2/2007","2/2/2007") ,]


datecov <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datecov, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datecov, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datecov, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datecov, subMetering2, type="l", col="red")
lines(datecov, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datecov, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()