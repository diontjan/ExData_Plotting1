library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

png(filename = "plot4.png", width = 480, height = 480,  bg = "transparent")
par(mfrow = c(2, 2), mar = c(4, 4, 3, 2), oma = c(1, 1, 1, 1))

#Plot 1,1
plot(dmy_hms(paste(data$Date, data$Time)), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Plot 1,2
plot(dmy_hms(paste(data$Date, data$Time)), data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 2,1
plot(dmy_hms(paste(data$Date, data$Time)), data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dmy_hms(paste(data$Date, data$Time)), data$Sub_metering_2, col = "red")
lines(dmy_hms(paste(data$Date, data$Time)), data$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty = c(1,1,1), col = c("black","red","blue"), legend = colnames(data[7:9]))

#Plot 2,2
plot(dmy_hms(paste(data$Date, data$Time)), data$Global_reactive_power, type = "l", xlab = "datetime", ylab = colnames(data[4]))

dev.off()