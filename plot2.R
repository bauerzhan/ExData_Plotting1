## second plot constructions, file pre-downloaded and putted in a working directory

filename <- "household_power_consumption.txt"

## Read file do data frame with separation
FDF <- read.table(filename, header = TRUE, sep = ";")

##Converting the "Date" row to date format
FDF$Date <- as.Date(FDF$Date, format="%d/%m/%Y")

##Subset the data frame 
cleandf <- subset(FDF, Date == "2007-02-01" | Date == "2007-02-02")

##Converting the rows of clean data frame to needed formats
cleandf$Time <- format(cleandf$Time, format="%H:%M:%S")
cleandf$Global_active_power <- as.numeric(as.character(cleandf$Global_active_power))
cleandf$Voltage <- as.numeric(as.character(cleandf$Voltage))
cleandf$Sub_metering_1 <- as.numeric(as.character(cleandf$Sub_metering_1))
cleandf$Sub_metering_2 <- as.numeric(as.character(cleandf$Sub_metering_2))
cleandf$Sub_metering_3 <- as.numeric(as.character(cleandf$Sub_metering_3))



##Creating a column for timestamp 
cleandf$ftime <- as.POSIXct(paste(cleandf$Date, cleandf$Time))

## construction of the graph
png("plot2.png", width = 480, height = 480)
plot(cleandf$ftime,cleandf$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()