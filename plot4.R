

# no of the 1st observation on friday
Fri <- which(data2$Date=="2/2/2007"&data2$Time=="00:00:00")


#plot

png("plot4.png")

par(mfrow=c(2,2))

with(data,{
  plot(data2$Global_active_power,type = "l",ylab = "Global Active Power", xlab="",xaxt="n")
  axis(1,at=c(1,Fri,2880), labels = c("Thu","Fri","Sat"))
})


with(data,{
  plot(data2$Voltage, type = "l",ylab = "Voltage", xlab="datetime",xaxt="n")
  axis(1,at=c(1,Fri,2880), labels = c("Thu","Fri","Sat"))
})


with(data,{
  plot(data2$Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab="",xaxt="n")
  lines(data2$Sub_metering_2,col="red")
  lines(data2$Sub_metering_3,col="blue")
  axis(1,at=c(1,Fri,2880), labels = c("Thu","Fri","Sat"))
  legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
})


with(data,{
  plot(data2$Global_reactive_power,type = "h",ylab = "Global_reactive_power", xlab="datetime",xaxt="n")
  axis(1,at=c(1,Fri,2880), labels = c("Thu","Fri","Sat"))
})

dev.off()