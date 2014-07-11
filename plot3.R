library(datasets)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
filterData <- subset(data, as.Date(Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y")|as.Date(Date,"%d/%m/%Y") == as.Date("02/02/2007","%d/%m/%Y"))
chartData <- data.frame(strptime(paste(filterData$Date,filterData$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),
                        as.double(levels(filterData$Sub_metering_1))[filterData$Sub_metering_1],
                        as.double(levels(filterData$Sub_metering_2))[filterData$Sub_metering_2],
                        filterData$Sub_metering_3)
colnames(chartData) <- c("Time", "Sub_metering_1","Sub_metering_2","Sub_metering_3")
par(mar = c(5,5,4,4))
with(chartData, plot(chartData$Time,
                     chartData$Sub_metering_1,
                     type="l", 
                     xlab="",
                     ylab="Energy sub metering",
                     col="green"))
lines(chartData$Time,
      chartData$Sub_metering_2,
      col="red")
lines(chartData$Time,
      chartData$Sub_metering_3,
      col="blue")
legend("topright",pch="-",cex=0.8,lwd=2,
       col=c("green","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,filename="plot3.png", width=1000, height=600);
dev.off()