###----Read in the data----------------
household_power_consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##---Subset for the specific date range we are interesed in--###
subset_HHPC <- subset(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))

## Create datetime variable 
subset_HHPC$Date <- as.Date(subset_HHPC$Date,"%d/%m/%Y")
subset_HHPC$Time <- strptime(subset_HHPC$Time, format="%H:%M:%S")
subset_HHPC[1:1440,"DateTime"] <- format(subset_HHPC[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_HHPC[1441:2880,"DateTime"] <- format(subset_HHPC[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


##Initiate plot for multiple graphs
par(mfrow=c(2,2))


###---Creating a multiple plots

with(subset_HHPC,{
plot(subset_HHPC$DateTime,as.numeric(as.character(subset_HHPC$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
plot(subset_HHPC$DateTime,as.numeric(as.character(subset_HHPC$Voltage)), type="l",xlab="datetime",ylab="Voltage")
plot(subset_HHPC$DateTime,subset_HHPC$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subset_HHPC,lines(DateTime,as.numeric(as.character(Sub_metering_1))))
with(subset_HHPC,lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subset_HHPC,lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
plot(subset_HHPC$DateTime,as.numeric(as.character(subset_HHPC$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})