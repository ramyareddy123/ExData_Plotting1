data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

Date1 <- as.Date("01-02-2007","%d-%m-%Y")
Date2 <- as.Date("02-02-2007","%d-%m-%Y")

main_data <- subset(data,Date >= Date1 & Date <= Date2)
main_data$days <- weekdays(main_data$Date)
possible_days <- factor(main_data[,"days"])
thu <- length(possible_days[possible_days == "Thursday"])
fri <-  length(possible_days[possible_days == "Friday"])

png('plot2.png')
plot(main_data$Global_active_power, type='l', xaxt='n',ylab="Global Active Power (Kilowatts)",xlab="")
axis(1, at=c(1, thu,thu+fri), labels=c("Thu", "Fri","Sat"))
dev.off()
