NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')
library(ggplot2)
b <- NEI[NEI$fips=='24510',]
bt <- aggregate(Emissions ~ year + type, b, sum)
png('plot3.png',640,480)
print(ggplot(bt, aes(factor(year), Emissions)) + geom_bar(stat='identity') + facet_wrap(~type) + labs(x='Year', y='PM2.5 emissions (tons)', title='Baltimore PM2.5 by source type'))
dev.off()
