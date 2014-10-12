# Load data
source('scripts/ReadData.R')

# Open png device
png(filename='plots/plot3.png')

# Make plot
plot(PowerPlotdata$date.time, PowerPlotdata$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(PowerPlotdata$date.time, PowerPlotdata$Sub_metering_2, col='red')
lines(PowerPlotdata$date.time, PowerPlotdata$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Turn off device
dev.off()
