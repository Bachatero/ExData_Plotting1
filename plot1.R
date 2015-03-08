# plot1
# please, set your working directory appropriately before running the code
#setwd("/Users/oracle/datasciencecoursera/ExData_Plotting1/ExData_Plotting1")
setwd("~/ExData_Plotting1")
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile="./power_consumption.zip", method="curl")
library(sqldf)
#egrep "^[1,2]/2/2007" household_power_consumption.txt
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

#hist(data$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
hist(data$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
