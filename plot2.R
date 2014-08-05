plot2<-function(){
    #put the unzipped txt file in the working directory
    
    data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
    data[,1]<-as.Date(data[,1],"%d/%m/%Y")
    data<-data[data[,1]>="2007-02-01"&data[,1]<="2007-02-02",]
    data$Global_active_power<-as.numeric(as.vector(data$Global_active_power))
    date<-NULL
    for(i in seq_len(nrow(data)))
        date<-c(date,paste(data[i,1],data[i,2]))
    date<-strptime(date,"%Y-%m-%d %H:%M:%S")
    
    png("plot2.png",480,480,bg="transparent")
    plot(date,data$Global_active_power,type="l",main="",xlab="",
         ylab="Global Active Power (kilowatts)")
    dev.off()
}