file_data <- read.csv('household_power_consumption.txt', sep=';', header=T, na.strings="?")

# cleaning data
data <- subset(file_data, file_data$Date == "2/2/2007" | file_data$Date == "1/2/2007")
data$datetime <- strptime(paste(data$Date, " ", data$Time), format = "%d/%m/%Y %H:%M:%S")


# plot
png(filename = 'plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))

with(data, plot(datetime, Global_active_power, type="n", ylab="Global active power", xlab=""))
with(data, lines(datetime, Global_active_power))


with(data, plot(datetime, Voltage, type="n", main="", ylab="Voltage", xlab="datetime"))
with(data, lines(datetime, Voltage))

with(data, plot(datetime, Sub_metering_1, type="n", main="", ylab="Energy sub metering", xlab=""))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright", pch = "-", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(datetime, Global_reactive_power, type="n", main=""))
with(data, lines(datetime, Global_reactive_power))

dev.off()