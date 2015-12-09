source(".\\getEnergyData.R")
powerDS <- getEnergyData()

##Plot 1
par(mfrow = c(1, 1))

hist(powerDS$Global_active_power
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , col="red")

## Copy my plot to a PNG file
dataFileOut <- ".\\plot1.png"
dev.copy(png, file=dataFileOut)
dev.off()


