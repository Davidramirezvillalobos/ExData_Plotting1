## Plotting script
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Identify raw data web location
## WARNING: If you have ran other plotx.R script of this project
## you probably already have in your working directory all the data 
## necessary to plot oher graphics. Please make sure before downoad
## again the whole data set, just run script from line 18.
download.file(url,"data.zip")
## Download data to active working directory
unzip("data.zip")
## Unziping data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), nrows =  69517)
## Reading in R a part of main table. The one we want to use
data1 <- data[66637:69517,]
## Subsetting the exact rows we want to use to plot
data1$full_date <- strptime(paste(data1$Date, data1$Time), format='%d/%m/%Y %H:%M')
## Preparing data to plot: Setting appropiate format to dates and times
with(data1, plot(full_date, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()