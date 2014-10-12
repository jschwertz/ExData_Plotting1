# Load data
source('scripts/ReadData.R')

# Open png device
png(filename='plots/plot2.png')

# Make plot
plot(PowerPlotdata$date.time, PowerPlotdata$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()

