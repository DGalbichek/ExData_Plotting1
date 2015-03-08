data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings="?", stringsAsFactors=FALSE,
                   colClasses=c("character", "character","numeric","numeric",
                                "numeric","numeric","numeric","numeric","numeric"))


library(dplyr)
data2 <- filter(data, Date=="1/2/2007"| Date=="2/2/2007")

data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
data2$Time <- strptime(data2$Time, format="%H:%M:%S")

hist(data2$Global_active_power, col = "red", breaks = 24,
     main="Global Active Power", xlab="Global Active Power (kilowatts)")