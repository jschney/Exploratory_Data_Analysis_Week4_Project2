library(ggplot2)

## Read in data
setwd("~/R/Exploratory_Data_Analysis/Week4/Exploratory_Data_Analysis_Week4_Project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

all_car <- subset(NEI, NEI$fips == "24510" | NEI$fips == "06037")
all_car <- subset(all_car, all_car$type == "ON-ROAD")
all_car <- aggregate(all_car$Emissions, by = list(all_car$fips, all_car$year), FUN = sum)
colnames(all_car) <- (c("FIPS", "Year", "Emissions"))

options(scipen = 5)
ggplot(all_car, aes(x = Year, y = Emissions, color = FIPS, group = FIPS)) +
  geom_point(size = 3) +
  geom_line() + 
  labs(title = expression('Total PM '[2.5]*' Concentration From Vehicles Over Time'),
       subtitle = expression('Baltimore City, MD (24510) vs Los Angeles County, CA (06037)'),
       x = "Year",
       y = expression('Total PM '[2.5]*' Concentration (tons)'))

dev.copy(png,'plot6.png')
dev.off()


