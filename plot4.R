library(ggplot2)

## Read in data
setwd("~/R/Exploratory_Data_Analysis/Week4/Exploratory_Data_Analysis_Week4_Project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_code <- SCC[grepl("Coal", SCC$Short.Name), ]
coal_emissions <- NEI[NEI$SCC %in% coal_code$SCC, ]

us_coal <- aggregate(coal_emissions$Emissions, by = list(year=coal_emissions$year), FUN = sum)

options(scipen = 5)
ggplot(us_coal, aes(x = year, y = x)) + 
  geom_point(pch = 19, size = 3) + 
  geom_line() + 
  labs(title = expression('Total PM '[2.5]*' Concentration Over Time From Coal Combustion'),
       x = "Year",
       y = expression('Total PM '[2.5]*' Concentration (tons)'))

dev.copy(png,'plot4.png')
dev.off()


