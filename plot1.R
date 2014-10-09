#################################
# plot1.R script : create the plot1.png graph
#################################

# 1) load the first 200 days of data of the input file into "raw.data" : starting in December 2006, stopping Jully 2007
raw.data = read.csv("household_power_consumption.txt",na.strings = "?",  nrows=200*60*24, sep = ";")
# 2) extract the 3 days of interest for the study : from 1st Feb to 3td Feb 2007 into "Feb.data"
Feb.data = raw.data[raw.data$Date =="1/2/2007" | raw.data$Date == "2/2/2007",]
# 3) add a DT 'date time' column to Feb.data
Feb.data$DT = strptime (paste (Feb.data$Date,Feb.data$Time),"%d/%m/%Y %H:%M:%S")
# 4) Open the png file device, create the graph as required and close the png device 
png ("plot1.png")
with (Feb.data, {
  hist(Global_active_power,col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
})
dev.off()