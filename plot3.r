#plot3.R
#Justus Moeller

# reading and preparing data
data <- read.csv("household_power_consumption.txt", sep=";")
dates <- c("1/2/2007", "2/2/2007")

data <- subset(data, data$Date %in% dates)
# this is the same code for all 4 source files

# obtain the data relevant for plot #3
# and plot

data$DateTime <- paste(data$Date, data$Time, sep="/")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y/%H:%M:%S")

data$Sub_metering_1 <- as.numeric(paste(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(paste(data$Sub_metering_2))

png(filename="plot3.png")
plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1))

dev.off()