## Check for the working directory:
# getwd()

## Set a new working directory for this assignment:
# setwd('I:/Coursera/Data Science Certificate/Course4_Exploratory Data Analysis/Assignments/Electric Power Consumption')

## Script for the plot2.R (file saved in the working directory)

## To run the code use:
# source("plot2.R")

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

  


## Plot the graph (called "plot2.png")

  active.power <- as.numeric(required.data$Global_active_power)

  png("plot2.png", width = 480, height = 480)

  plot(active.power ~ required.data$new.dates, type = "l", xlab = "", 
       ylab = "Global Active Power (kilowatts)") 

  dev.off()


## Clean the environment

rm(required.data, active.power)


