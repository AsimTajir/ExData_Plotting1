# Download and extract the zip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
unzip("household_power_consumption.zip")
# Convert the text file into Data Table
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Dates from string to Date type
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Filter the data between 2007-02-01 and 2007-02-02 
data<-data[(data$DateTime >= "2007-02-01") & (data$DateTime <  "2007-02-03"),]

# Create the png file of the plot
png("plot2.png")
plot(x=data$DateTime, y=data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()