library(sqldf)

input <- read.csv.sql(
  "household_power_consumption.txt",
  sep = ";",
  sql="select * from file where Date == '1/2/2007' or Date == '2/2/2007'"
  )

png(filename = "plot1.png", width = 480, height = 480)
hist(input$Global_active_power, col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency"
     )
dev.off()
