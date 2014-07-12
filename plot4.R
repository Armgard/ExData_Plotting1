# programming assigment 1 of Exploratory Data Analysis
# Read data on household power consumption and reproduce given plots.


library("data.table")

#Read data
data<-fread("exdata-data-household_power_consumption//household_power_consumption.txt"
            , na.strings ="?")

#Find relevant subdata 
to_use<-(data$Date=="1/2/2007"|data$Date=="2/2/2007")
subdata<-data[to_use]

#Data were read as characters, convert to numerics

subdata$Sub_metering_1<-as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2<-as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3<-as.numeric(subdata$Sub_metering_3)
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
subdata$Voltage<-as.numeric(subdata$Voltage)
subdata$Global_reactive_power<-as.numeric(subdata$Global_reactive_power)


png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(subdata$Global_active_power, 
     ylab="Global Active Power (kilowatts)",type ="n", xlab="",xaxt="n"
)
lines(subdata$Global_active_power)
axis(side=1,at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))

plot(subdata$Voltage, 
     ylab="Voltage",type ="n", xlab="",xaxt="n"
)
lines(subdata$Voltage)
axis(side=1,at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))

plot(subdata$Sub_metering_1, 
     ylab="Energy sub metering",type ="n", xlab="",xaxt="n",lty=1
)
lines(subdata$Sub_metering_1)
lines(subdata$Sub_metering_2, col="red")
lines(subdata$Sub_metering_3, col="blue")
axis(side=1,at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))
legend("topright", pch ="-" , col = c("black","blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(subdata$Global_reactive_power, 
     ylab="Global_reactive_power",type ="n", xlab="",xaxt="n"
)
lines(subdata$Global_reactive_power)
axis(side=1,at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))
dev.off()