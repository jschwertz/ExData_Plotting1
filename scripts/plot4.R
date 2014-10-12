# Load data changed line
source('scripts/ReadData.R')

# Open device
png(filename='plots/plot4.png')

## Make plots
par(mfrow=c(2,2))

# Top left
plot(PowerPlotdata$date, PowerPlotdata$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# Top right
plot(PowerPlotdata$date, PowerPlotdata$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# Bottom left
plot(PowerPlotdata$date, PowerPlotdata$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(PowerPlotdata$date, PowerPlotdata$Sub_metering_2, col='red')
lines(PowerPlotdata$date, PowerPlotdata$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# Bottom right
plot(PowerPlotdata$date, PowerPlotdata$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off device
dev.off()

