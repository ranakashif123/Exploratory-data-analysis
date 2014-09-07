data_1 <- read.csv("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F, na.strings="?",comment.char="", quote='\"')
head(data_1,n=3)
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")

### Subsetting
data <- subset(data_1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_1) #removing full dataset

### Converting dates

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

### Plot 4

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

plot(data$Datetime,data$Global_active_power,xlab="",ylab="Global Active Power",type="l")	

plot(data$Datetime,data$Voltage,xlab="datetime",ylab="Voltage",type="l")


with(data,{plot(Sub_metering_1~Datetime,xlab="",ylab="Energy sub metering",type="l")
	lines(Sub_metering_2~Datetime,col="red")
	lines(Sub_metering_3~Datetime,col="blue")}
)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)

plot(data$Datetime,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

### Saving to png

dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
