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

png("plot3.png")
with(
  power_consumption,
  {
    plot(datetime, Sub_metering_1,
         type = "n", xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_1, col = "black")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  }
)
dev.off()
