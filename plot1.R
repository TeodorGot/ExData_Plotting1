#plot1
library(data.table)
EPC <- data.table::fread(input = "household_power_consumption.txt",na.strings="?")
#tidy data
EPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = "Global_active_power"]
EPC[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
#filter date
EPC <- EPC[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
#png settings
png("plot1.png", width=480, height=480)
#creating plot
hist(EPC[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
