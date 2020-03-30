##Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
##Name each of the plot files as plot1.png, plot2.png, etc.
##Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.
##Add the PNG file and R code file to your git repository

## First plot constructions, file pre-downloaded and putted in a working directory

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


## construction of the graph
png("plot1.png", width = 480, height = 480)
hist(cleandf$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "Red")
dev.off()