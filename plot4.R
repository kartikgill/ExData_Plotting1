setwd("C:/Users/anne/Desktop/DataScienceFiles")

# Read from data and create subset of required parameters
Hpower <- read.table("household_Hpower_consumption.txt",skip=1,sep=";",na.strings = "?")
names(Hpower) <- c("Date","Time","Global_active_Hpower","Global_reactive_Hpower","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subHpower <- subset(Hpower,Hpower$Date=="1/2/2007" | Hpower$Date =="2/2/2007")

# Change Date and Time variables from characters to Date & POSIXlt objects 
subHpower$Date <- as.Date(subHpower$Date, format="%d/%m/%Y")
subHpower$Time <- strptime(subHpower$Time, format="%H:%M:%S")
subHpower[1:1440,"Time"] <- format(subHpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subHpower[1441:2880,"Time"] <- format(subHpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# plotting multiple graphs
par(mfrow=c(2,2))

# create and plot 4 graphs
with(subHpower,{
  plot(subHpower$Time,as.numeric(as.character(subHpower$Global_active_Hpower)),type="l",  xlab="",ylab="Global Active Hpower")  
  plot(subHpower$Time,as.numeric(as.character(subHpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subHpower$Time,subHpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subHpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subHpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subHpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subHpower$Time,as.numeric(as.character(subHpower$Global_reactive_Hpower)),type="l",xlab="datetime",ylab="Global_reactive_Hpower")
})
