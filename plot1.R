## Read in data

setwd("~/R/Exploratory_Data_Analysis/Week4")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sumPollutant <- aggregate(NEI$Emissions, by = list(year=NEI$year), FUN = sum)

options(scipen = 5)
plot(sumPollutant$year, sumPollutant$x, type = c("line"),
     main = expression('Total PM '[2.5]*' Over Time'),
     xlab = "Year",
     ylab = expression('Total PM '[2.5]*' concentration (tons)'))

png(filename = "Plot1.png")
dev.off()



