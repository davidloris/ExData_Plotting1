#set wd
setwd("~/Documents/r/data exploration/course project 1/ExData_Plotting1")

#install datatable
require(data.table)

#import the data
data <-fread("household_power_consumption.txt")

#filter dates necessary for analysis
data <- data[grepl("^1/2/2007|^2/2/2007",Date),]

#create a time_date column and format
data[,time_and_date:=paste(Time,Date)]
data[,time_and_date:=as.POSIXct(time_and_date,format="%H:%M:%S %d/%m/%Y")]

#change other data to numeric
data[,Global_active_power:=as.numeric(Global_active_power)]
data[,Global_reactive_power:=as.numeric(Global_reactive_power)]
data[,Voltage:=as.numeric(Voltage)]
data[,Global_intensity:=as.numeric(Global_intensity)]
data[,Sub_metering_1:=as.numeric(Sub_metering_1)]
data[,Sub_metering_2:=as.numeric(Sub_metering_2)]
data[,Sub_metering_3:=as.numeric(Sub_metering_3)]

#plot 3
png(filename="plot3.png",width = 480, height = 480)
par(mar=c(4,4,2,2))
plot(data$time_and_date,data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
points(data$time_and_date,data$Sub_metering_2,type="l",col="red")
points(data$time_and_date,data$Sub_metering_3,type="l",col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       pch=NA
)
dev.off()
