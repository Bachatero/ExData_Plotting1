# please, set your working directory appropriately before running the code
#setwd("/Users/oracle/datasciencecoursera/ExData_Plotting1/ExData_Plotting1")
setwd("~/ExData_Plotting1")

library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

# combine date & time and convert into posix date/time value
datetime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# open png device
png(filename = "plot4.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
# set canvas for 4 plots
par(mfrow=c(2,2))
with(data, {
        # create plots 1 to 4
	plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
	plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage")
	plot(datetime,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
	lines(datetime,Sub_metering_1,col="black")
	lines(datetime,Sub_metering_2,col="red")
	lines(datetime,Sub_metering_3,col="blue")
	legend_colors<-c("black","red","blue")
	legend_text<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
	legend("topright",legend=legend_text, col=legend_colors,pch="-",lty=1)
	plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()

