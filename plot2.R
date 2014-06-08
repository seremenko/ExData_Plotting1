file_data <- read.csv('household_power_consumption.txt', sep=';', header=T, na.strings="?")

# cleaning data
data <- subset(file_data, file_data$Date == "2/2/2007" | file_data$Date == "1/2/2007")
data$datetime <- strptime(paste(data$Date, " ", data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

# plot
png(filename = 'plot2.png', width = 480, height = 480)
with(data, plot(datetime, Global_active_power, type="n", main="", ylab="Global Active Power (kilowatts)", xlab=""))
with(data, lines(datetime, Global_active_power))
dev.off()