## Load dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Time <- strptime(data$Time, format = "%H:%M:%S")

## Select only the data of interest
data_valid <- data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]
data_valid <- data_valid[which(!is.na(data_valid$Global_active_power)), ]

## Save plot to PNG file
png("plot2.png", width = 480, height = 480)

with(data_valid,
     plot(Global_active_power,
          type = "l",
          ylab = "Global Active Power (kilowatts)",
          xlab = "",
          xaxt = "n"
     )
)

## Close graphics device
dev.off()