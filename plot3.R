library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

png(filename = "plot3.png", width = 480, height = 480,  bg = "transparent")

plot(dmy_hms(paste(data$Date, data$Time)), data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dmy_hms(paste(data$Date, data$Time)), data$Sub_metering_2, col = "red")
lines(dmy_hms(paste(data$Date, data$Time)), data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), legend = colnames(data[7:9]))

dev.off()