if (!dir.exists("./data")) {
  dir.create("./data")
}

download.file(
  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
  destfile = "./data/power-consumption.zip"
)

unzip("./data/power-consumption.zip", exdir = "data")
