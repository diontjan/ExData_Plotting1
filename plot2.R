library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

png(filename = "plot2.png", width = 480, height = 480,  bg = "transparent")

plot(dmy_hms(paste(data$Date, data$Time)), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()