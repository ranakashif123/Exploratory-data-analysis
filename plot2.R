### Getting dataset

data_1 <- read.csv("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F, na.strings="?",comment.char="", quote='\"')
head(data_1,n=3)
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")

### Subsetting
data <- subset(data_1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_1) #removing full dataset

### Converting dates

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

###plot2
plot(data$Datetime,data$Global_active_power,xlab="",
ylab="Global Active Power (kilowatts)",type="l")

### Saving to png
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
