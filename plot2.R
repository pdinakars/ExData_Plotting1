# Download data from UCI 

#download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",destfile = "power_data")

# Unzip file

#unzip("power_data",exdir=".")

dt<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?")
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
dt$Time<-(sub(".*\\s+", "",strptime(x<-dt$Time,"%H:%M:%S")))
dt$Time = as.POSIXct(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")
my_extr_data<-with(dt, dt[(Date >= "2007-02-01" & Date <= "2007-02-02"),])
png(filename = "plot2.png", width = 480, height = 480,bg="white",res=NA)
plot(my_extr_data$Time,my_extr_data$Global_active_power,type="l",xlab="Time",ylab="Global Active Power (killowatts)",main="Global Active Power VS Time")
dev.off()
