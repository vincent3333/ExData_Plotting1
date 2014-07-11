library(datasets)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
filterData <- subset(data, as.Date(Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y")|as.Date(Date,"%d/%m/%Y") == as.Date("02/02/2007","%d/%m/%Y"))
chartData <- data.frame(strptime(paste(filterData$Date,filterData$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),
                        as.double(levels(filterData$Global_active_power))[filterData$Global_active_power])
colnames(chartData) <- c("Time", "power")
par(mar = c(5,5,4,4))
with(chartData, plot(chartData$Time,
                     chartData$power, 
                     type="l", 
                     xlab="",
                     ylab="Global Active Power (kilowatts)"))
dev.copy(png,filename="plot2.png",width=800, height=600);
dev.off()