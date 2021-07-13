data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Time <- strptime(data$Time, format = "%H:%M:%S")

## Select only the data of interest
data_valid <- data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]

## Save plot to PNG file
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
with(data_valid, {
    # First plot - topleft
    plot(Global_active_power,
         type = "l",
         ylab = "Global Active Power (kilowatts)",
         xlab = "",
         xaxt = "n"
    )
    # Second plot - topright
    plot(Voltage,
         type = "l",
         ylab = "Voltage",
         xlab = "",
         xaxt = "n"
    )
    # Third plot - bottomleft
    plot(Sub_metering_1,
         type = "l",
         ylab = "Energy sub metering",
         xlab = "",
         xaxt = "n",
         col = "black"
    )
    lines(Sub_metering_2, col = "red")
    lines(Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # Fourth plt - bottomright
    plot(Global_reactive_power,
         type = "l",
         ylab = "Global_reacting_power",
         xlab = "",
         xaxt = "n"
    )
})

## Close graphics device
dev.off()