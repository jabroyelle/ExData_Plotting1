#################################
# plot3.R script : create the plot3.png graph
#################################

# 1) load the first 200 days of data of the input file into "raw.data" : starting in December 2006, stopping Jully 2007

raw.data = read.csv("household_power_consumption.txt",na.strings = "?",  nrows=200*60*24, sep = ";")
# 2) extract the 3 days of interest for the study : from 1st Feb to 3td Feb 2007 into "Feb.data"
Feb.data = raw.data[raw.data$Date =="1/2/2007" | raw.data$Date == "2/2/2007",]
# 3) add a DT 'date time' column to Feb.data
Feb.data$datetime = strptime (paste (Feb.data$Date,Feb.data$Time),"%d/%m/%Y %H:%M:%S")
# 4) Open the png file device, create the 4 graphs as required and close the png device 
png ("plot4.png")
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
with (Feb.data, {
  plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(datetime, Voltage, type="l", ylab="Voltage")
  plot(datetime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")  
  legend("topright", bty="n",  pch=NA, lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(datetime, Global_reactive_power, type="l" )
})
dev.off()