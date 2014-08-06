plot4<-function(){
    #put the unzipped txt file in the working directory
    
    Sys.setlocale("LC_ALL","english")
    data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
    data[,1]<-as.Date(data[,1],"%d/%m/%Y")
    data<-data[data[,1]>="2007-02-01"&data[,1]<="2007-02-02",]
    data$Sub_metering_1<-as.numeric(as.vector(data$Sub_metering_1))
    data$Sub_metering_2<-as.numeric(as.vector(data$Sub_metering_2))
    data$Sub_metering_3<-as.numeric(as.vector(data$Sub_metering_3))
    data$Global_active_power<-as.numeric(as.vector(data$Global_active_power))
    data$Global_reactive_power<-as.numeric(as.vector(data$Global_reactive_power))
    data$Voltage<-as.numeric(as.vector(data$Voltage))
    date<-strptime(paste(data[,1],data[,2]),"%Y-%m-%d %H:%M:%S")
    
    
    png("plot4.png",480,480,bg="transparent")
    par(mfrow=c(2,2))
    
    plot(date,data$Global_active_power,type="l",main="",xlab="",
         ylab="Global Active Power (kilowatts)")
    
    plot(date,data$Voltage,type="l",main="",xlab="datetime",ylab="Voltage")
    
    plot(date,data$Sub_metering_1,type="n",main="",xlab="",
         ylab="Energy sub metering")
    lines(date,data$Sub_metering_1,col="black")
    lines(date,data$Sub_metering_2,col="red")
    lines(date,data$Sub_metering_3,col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lty=c(1,1,1),bty="n")
    
    plot(date,data$Global_reactive_power,type="l",main="",xlab="datetime",
         ylab="Global_reactive_power")
    dev.off()
}