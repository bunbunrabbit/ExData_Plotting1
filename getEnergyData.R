getEnergyData <- function() {

  ##Import datafile
  dataFile <- ".\\Data\\household_power_consumption.txt"
  class <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  
  library(data.table)
  powerDS <- na.omit(fread(dataFile, header=TRUE, sep=";", na.strings="?", colClasses=class, data.table = FALSE))

  ##library(sqldf)
  ##sql <- "SELECT * FROM file WHERE Date IN ('2/2/2007', '1/2/2007')"
  ##powerDS <- read.csv.sql(dataFile, header=TRUE, sep=";", sql = sql)
  ##closeAllConnections()
  
  ##powerDS <- read.table(dataFile, header=TRUE, sep=";", na.strings="?", colClasses=class)

  ##Subset data to dates 2007-02-01 and 2007-02-02. 
  powerDS <- powerDS[as.Date(powerDS$Date,"%d/%m/%Y") >= as.Date("2007-02-01") 
                 & as.Date(powerDS$Date,"%d/%m/%Y") <= as.Date("2007-02-02"),]

  ##Add datetime column
  powerDS$datetime <- strptime(paste(powerDS$Date,powerDS$Time),"%d/%m/%Y %H:%M:%S")

  powerDS
  
  
  
}