# Exploratory Data Analysis Course
# JHU in Coursera
# Date created: 2015-06-06
# R version: 3.1.2 
# Author: mmuller

#_______________________________________________________________________________#
# Examining household energy usage over a two day period in February 2007 ---
#_______________________________________________________________________________#
# Load the data ----
# Code assumes that unzipped data file is located in the working directory
# File downloaded 2015-06-06 from: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#_______________________________________________________________________________#
# Set working directory
# setwd("C:/Users/mmuller/Google Drive/Coursera/exdata")

# Read all data from file
data <- read.table("household_power_consumption.txt", 
                   header = TRUE,
                   sep = ";", 
                   na.strings = "?", 
                   stringsAsFactors = FALSE)

# Subset selecting only two dates
data2 <- data[with(data, Date == "1/2/2007" | Date == "2/2/2007"), ]

# Convert the Date and Time variables to Date/Time classes 
data2$datetime <- as.POSIXlt(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

# Remove "data" from workspace
rm(data)

#_______________________________________________________________________________#
# Plot 4: Four different plots ----
#_______________________________________________________________________________#
# Set "North America" as locality to display weekdays in English
# (necessary only for localities whose default language is not English)
Sys.setlocale("LC_TIME", "C")

# Open graphics device
# to save plot in the current working directory
png(filename = "plot4.png") # 480 x 480 pixels is the default

# Set the graphical parameters
# Fill by columns (2x2 plots)
par(mfcol = c(2,2))

with(data2, {
    # Plot 4.1: line plot of global active power by date/time
    plot(datetime, Global_active_power, type = "n",
         xlab = "",
         ylab = "Global Active Power (kilowats)")
    lines(datetime, Global_active_power)
    
    # Plot 4.2: line plot of energy sub-metering by date/time
    plot(datetime, Sub_metering_1, type = "n",
         xlab = "",
         ylab = "Energy sub metering")
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, #cex = 0.8,
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # Plot 4.3: line plot of voltage by date/time
    plot(datetime, Voltage, type = "n",
         xlab = "datetime",
         ylab = "Voltage")
    lines(datetime, Voltage)
    
    # Plot 4.4: line plot of global reactive power by date/time
    plot(datetime, Global_reactive_power, type = "n",
         xlab = "datetime",
         ylab = "Global_reactive_power")
    lines(datetime, Global_reactive_power)
})

# Close graphics device
dev.off()

#_______________________________________________________________________________#
######
# End of script
#####

