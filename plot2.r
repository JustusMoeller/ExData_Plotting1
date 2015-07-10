#plot2.R
#Justus Moeller

# reading and preparing data
data <- read.csv("household_power_consumption.txt", sep=";")
dates <- c("1/2/2007", "2/2/2007")

data <- subset(data, data$Date %in% dates)
# this is the same code for all 4 source files

# obtain the data relevant for plot #2
# and plot

data$DateTime <- paste(data$Date, data$Time, sep="/")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y/%H:%M:%S")

data$Global_active_power <- as.numeric(paste(data$Global_active_power))
data$Global_active_power <- data$Global_active_power/1000
data$Global_active_power <- data$Global_active_power*1000

png(filename="plot2.png")
plot(data$DateTime, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

dev.off()