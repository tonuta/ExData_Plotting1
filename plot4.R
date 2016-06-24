## Check for the working directory:
# getwd()

## Set a new working directory for this assignment:
# setwd('I:/Coursera/Data Science Certificate/Course4_Exploratory Data Analysis/Assignments/Electric Power Consumption')

## Script for the plot4.R (file saved in the working directory)

## To run the code use:
# source("plot4.R")

## Clean the environment

rm(list = ls())


## Get the entire data from the file

  file.data1 <- "./household_power_consumption.txt"

  full.data <- read.table(file.data1, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", 
                          nrows = 2075259, dec =".")

  full.data$Date <- as.Date(full.data$Date, format = "%d/%m/%Y")


## Take the required subset of data

  required.data <- subset(full.data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

  rm(full.data)  # cleaning the environment from unnecessary data


## Convert the dates

  new.dates <- paste(as.Date(required.data$Date), required.data$Time)
  
  required.data$new.dates <- as.POSIXct(new.dates)

  

## Plot the graph (called "plot3.png")

  active.power <- as.numeric(required.data$Global_active_power)
  
  reactive.power <- as.numeric(required.data$Global_reactive_power)
  
  new.voltage <- as.numeric(required.data$Voltage)
  
  submetering1 <- as.numeric(required.data$Sub_metering_1)
  submetering2 <- as.numeric(required.data$Sub_metering_2)
  submetering3 <- as.numeric(required.data$Sub_metering_3)
  
  png("plot4.png", width = 480, height = 480)

  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  
  with(required.data, {
    
    plot(active.power~new.dates, type = "l", ylab = "Global Active Power", xlab = "")
    
    plot(new.voltage~new.dates, type = "l", ylab = "Voltage", xlab = "datetime")
    
    plot(submetering1~new.dates, type = "l", ylab = "Energy sub metering", xlab = "")
    
    lines(submetering2~new.dates, col = 'Red')
    
    lines(submetering3~new.dates, col = 'Blue')
    
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(reactive.power~new.dates, type = "l", ylab = "Global Rective Power", xlab = "datetime")
    
  })
  
  
  dev.off()


## Clean the environment

rm(required.data, active.power)


