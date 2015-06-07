#Please put the file in your working directory in order to run this code, thanks
#and also load sqldf package


data<-read.csv.sql("household_power_consumption.txt",
                   sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                   header=TRUE,sep=";",stringsAsFactors=FALSE)
data$date_time<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$day<-weekdays(as.Date(data$date_time))
with(data,plot(data$date_time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
lines(data$date_time,data$Sub_metering_1)
lines(data$date_time,data$Sub_metering_2,col="red")
lines(data$date_time,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.copy(png,file="plot3.png",width=480,height=480,units="px")
dev.off()