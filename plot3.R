#Load of entire Data set
testData<-read.table("household_power_consumption.txt",header=TRUE,sep = ";")
#subset of Data set we are interested in
DataToUse<-testData[testData$Date %in%  c("1/2/2007","2/2/2007"),]

#convert variables "Sub_metering_1", Sub_metering_2, Sub_metering_3 to character, and then to numeric
DataToUse$Sub_metering_1 <-as.character(DataToUse$Sub_metering_1 )
DataToUse$Sub_metering_1 <-as.numeric(DataToUse$Sub_metering_1 )
DataToUse$Sub_metering_2 <-as.character(DataToUse$Sub_metering_2 )
DataToUse$Sub_metering_2 <-as.numeric(DataToUse$Sub_metering_2 )
DataToUse$Sub_metering_3 <-as.character(DataToUse$Sub_metering_3 )
DataToUse$Sub_metering_3 <-as.numeric(DataToUse$Sub_metering_3 )

#Convert variables Date and Time to character 
DataToUse$Date<-as.character(DataToUse$Date)
DataToUse$Time<-as.character(DataToUse$Time)

# create a new variable "DateTime" which is an association of Date and Time
DataToUse$DateTime <- paste(DataToUse$Date, DataToUse$Time)
DataToUse$DateTime<-strptime(DataToUse$DateTime, "%d/%m/%Y %H:%M:%S")


#Construct the plot3 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename='plot3.png', width=480, height=480, units='px')
with(DataToUse, plot(DateTime,Sub_metering_1,xlab="",ylab = "Energy sub metering", type="n"))
with(subset(DataToUse), points(DateTime,Sub_metering_1,type="S"))
with(subset(DataToUse), points(DateTime,Sub_metering_2,type="S",col="red"))
with(subset(DataToUse), points(DateTime,Sub_metering_3,type="S",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd = c(2,2),col=c("black","red","blue"))

dev.off()

