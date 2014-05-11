data = read.table("./data/household_power_consumption.txt", sep=";", header = TRUE) ## loads data --> takes a while
dataSample = data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
dataSample$wDays = strptime(paste(dataSample$Date, dataSample$Time), format='%d/%m/%Y %H:%M:%S')

### PLOT 4 ###
par(mfrow = c(2,2))
plot(dataSample$wDays, as.numeric(as.character(dataSample$Global_active_power)), 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l") ## line chart = l

plot(dataSample$wDays, as.numeric(as.character(dataSample$Voltage)), 
     ylab = "Voltage",
     xlab = "datetime",
     type = "l")

plot(dataSample$wDays, as.numeric(as.character(dataSample$Sub_metering_1)),
     ylab = "Energy sub metering", 
     xlab = "",
     type = "l")
lines(dataSample$wDays, as.numeric(as.character(dataSample$Sub_metering_2)), col = "red")
lines(dataSample$wDays, as.numeric(as.character(dataSample$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red", "blue"),
       lwd = 2,
       cex = 0.5)

plot(dataSample$wDays, as.numeric(as.character(dataSample$Global_reactive_power)), 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")
dev.copy(png, file = "./graphics/plot4.png") ## copy screen plot to PNG
dev.off() ## close the connection

