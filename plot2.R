data = read.table("./data/household_power_consumption.txt", sep=";", header = TRUE) ## loads data --> takes a while
dataSample = data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
dataSample$wDays = strptime(paste(dataSample$Date, dataSample$Time), format='%d/%m/%Y %H:%M:%S')

### PLOT 2 ###
plot(dataSample$wDays, as.numeric(as.character(dataSample$Global_active_power)), 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     type = "l") ## line chart = l
dev.copy(png, file = "./graphics/plot2.png") ## copy screen plot to PNG
dev.off() ## close the connection
