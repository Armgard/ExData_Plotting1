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
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

#plot to file

png("plot2.png", width=480, height=480)

plot(subdata$Global_active_power, 
     ylab="Global Active Power (kilowatts)",type ="n", xlab="",xaxt="n"
     )
lines(subdata$Global_active_power)
axis(side=1,at=c(1,1440,2880),labels=c("Thu", "Fri", "Sat"))


dev.off()
