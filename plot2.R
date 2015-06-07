#Please put the file in your working directory in order to run this code, thanks
#and also load sqldf package
data<-read.csv.sql("household_power_consumption.txt",
                   sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                   header=TRUE,sep=";",stringsAsFactors=FALSE)
data$date_time<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$day<-weekdays(as.Date(data$date_time))
with(data,plot(data$date_time,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (Kilowatts)"))
lines(data$date_time,data$Global_active_power)
dev.copy(png,file="plot2.png",width=480,height=480,units="px")
dev.off()
     
