# Load data changed line
source('scripts/ReadData.R')

# Open png device
png(filename='plots/plot2.png')

# Make plot
plot(PowerPlotdata$date, PowerPlotdata$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()

