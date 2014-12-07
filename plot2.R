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

#plot 2
png(filename="plot2.png",width = 480, height = 480)
par(mar=c(4,4,2,2))
plot(data$time_and_date,data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
