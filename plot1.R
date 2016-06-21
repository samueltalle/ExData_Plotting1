#Load of entire Data set
testData<-read.table("household_power_consumption.txt",header=TRUE,sep = ";")
#subset of Data set we are interested in
DataToUse<-testData[testData$Date %in%  c("1/2/2007","2/2/2007"),]

#convert "Global_active_power" variable to character, and then to numeric
DataToUse$Global_active_power<-as.character(DataToUse$Global_active_power)
DataToUse$Global_active_power<-as.numeric(DataToUse$Global_active_power)

#Construct the plot1 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename='plot1.png', width=480, height=480, units='px')
hist(DataToUse$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
