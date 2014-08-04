plot1<-function(){
    data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
    data[,1]<-as.Date(data[,1],"%d/%m/%Y")
    data<-data[data[,1]>="2007-02-01"&data[,1]<="2007-02-02",]
    data$Global_active_power<-as.numeric(as.vector(data$Global_active_power))
    
    par(mfrow=c(1,1))
    png("plot1.png",480,480,bg="transparent")
    hist(data$Global_active_power,col="red",main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    dev.off()
}