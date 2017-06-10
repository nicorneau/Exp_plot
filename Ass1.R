###Exploratory : Assignement 1###
###Nicolas Corneau-Tremblay###

#set working directory
setwd("/Users/nicot/Documents/Coursera/data science/Exploratory/Ass1")
getwd()

#reading file
list.files()
donnees <- read.table("./household_power_consumption.txt",
                      header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(donnees) <- tolower(names(donnees))

#keep dates 2007-02-01 and 2007-02-02
df <- donnees[donnees$date=="1/2/2007" | donnees$date=="2/2/2007",]

#set variables
df$datetime <- strptime(paste(df$date, df$time, sep=" "),
                             "%d/%m/%Y %H:%M:%S")
df$global_active_power <- as.numeric(df$global_active_power)

#ploting
#plot 1
png("plot1.png", width = 480, height = 480)
hist(df$global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()

#plot2
png("plot2.png", width=480, height=480)
plot(df$datetime, df$global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

#plot3
png("plot3.png", width=480, height=480)
plot(df$datetime, df$sub_metering_1, type="l", xlab="", col = "black",
     ylab="Energy sub metering", ylim = c(0,40))
par(new = TRUE)
plot(df$datetime, df$sub_metering_2, type="l", xlab="", col = "red",
     ylab="", ylim = c(0,40))
par(new = TRUE)
plot(df$datetime, df$sub_metering_3, type="l", xlab="", col = "blue",
     ylab="", ylim = c(0,40))
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()

#plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(df$datetime, df$global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
plot(df$datetime, df$voltage, type="l", xlab="datetime", col = "black",
     ylab="Voltage")
plot(df$datetime, df$sub_metering_1, type="l", xlab="", col = "black",
     ylab="Energy sub metering", ylim = c(0,40))
par(new = TRUE)
plot(df$datetime, df$sub_metering_2, type="l", xlab="", col = "red",
     ylab="", ylim = c(0,40))
par(new = TRUE)
plot(df$datetime, df$sub_metering_3, type="l", xlab="", col = "blue",
     ylab="", ylim = c(0,40))
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")
plot(df$datetime, df$global_reactive_power, type="l", xlab="datetime", col = "black",
     ylab="Global_reactive_power")
dev.off()







