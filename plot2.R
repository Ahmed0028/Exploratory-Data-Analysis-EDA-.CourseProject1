FullDataset <- read.table("/Volumes/Files /Coursera/Data Science /EDA/household_power_consumption.txt",header=T, sep=';', na.strings="?", 
+                           nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

subSetData <- FullDataset[Fulldataset$Date %in% c("1/2/2007","2/2/2007") ,]


datecov <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datecov, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
