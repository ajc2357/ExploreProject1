data = read.table("./data/household_power_consumption.txt", sep=";", header = TRUE) ## loads data --> takes a while
dataSample = data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

### PLOT 1 ###
hist(as.numeric(as.character(dataSample$Global_active_power)), 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red") ## characters
dev.copy(png, file = "./graphics/plot1.png") ## copy screen plot to PNG
dev.off() ## close the connection
