###----Read in the data----------------
household_power_consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##---Subset for the specific date range we are interesed in--###
subset_HHPC <- subset(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))

###---Creating a basic box plot

hist(as.numeric(as.character(subset_HHPC$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)", ylab="Frequency")