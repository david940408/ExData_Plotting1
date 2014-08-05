plot3<-function(){
    #put the unzipped txt file in the working directory
    
    data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
    data[,1]<-as.Date(data[,1],"%d/%m/%Y")
    data<-data[data[,1]>="2007-02-01"&data[,1]<="2007-02-02",]
    data$Sub_metering_1<-as.numeric(as.vector(data$Sub_metering_1))
    data$Sub_metering_2<-as.numeric(as.vector(data$Sub_metering_2))
    data$Sub_metering_3<-as.numeric(as.vector(data$Sub_metering_3))
    date<-NULL
    for(i in seq_len(nrow(data)))
        date<-c(date,paste(data[i,1],data[i,2]))
    date<-strptime(date,"%Y-%m-%d %H:%M:%S")
    
    png("plot3.png",480,480,bg="transparent")
    plot(date,data$Sub_metering_1,type="n",main="",xlab="",
         ylab="Energy sub metering")
    lines(date,data$Sub_metering_1,col="black")
    lines(date,data$Sub_metering_2,col="red")
    lines(date,data$Sub_metering_3,col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lty=c(1,1,1))
    dev.off()
}