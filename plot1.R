
#read in the data
columns <- c(rep("character",2),rep("numeric",7))
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", colClasses = columns)

#subset it
data2 <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")


png("./ExData_Plotting1/plot1.png")
hist(data2$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

