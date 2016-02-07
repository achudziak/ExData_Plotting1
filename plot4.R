
#read in the data
columns <- c(rep("character",2),rep("numeric",7))
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", colClasses = columns)

data2 <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

#set localisation to english
Sys.setlocale("LC_TIME", "English")

# adding a day of the week column
data2$day <-strptime(paste(data2$Date, data2$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#plot

png("./ExData_Plotting1/plot4.png")

par(mfrow=c(2,2))

with(data,{
  plot(data2$day,data2$Global_active_power,type = "l",ylab = "Global Active Power", xlab="")
})


with(data,{
  plot(data2$day,data2$Voltage, type = "l",ylab = "Voltage", xlab="datetime")
})


with(data,{
  plot(data2$day,data2$Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab="")
  lines(data2$day,data2$Sub_metering_2,col="red")
  lines(data2$day,data2$Sub_metering_3,col="blue")
  legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
})


with(data,{
  plot(data2$day,data2$Global_reactive_power,type = "h",ylab = "Global_reactive_power", xlab="datetime")
})

dev.off()