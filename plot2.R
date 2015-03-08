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
plot(data2$Time, data2$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")