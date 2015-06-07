#Please put the file in your working directory in order to run this code, thanks
#and also load sqldf package

data<-read.csv.sql("household_power_consumption.txt",
                  sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                  header=TRUE,sep=";",stringsAsFactors=FALSE)
with(data,hist(data$Global_active_power,
               xlab="Global Active Power",main="Global Active Power",col="red"))
dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()


