source(".\\getEnergyData.R")
powerDS <- getEnergyData()

par(mfrow = c(1, 1))

##Plot 2
with(powerDS, 
  plot(datetime, Global_active_power
  , type="l"
  , ann=FALSE))
title(ylab="Global Active Power (kilowatts)")

## Copy my plot to a PNG file
dataFileOut <-  ".\\plot2.png"
dev.copy(png, file=dataFileOut)
dev.off()

