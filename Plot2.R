#Data set used for this plot
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("F:\\coursera\\expdataanalysis\\gitclone\\ExData_Plotting1")
cp1 <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

cp1a <- cp1[as.Date(cp1$Date,format="%d/%m/%Y")>="2007-02-01"&as.Date(cp1$Date,format="%d/%m/%Y")<="2007-02-02",]
#We will only be using data from the dates 2007-02-01 and 2007-02-02.

png(filename = "Plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

dat <- paste((factor(cp1a$Date)),(factor(cp1a$Time)))
gap <- as.numeric((cp1a$Global_active_power))
xpos <- c(1:length(gap))

plot(0,0,xaxt="n",xlab="",pch="",ylab="Global Active Power (kilowatts)",ylim=c(min(gap),max(gap)),xlim=c(1,max(xpos)))

lines(xpos,gap,col="black")
axis(1, at=c(min(xpos), median(xpos),  max(xpos)),labels=c("Thu", "Fri", "Sat"))

dev.off()



