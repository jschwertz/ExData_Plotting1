library(lubridate)

# If the raw data has not been saved, download, unzip, and load it.

if (!file.exists('power-plotdata.csv')) {
  download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                       'exdata%2Fdata%2Fhousehold_power_consumption.zip'),
                method='curl', destfile='HHpower-raw.zip')
  unzip('HHpower-raw.zip')
  
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
  PowerPlotdata <- subset(PowerAll, year(Date) == 2007 & 
                       month(Date) == 2 &
                       (day(Date) == 1 | day(Date) == 2))
  rm(PowerAll)
  
  # Combine date and time
  PowerPlotdata$date.time <- PowerPlotdata$Date + PowerPlotdata$Time
  
  # Save file
  write.csv(PowerPlotdata, file='power-plotdata.csv',row.names=FALSE)
} else {
  PowerPlotdata <- read.csv('power-plotdata.csv')
}

