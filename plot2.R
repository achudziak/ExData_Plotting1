

columns <- c(rep("character",2),rep("numeric",7))
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", colClasses = columns)

data2 <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")


# no of the 1st observation on friday
Fri <- which(data2$Date=="2/2/2007"&data2$Time=="00:00:00")


#plot

png("plot2.png")

plot(data2$Global_active_power,type = "l",ylab = "Energy sub metering", xlab="",xaxt="n")
axis(1,at=c(1,Fri,2880), labels = c("Thu","Fri","Sat"))

dev.off()

