source(".\\getEnergyData.R")
powerDS <- getEnergyData()

##Plot 4
par(mfrow = c(2, 2))

with (powerDS, { 
  
  ##Plot1 - Global active power
  plot(datetime, Global_active_power
          , type="l"
          , ann=FALSE)
  title(ylab="Global Active Power (kilowatts)")

  ##Plot2 - Voltage
  plot(datetime, Voltage
          , type="l"
          , ann=FALSE)
  title(ylab="Voltage", xlab="datetime")

  ##Plot3 - Energy sub metering
  plot(datetime, Sub_metering_1, ann=FALSE, type="n")
  lines(datetime, Sub_metering_1, col="black", lty=1)
  lines(datetime, Sub_metering_2, col="red", lty=1)
  lines(datetime, Sub_metering_3, col="blue", lty=1)
  title(ylab="Energy sub metering")
  legend("topright", lty=1, bty="n"
         , col = c("black", "red", "blue")
         , cex = .8
         , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  ##Plot4 - Global reactive power
  plot(datetime, Global_reactive_power, type="l", yaxt="n")
  axis(2, las=1)
})

## Copy my plot to a PNG file
dataFileOut <-  ".\\plot4.png"
dev.copy(png, file=dataFileOut)
dev.off()

