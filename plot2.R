############## ONLY NEEDS TO BE DONE ONCE ############################################
# setwd("~/Documents/Coursera Course/ExploratoryDataAnalysis/ExData_Plotting1")
## downloads and unzips data into current directory
#fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#temp <- tempfile()
#download.file(fileUrl, temp)
#unzip(temp)
#unlink(temp)
#
#date()
#[1] "TWed May  6 14:48:02 2015" -> date downloaded
######################################################################################

# loading .txt into variable data_all
data_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# converting date columns into appropriate class
data_all$Date <- as.Date(data_all$Date, "%d/%m/%Y") 

# subsetting to data of interest: 2007-02-01 and 2007-02-02
data <- data_all[which(data_all$Date == "2007-02-01" | data_all$Date == "2007-02-02"), ]

# convert remaining relevant columns into appropriate class
data[ ,3:9] <- as.data.frame(sapply(data[ ,3:9], function(x) as.numeric(as.character(x))))

# add a new column with date and time and convert it into appropriate class
data[,"DateTime"] <- paste(data$Date, data$Time)
data[[10]] <- strptime(data[[10]], "%Y-%m-%d %H:%M:%S")


# make plot
quartz()
par(bg="white")
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# saving as png file
dev.copy(png, file = "plot2.png", width=480, height=480) 
dev.off()

