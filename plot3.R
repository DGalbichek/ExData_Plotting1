## reads data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings="?", stringsAsFactors=FALSE,
                   colClasses=c("character", "character","numeric","numeric",
                                "numeric","numeric","numeric","numeric","numeric"))


## filtering for the two needed days
library(dplyr)
data2 <- filter(data, Date=="1/2/2007"| Date=="2/2/2007")

##date+time column creation
data2$dt=paste(data2$Date, data2$Time , sep="-")
data2$dt <- as.POSIXct(data2$dt, format="%d/%m/%Y-%H:%M:%S")

##plot
plot(data2$dt, data2$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")
lines(data2$dt, data2$Sub_metering_2, col="red")
lines(data2$dt, data2$Sub_metering_3, col="blue")
legend("topright", col = c("black","red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1)