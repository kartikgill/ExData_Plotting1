setwd("C:/Users/anne/Desktop/DataScienceFiles")

# Read from data and create subset of required parameters
Hpower <- read.table("household_power_consumption.txt",skip=1,sep=";",na.strings = "?")
names(Hpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subHpower <- subset(Hpower,Hpower$Date=="1/2/2007" | Hpower$Date =="2/2/2007")

# Change Date and Time variables from characters to Date & POSIXlt objects
subHpower$Date <- as.Date(subHpower$Date, format="%d/%m/%Y")
subHpower$Time <- strptime(subHpower$Time, format="%H:%M:%S")
subHpower[1:1440,"Time"] <- format(subHpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subHpower[1441:2880,"Time"] <- format(subHpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#plot graph
plot(subHpower$Time,subHpower$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
with(subHpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subHpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subHpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

    