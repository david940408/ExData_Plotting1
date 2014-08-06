plot2<-function(){
    #put the unzipped txt file in the working directory
    
    Sys.setlocale("LC_ALL","english")
    data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
    data[,1]<-as.Date(data[,1],"%d/%m/%Y")
    data<-data[data[,1]>="2007-02-01"&data[,1]<="2007-02-02",]
    data$Global_active_power<-as.numeric(as.vector(data$Global_active_power))
    date<-strptime(paste(data[,1],data[,2]),"%Y-%m-%d %H:%M:%S")
    
    png("plot2.png",480,480,bg="transparent")
    plot(date,data$Global_active_power,type="l",main="",xlab="",
         ylab="Global Active Power (kilowatts)")
    dev.off()
}