library(sqldf)

input <- read.csv.sql(
  "household_power_consumption.txt",
  sep = ";",
  sql="select * from file where Date == '1/2/2007' or Date == '2/2/2007'"
)

png(filename = "plot2.png", width = 480, height = 480)
input$datetime <- as.POSIXct(paste(input$Date, input$Time), format="%e/%m/%Y %H:%M:%S")
plot(x = input$datetime, 
     y = input$Global_active_power, 
     type = "l",
     main = "", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
