library(datasets)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
filterData <- subset(data, as.Date(Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y")|as.Date(Date,"%d/%m/%Y") == as.Date("02/02/2007","%d/%m/%Y"))
chartData <- as.double(levels(filterData$Global_active_power))[filterData$Global_active_power]
par(mar = c(5,5,4,4))
hist(chartData,main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.copy(png,filename="plot1.png");
dev.off()