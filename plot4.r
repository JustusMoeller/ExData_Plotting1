data <- read.csv("household_power_consumption.txt", sep=";")
dates <- c("1/2/2007", "2/2/2007")

data <- subset(data, data$Date %in% dates)
# this is the same code for all 4 source files

# obtain the data relevant for plot #4

# data preparation
data$DateTime <- paste(data$Date, data$Time, sep="/")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y/%H:%M:%S")

# top left
data$Global_active_power <- as.numeric(paste(data$Global_active_power))
data$Global_active_power <- data$Global_active_power/1000
data$Global_active_power <- data$Global_active_power*1000

# top right
data$Voltage <- as.numeric(paste(data$Voltage))

# bottom left
data$Sub_metering_1 <- as.numeric(paste(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(paste(data$Sub_metering_2))

# bottom right
data$Global_reactive_power <- as.numeric(paste(data$Global_reactive_power))
data$Global_reactive_power <- data$Global_reactive_power/1000
data$Global_reactive_power <- data$Global_reactive_power*1000
# /data preparation

# plot
png(filename="plot4.png")
par(mfrow = c(2,2))

# plot top left
plot(data$DateTime, data$Global_active_power, xlab="",ylab="Global Active Power", type="n")
lines(data$DateTime, data$Global_active_power)

# plot top right
plot(data$DateTime, data$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(data$DateTime, data$Voltage)

# plot bottom left
plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1))

# plot bottom right
plot(data$DateTime, data$Global_reactive_power, xlab="", ylab="Global_reactive_power", type="n")
lines(data$DateTime, data$Global_reactive_power)

dev.off()