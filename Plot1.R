#Data set used for this plot
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("F:\\coursera\\expdataanalysis\\gitclone\\ExData_Plotting1")
cp1 <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
head(cp1)

cp1a <- cp1[as.Date(cp1$Date,format="%d/%m/%Y")>="2007-02-01"&as.Date(cp1$Date,format="%d/%m/%Y")<="2007-02-02",]
#We will only be using data from the dates 2007-02-01 and 2007-02-02.

png(filename = "Plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
hist(cp1a$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()
