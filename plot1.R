setwd("C:/Users/anne/Desktop/DataScienceFiles")

# Read from data and create subset of required parameters
Hpower <- read.table("household_power_consumption.txt",skip=1,sep=";",na.strings = "?")
names(Hpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subHpower <- subset(Hpower,Hpower$Date=="1/2/2007" | Hpower$Date =="2/2/2007")

#plot graph
hist(as.numeric(as.character(subHpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Add title to graph
title(main="Global Active Power")
