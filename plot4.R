## convert datesource('analyze.r')
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- as.Date(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

## select by date
library(dplyr)
subsetted <- filter(df, DateTime >= as.Date("2007-02-01 00:00:00"),  DateTime < as.Date("2007-02-03 00:00:00"))

subsetted$DateTime <- paste(subsetted$Date, subsetted$Time)
subsetted$DateTime <- strptime(subsetted$DateTime, format = "%d/%m/%Y %H:%M:%S")
## plot lines in png
png("plot4.png") 
par(mfrow = c(2,2))
# plot upper left
with(subsetted, plot(DateTime,Global_active_power, type = "l", xlab = " ", ylab="Global Active Power (kilowatts)"))
# plot upper right
with(subsetted, plot(DateTime,Voltage, type = "l", xlab = "datetime", ylab="Voltage"))
# plot lower left          
with(subsetted, plot(DateTime,Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = " "))
with(subsetted, lines(DateTime,Sub_metering_2, col = "red"))
with(subsetted, lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright",lty=c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
#plot upper right
with(subsetted, plot(DateTime,Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power"))
dev.off()
