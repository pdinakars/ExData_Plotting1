# Download data from UCI 

#download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",destfile = "power_data")

# Unzip file

#unzip("power_data",exdir=".")

dt<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?")
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
dt$Time<-(sub(".*\\s+", "",strptime(x<-dt$Time,"%H:%M:%S")))
dt$Time = as.POSIXct(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")
my_extr_data<-with(dt, dt[(Date >= "2007-02-01" & Date <= "2007-02-02"),])
png(filename = "plot4.png", width = 480, height = 480,bg="white",res=NA)
par(mfrow=c(2,2))
with(my_extr_data$Time{
  plot(my_extr_data$Time,my_extr_data$Global_active_power,type="l",xlab="Time",ylab="Global Active Power",main="Global Active Power VS Time")
  plot(my_extr_data$Time,my_extr_data$Voltage,type="l",xlab="Time",ylab="Voltage",main="Voltage VS Time")
  plot(my_extr_data$Time,my_extr_data$Sub_metering_1,type="l",col="black",xlab="Time",ylab="Submetering",main="SubMetering VS Time")
  with (my_extr_data,lines(my_extr_data$Time,my_extr_data$Sub_metering_2,type="l",col="red"))
  with (my_extr_data,lines(my_extr_data$Time,my_extr_data$Sub_metering_3,type="l",col="blue"))
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
  plot(my_extr_data$Time,my_extr_data$Global_reactive_power,type="l",xlab="Time",ylab="Global reactive power",main="Global_reactive_power VS Time")
})
dev.off()
