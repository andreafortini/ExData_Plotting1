## Load dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Time <- strptime(data$Time, format = "%H:%M:%S")

## Select only the data of interest
data_valid <- data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]

## Save plot to PNG file
png("plot3.png", width = 480, height = 480)

with(data_valid,
     plot(Sub_metering_1,
          type = "l",
          ylab = "Energy sub metering",
          xlab = "",
          xaxt = "n",
          col = "black"
     )
)
with(data_valid, lines(Sub_metering_2, col = "red"))
with(data_valid, lines(Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close graphics device
dev.off()