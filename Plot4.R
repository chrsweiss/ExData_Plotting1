setwd("C:\\Users\\user\\Documents\\Coursera Courses\\Exploratory Data Analysis\\Week 1\\Project")

path <- "exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt"

library(dplyr)
library(lubridate)

electricaldata <- tbl_df(read.table(path, sep = ";", na.strings = "?", header = TRUE))

daterange <- ymd(c("2007-02-01","2007-02-02"))


electricaldata <- electricaldata %>% 
  mutate(Date = dmy(Date)) %>% 
  filter(Date %in% daterange) %>%
  mutate(day = format(Date, "%a")) %>%
  mutate(datetime = ymd_hms(paste(Date, Time)))


png(file = "Plot4.png",
    width = 480,
    height = 480)

par(mfrow = c(2,2))

plot(Global_active_power~datetime,
        data = na.omit(electricaldata),
        main = '',
        xlab = '',
        ylab = "Global Active Power",
        type = "l")

plot(Voltage~datetime,
     data = na.omit(electricaldata),
     main = '',
     xlab = 'datetime',
     ylab = "Voltage",
     type = "l")

plot(Sub_metering_1~datetime,
     data = na.omit(electricaldata),
     main = '',
     xlab = '',
     ylab = "Energy sub metering",
     type = "l")

points(Sub_metering_2~datetime,
       data = na.omit(electricaldata),
       col = "red",
       type = "l")

points(Sub_metering_3~datetime,
       data = na.omit(electricaldata),
       col = "blue",
       type = "l")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       pch = "____",
       bty = "n")

plot(Global_reactive_power~datetime,
     data = na.omit(electricaldata),
     main = '',
     xlab = 'datetime',
     ylab = "Global_reactive_power",
     type = "l")

dev.off()
