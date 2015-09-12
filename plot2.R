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
## plot line in png
png("plot2.png")  
plot(subsetted$DateTime,subsetted$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = " ")
dev.off()
