#Data set used for this plot
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("F:\\coursera\\expdataanalysis\\gitclone\\ExData_Plotting1")
cp1 <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

cp1a <- cp1[as.Date(cp1$Date,format="%d/%m/%Y")>="2007-02-01"&as.Date(cp1$Date,format="%d/%m/%Y")<="2007-02-02",]
#We will only be using data from the dates 2007-02-01 and 2007-02-02.

png(filename = "Plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

dat <- paste((factor(cp1a$Date)),(factor(cp1a$Time)))
sm1 <- as.numeric((cp1a$Sub_metering_1))
sm2 <- as.numeric((cp1a$Sub_metering_2))
sm3 <- as.numeric((cp1a$Sub_metering_3))
xpos <- c(1:length(sm1))

plot(0,0,xaxt="n",xlab="",pch="",ylab="Energy Sub metering",ylim=c(min(sm1,sm2,sm3),max(sm1,sm2,sm3)),xlim=c(1,max(xpos)))

lines(xpos,sm1,col="black")
lines(xpos,sm2,col="red")
lines(xpos,sm3,col="blue")
axis(1, at=c(min(xpos), median(xpos),  max(xpos)),labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()



