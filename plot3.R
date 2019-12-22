#plot3
library("data.table")
Sys.setlocale("LC_ALL","English") #beacuse i use non_english locale
EPC <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#tidy data
EPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
EPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S", tz = "America/New_York")]
#filter date
EPC <- EPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#png settings
png("plot3.png", width=480, height=480)

#creating plot
plot(EPC[, dateTime], EPC[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(EPC[, dateTime], EPC[, Sub_metering_2],col="red")
lines(EPC[, dateTime], EPC[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
