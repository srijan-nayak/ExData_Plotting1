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

png("plot2.png")
with(
  power_consumption,
  {
    plot(datetime, Global_active_power,
         type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(datetime, Global_active_power)
  }
)
dev.off()
