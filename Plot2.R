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


png(file = "Plot2.png",
    width = 480,
    height = 480)

plot(Global_active_power~datetime,
     data = na.omit(electricaldata),
     main = '',
     xlab = '',
     ylab = "Global Active Power (kilowatts)",
     type = "l")

dev.off()
