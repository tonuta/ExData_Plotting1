## Check for the working directory:
# getwd()

## Set a new working directory for this assignment:
# setwd('I:/Coursera/Data Science Certificate/Course4_Exploratory Data Analysis/Assignments/Electric Power Consumption')

## Script for the plot3.R (file saved in the working directory)

## To run the code use:
# source("plot3.R")

## Clean the environment

rm(list = ls())


## Get the entire data from the file

  file.data1 <- "./household_power_consumption.txt"

  full.data <- read.table(file.data1, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", 
                          nrows = 2075259, dec =".")

  full.data$Date <- as.Date(full.data$Date, format="%d/%m/%Y")


## Take the required subset of data

  required.data <- subset(full.data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

  rm(full.data)  # cleaning the environment from unnecessary data


## Convert the dates

  new.dates <- paste(as.Date(required.data$Date), required.data$Time)
  
  required.data$new.dates <- as.POSIXct(new.dates)

  

## Plot the graph (called "plot3.png")

  active.power <- as.numeric(required.data$Global_active_power)
  submetering1 <- as.numeric(required.data$Sub_metering_1)
  submetering2 <- as.numeric(required.data$Sub_metering_2)
  submetering3 <- as.numeric(required.data$Sub_metering_3)
  
  png("plot3.png", width = 480, height = 480)

  with(required.data, {
    
    plot(submetering1~new.dates, type = "l", ylab = "Energy sub metering", xlab="")
    lines(submetering2~new.dates, col = 'Red')
    lines(submetering3~new.dates, col = 'Blue')
    
  })
  
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
  
              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()


## Clean the environment

rm(required.data, active.power)


