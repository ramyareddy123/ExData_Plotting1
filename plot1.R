data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

Date1 <- as.Date("01-02-2007","%d-%m-%Y")
Date2 <- as.Date("02-02-2007","%d-%m-%Y")

main_data <- subset(data,Date >= Date1 & Date <= Date2)
new_data <- main_data[!is.na(main_data$Global_active_power),]
png('plot1.png')
hist(new_data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off()	
