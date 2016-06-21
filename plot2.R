#Load of entire Data set
testData<-read.table("household_power_consumption.txt",header=TRUE,sep = ";")
#subset of Data set we are interested in
DataToUse<-testData[testData$Date %in%  c("1/2/2007","2/2/2007"),]

#convert "Global_active_power" variable to character, and then to numeric
DataToUse$Global_active_power<-as.character(DataToUse$Global_active_power)
DataToUse$Global_active_power<-as.numeric(DataToUse$Global_active_power)


#Convert variables Date and Time to character 
DataToUse$Date<-as.character(DataToUse$Date)
DataToUse$Time<-as.character(DataToUse$Time)

# create a new variable "DateTime" which is an association of Date and Time
DataToUse$DateTime <- paste(DataToUse$Date, DataToUse$Time)
DataToUse$DateTime<-strptime(DataToUse$DateTime, "%d/%m/%Y %H:%M:%S")

#Construct the plot2 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename='plot2.png', width=480, height=480, units='px')
plot(DataToUse$DateTime,DataToUse$Global_active_power,type="S",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()

