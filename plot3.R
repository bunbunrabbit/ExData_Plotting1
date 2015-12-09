source(".\\getEnergyData.R")
powerDS <- getEnergyData()

par(mfrow = c(1, 1))

##Plot 3
with (powerDS, {
  plot(datetime, Sub_metering_1, ann=FALSE, type="n")
  lines(datetime, Sub_metering_1, col="black", lty=1)
  lines(datetime, Sub_metering_2, col="red", lty=1)
  lines(datetime, Sub_metering_3, col="blue", lty=1)
  title(ylab="Energy sub metering")
  legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue")
         , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

## Copy my plot to a PNG file
dataFileOut <-  ".\\plot3.png"
dev.copy(png, file=dataFileOut)
dev.off()

