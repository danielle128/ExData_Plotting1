## read in data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000,stringsAsFactors=FALSE)

## convert date
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- as.Date(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

## select by date
library(dplyr)
subsetted <- filter(df, DateTime >= as.Date("2007-02-01 00:00:00"),  DateTime < as.Date("2007-02-03 00:00:00"))

subsetted$DateTime <- paste(subsetted$Date, subsetted$Time)
subsetted$DateTime <- strptime(subsetted$DateTime, format = "%d/%m/%Y %H:%M:%S")
## plot lines in png
png("plot3.png") 

with(subsetted, plot(DateTime,Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = " "))
with(subsetted, lines(DateTime,Sub_metering_2, col = "red"))
with(subsetted, lines(DateTime,Sub_metering_3, col = "blue"))
## add legend
legend("topright",lty=c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
