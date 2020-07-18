library(readr)
library(lubridate)
library(dplyr)

power_consumption <- read_delim(
  "./data/household_power_consumption.txt",
  delim = ";",
  na = "?"
) %>% mutate(
  Date = dmy(Date)
) %>% filter(
  between(Date, ymd("2007-02-01"), ymd("2007-02-02"))
) %>% mutate(
  Time = hms(Time),
  datetime = Date + Time
) %>% select(
  datetime, everything()
)

png("plot1.png")
with(power_consumption,
     hist(Global_active_power,
          col = "red",
          main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)"))
dev.off()
