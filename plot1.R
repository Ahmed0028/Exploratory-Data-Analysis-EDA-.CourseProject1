
FullDataset <- read.table("/Volumes/Files /Coursera/Data Science /EDA/household_power_consumption.txt",header=T, sep=';', na.strings="?", 
+                           nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

subSetData <- FullDataset[FullDataset$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
