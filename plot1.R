## Load dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

## Select only the data of interest
data_valid <- data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]

## Save plot to PNG file
png("plot1.png", width = 480, height = 480)

## Plot histogram for frequency
with(data_valid, hist(Global_active_power,
                        col = "red",
                        main = "Global Active Power",
                        xlab = "Global Active Power (kilowatts)",
                        ylab = "Frequency")
     )

## Close graphics device
dev.off()