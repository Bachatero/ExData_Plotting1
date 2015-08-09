# plot2
# please, set your working directory appropriately before running the code and make sure your source file is ready in your working directory or download&unzip it there
setwd("~/ExData_Plotting1")
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile="./power_consumption.zip", method="curl")
# unzip manually
library(sqldf)
#egrep "^[1,2]/2/2007" household_power_consumption.txt
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

#x <- paste(dates, times)
#strptime(x, "%m/%d/%y %H:%M:%S")

#datetime<- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
# combine date & time columns into one  and convert it into posix date/time value
datetime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
#class(datetime)
png(filename = "plot2.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()

