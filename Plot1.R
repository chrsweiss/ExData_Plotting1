setwd("C:\\Users\\user\\Documents\\Coursera Courses\\Exploratory Data Analysis\\Week 1\\Project")

path <- "C:\\Users\\user\\Documents\\Coursera Courses\\Exploratory Data Analysis\\
Week 1\\exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt"

library(dplyr)
library(lubridate)
data <- tbl_df(read.table(path, sep = ";", na.strings = "?", header = TRUE))

daterange <- ymd(c("2007-02-01","2007-02-02"))


data <- data %>% mutate(Date = dmy(Date)) %>% filter(Date %in% daterange)


png(file = "Plot1.png",
    width = 480,
    height = 480)

hist(x = data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()
