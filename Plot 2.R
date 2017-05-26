## Data Extraction 


setwd("C:/Data Science Assignment")

NEI <- readRDS("summarySCC_PM25.rds")

### SCC Dataset not required for plot 1

SCC <- readRDS("Source_Classification_Code.rds")

## Convert to data frame and get Baltimore data 

NEI.df<-data.frame(NEI)
NEI.df.Baltimore <- NEI.df[NEI.df$fips== '24510',]
NEI.df.Baltimore.totalPM <-aggregate(Emissions ~ year,data=NEI.df.Baltimore,FUN=sum)

## Open PNG and Draw plot

png(filename='plot2.png', width=480, height=480, units='px')

barplot(height=NEI.df.Baltimore.totalPM$Emissions, names.arg=NEI.df.Baltimore.totalPM$year,xlab="years", ylab=expression('total PM'[2.5]*' emission'),col = "blue",width = 5,main="Total PM2.5 Emissions in Baltimore MD")

dev.off()