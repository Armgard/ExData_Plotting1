# programming assigment 1 of Exploratory Data Analysis
# Read data on household power consumption and reproduce given plots.


library("data.table")

#Read data
data<-fread("exdata-data-household_power_consumption//household_power_consumption.txt", 
            na.strings =c("", "NA","?"))

#Find relevant subdata 
to_use<-(data$Date=="1/2/2007"|data$Date=="2/2/2007")
subdata<-data[to_use]

#Data were read as characters, convert to numerics
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

#plot histogram to png file

png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, ylab="Frequency",
     xlab="Global Active Power (kilowatts)", main="Global Active Power",
     yaxp=c(0,1200,6), col="red")

dev.off()

