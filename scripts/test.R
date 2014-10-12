# Read data into a table with appropriate classes
PowerAll <- read.table('household_power_consumption.txt', header=TRUE,
                       sep=';', na.strings='?',
                       colClasses=c(rep('character', 2), 
                                    rep('numeric', 7)))

# Convert dates and times
PowerAll$Date <- dmy(PowerAll$Date)
PowerAll$Time <- hms(PowerAll$Time)

# Reduce data frame to what we need
start <- ymd('2007-02-01')
end <- ymd('2007-02-02')
PowerAll <- subset(PowerAll, year(Date) == 2007 & 
                     month(Date) == 2 &
                     (day(Date) == 1 | day(Date) == 2))

# Combine date and time
PowerAll$date.time <- PowerAll$Date + PowerAll$Time

# Save file
write.csv(PowerAll, file='power-plotdata.csv',row.names=FALSE)
