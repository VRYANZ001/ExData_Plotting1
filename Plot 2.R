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

###---Creating a line plot
plot(subset_HHPC$DateTime,as.numeric(as.character(subset_HHPC$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 