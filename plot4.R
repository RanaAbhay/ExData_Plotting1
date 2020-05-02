# installing dplyr package
install.packages("dplyr")

# loading dplyr library
library(dplyr)

# installing lubridate package
install.packages("lubridate")

# loading lubridate library
library(lubridate)

# setting working directory
setwd("C:/Users/RanaA/Desktop/Coursera/exdata_data_household_power_consumption")

# checking if "exdata_data_household_power_consumption" file exists, if not creating it in working directory
if (!file.exists("exdata_data_household_power_consumption")){
  dir.create("exdata_data_household_power_consumption")
}

# reading "household_power_consumption.txt" file in R, subsetting the first two days of Feb 2007 directly
houseData <- read.table(file="./household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,skip=66637,nrow=2880,dec=".")

# reading the header of the text file - "household_power_consumption.txt"
Header <- read.table(file="./household_power_consumption.txt",sep=";",nrow=1)

# placing header in the read file as dataframe named - "houseData"
names(houseData) <- Header

# Converting Date coloumn in houseData as Date class variable
houseData$Date <- dmy(houseData$Date)

# Converting Time coloumn in houseData as Date class variable
houseData$Time <- hms(houseData$Time)

# Creating a variable named dateTime in houseData
houseData$dateTime <- houseData$Date + houseData$Time

#Plot 4:- Plotting mutifacet plots, Gobal Active Power, Voltage, Energy sub metering, Global Reactive Power vs dateTime
par(mfrow=c(2,2),mar=c(4,4,2,1))
with(houseData,{
  plot(dateTime,Global_active_power,ylab="Global Active Power",xlab="",type="l")
  plot(dateTime,Voltage,ylab="Voltage",xlab="datetime",type="l")
  plot(dateTime,Sub_metering_1,col="black",type="l",ylab="Energy sub metering",xlab="")
  lines(dateTime,Sub_metering_2,col="red")
  lines(dateTime,Sub_metering_3,col="blue")
  plot(dateTime,Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
})

# Creating the PNG file
dev.copy(png,file="./plot4.png")
dev.off()
