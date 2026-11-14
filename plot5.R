NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')
library(ggplot2)
veh <- as.character(SCC$SCC[grepl('Vehicle', SCC$SCC.Level.Two)])
v <- NEI[NEI$SCC %in% veh & NEI$fips=='24510',]
v5 <- aggregate(Emissions ~ year, v, sum)
png('plot5.png',480,480)
print(ggplot(v5, aes(factor(year), Emissions)) + geom_bar(stat='identity') + labs(x='Year', y='PM2.5 emissions (tons)', title='Baltimore motor vehicle PM2.5'))
dev.off()
