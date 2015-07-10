#plot1.R
#Justus Moeller

# reading and preparing data
data <- read.csv("household_power_consumption.txt", sep=";")
dates <- c("1/2/2007", "2/2/2007")

data <- subset(data, data$Date %in% dates)
# this is the same code for all 4 source files

# obtain the data relevant for plot #1
# and plot

x <- as.numeric(paste(data$Global_active_power))

png(filename="plot1.png")
par(mar=c(4,4,2,2))
hist(x, xlab="Global Active Power (kilowatts)", main=paste("Global Active Power"), col="red")
dev.off()