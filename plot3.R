library(ggplot2)

## Read in data
setwd("~/R/Exploratory_Data_Analysis/Week4/Exploratory_Data_Analysis_Week4_Project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bm <- subset(NEI, fips == "24510")
bm <- aggregate(bm$Emissions, by = list(c(year=bm$year), type = bm$type), FUN = sum)

options(scipen = 5)

ggplot(bm, aes(x = Group.1, y = x, color = type, group = type)) + 
  geom_point() + 
  geom_line() + 
  labs(title = expression('Total PM '[2.5]*' Over Time by Source Type in Baltimore City, MD'),
       x = "Year",
       y = expression('Total PM '[2.5]*' concentration (tons)'))

dev.copy(png,'plot3.png')
dev.off()


