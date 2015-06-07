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
# # Plot 1: histogram of global active power ----
#_______________________________________________________________________________#
# Open graphics device
# to save plot in the current working directory
png(filename = "plot1.png") # 480 x 480 pixels is the default

# Create histogram
hist(data2$Global_active_power,
     main = "Global Active Power",
     xlab = "Gobal Active Power (kilowats)",
     col = "red")

# Close graphics device
dev.off()

#_______________________________________________________________________________#
######
# End of script
#####

