# please, set your working directory appropriately before running the code
#setwd("/Users/oracle/datasciencecoursera/ExData_Plotting1/ExData_Plotting1")
setwd("~/ExData_Plotting1")

library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

#x <- paste(dates, times)
#strptime(x, "%m/%d/%y %H:%M:%S")

# combine date & time columns into one  and convert it into posix date/time value
datetime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
plot(datetime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(datetime,data$Sub_metering_1,col="black")
lines(datetime,data$Sub_metering_2,col="red")
lines(datetime,data$Sub_metering_3,col="blue")
legend_colors<-c("black","red","blue")
legend_text<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend=legend_text, col=legend_colors,pch="-",lty=1)

dev.off()

