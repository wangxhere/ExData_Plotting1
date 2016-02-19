library(sqldf)

input <- read.csv.sql(
  "household_power_consumption.txt",
  sep = ";",
  sql="select * from file where Date == '1/2/2007' or Date == '2/2/2007'"
)

png(filename = "plot4.png", width = 480, height = 480)
input$datetime <- as.POSIXct(paste(input$Date, input$Time), format="%e/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(x = input$datetime, 
     y = input$Global_active_power, 
     type = "l",
     main = "", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

plot(x = input$datetime, 
     y = input$Voltage, 
     type = "l",
     main = "", 
     xlab = "datetime", 
     ylab = "Voltage")

plot(x = input$datetime,
     y = input$Sub_metering_1,
     col = "black",
     type = "l",
     main = "", 
     xlab = "", 
     ylab = "Energy sub metering")
par(new = TRUE)

plot(x = input$datetime,
     y = input$Sub_metering_2,
     col = "red",
     type = "l",
     main = "", 
     xlab = "", 
     ylab = "Energy sub metering")
par(new = TRUE)

plot(x = input$datetime,
     y = input$Sub_metering_3,
     col = "blue",
     type = "l",
     main = "", 
     xlab = "", 
     ylab = "Energy sub metering")
par(new = TRUE)

legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"),
       pch = "____",
       col = c(1, 2, 3))

par(new = FALSE)

plot(x = input$datetime, 
     y = input$Global_reactive_power, 
     type = "l",
     main = "", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
