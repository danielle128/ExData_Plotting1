## read in data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000,stringsAsFactors=FALSE)

## convert date
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- as.Date(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

## select by date
library(dplyr)
subsetted <- filter(df, DateTime >= as.Date("2007-02-01 00:00:00"),  DateTime < as.Date("2007-02-03 00:00:00"))

## plot histogram in png
png("plot1.png")  
hist(subsetted$Global_active_power, breaks = 12, xlab= "Global Active Power (kilowatts)", ylab="Frequency", main= "Global Active Power", freq=TRUE, col = "red", cex.lab=0.8, cex.axis=0.8)
dev.off()

