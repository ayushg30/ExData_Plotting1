#Please put the file in your working directory in order to run this code, thanks
#and also load sqldf package


data<-read.csv.sql("household_power_consumption.txt",
                   sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                   header=TRUE,sep=";",stringsAsFactors=FALSE)
data$date_time<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$day<-weekdays(as.Date(data$date_time))
par(mfrow=c(2,2))

#1st Plot
plot(data$date_time,data$Global_active_power,type="n",xlab="",ylab="Global Active Power(Kilowatts)",cex.lab=0.7)
lines(data$date_time,data$Global_active_power)

#2nd Plot
plot(data$date_time,data$Voltage,type="n",xlab="datetime",ylab="Voltage",cex.lab=0.7)
lines(data$date_time,data$Voltage)

#3rd Plot
plot(data$date_time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",cex.lab=0.7)
lines(data$date_time,data$Sub_metering_1,col="black")
lines(data$date_time,data$Sub_metering_2,col="red")
lines(data$date_time,data$Sub_metering_3,col="blue")
# Could not add legend at appropriate position
# legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=0.7)

#4th Plot
plot(data$date_time,data$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power",cex.lab=0.7)
lines(data$date_time,data$Global_reactive_power)

dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off()