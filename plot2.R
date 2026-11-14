NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')
library(ggplot2)
b <- NEI[NEI$fips=='24510',]
ba <- tapply(b$Emissions, b$year, sum)
png('plot2.png',480,480)
barplot(ba, xlab='Year', ylab='Total PM2.5 emissions (tons)', main='Total PM2.5 Emissions, Baltimore City')
dev.off()
