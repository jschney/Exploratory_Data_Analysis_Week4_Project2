## Read in data
setwd("~/R/Exploratory_Data_Analysis/Week4/Exploratory_Data_Analysis_Week4_Project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bm <- subset(NEI, fips == "24510")
bm <- aggregate(bm$Emissions, by = list(year=bm$year), FUN = sum)

options(scipen = 5)
plot(bm$year, bm$x, type = c("l"),
     main = expression('Total PM '[2.5]*' Over Time in Baltimore City, MD'),
     xlab = "Year",
     ylab = expression('Total PM '[2.5]*' concentration (tons)'))

dev.copy(png,'plot2.png')
dev.off()


