## Coursera - Exploratory Data Analysis - Project 1 ##

# Our overall goal here is simply to examine how household energy usage
# varies over a 2-day period in February, 2007. 

##### PLOT 1 #######

# setting working directory
setwd("F:/Box Sync/Coursera/Exploratory_Data_Analysis")

# Reading data file
orig <- read.table("F:/Box Sync/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt", header = T, sep = ";",
                  na.strings="?", stringsAsFactors=FALSE)
str(dat)

# I only want data between 2007-02-01 and 2007-02-02
dat=subset(orig, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")

# Converting Date and Time variables
# dat$Time=strptime(dat$Time,"%H:%M:%S")
# dat$Date=as.Date(dat$Date,format="%d/%m/%Y")

# creating plot
png("plot1.png", width=480, height=480, units="px")
hist(dat$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
