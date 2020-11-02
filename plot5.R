library(ggplot2)

## Read in data
setwd("~/R/Exploratory_Data_Analysis/Week4/Exploratory_Data_Analysis_Week4_Project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bm_car <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
bm_car <- aggregate(bm_car$Emissions, by = list(year=bm_car$year), FUN = sum)

options(scipen = 5)
ggplot(bm_car, aes(x = year, y = x)) + 
  geom_point(pch = 19, size = 3) + 
  geom_line() + 
  labs(title = expression('Total PM '[2.5]*' Concentration From Vehicles Over Time In Baltimore City, MD'),
       x = "Year",
       y = expression('Total PM '[2.5]*' Concentration (tons)'))

dev.copy(png,'plot5.png')
dev.off()


