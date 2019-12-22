#plot2
library("data.table")
Sys.setlocale("LC_ALL","English") #beacuse i use non_english locale
EPC <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#tidy data
EPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
EPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#filter date
EPC <- EPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#png settings
png("plot2.png", width=480, height=480)
#creating plot
plot(x = EPC[, dateTime], y = EPC[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
