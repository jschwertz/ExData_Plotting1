# Load data
source('scripts/ReadData.R')

# Open png device
png(filename='plots/plot1.png')

# Make plot
hist(PowerPlotdata$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off device
dev.off()
