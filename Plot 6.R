## Data Extraction 
library(ggplot2)
setwd("C:/Data Science Assignment")
NEI <- readRDS("summarySCC_PM25.rds")
### SCC Dataset not required for plot 1
SCC <- readRDS("Source_Classification_Code.rds")
## Convert to data frame and get Baltimore data 

NEI.df<-data.frame(NEI)
SCC.df<-data.frame(SCC)

## Get CITY data for Baltimore and LA

CITY <- NEI.df[NEI.df$type == 'ON-ROAD' & NEI.df$fips %in% c('24510', '06037'), ]
CITY_YEAR <- aggregate(Emissions ~ year + fips, data = CITY, FUN = sum)

###Adding City Name to data frame
CITY_YEAR$cityname <- ifelse(CITY_YEAR$fips=='06037',"Los Angeles County, California", "Baltimore, Maryland")


png("plot 5.png", width=620, height=620) 

ggplot(data=CITY_YEAR,aes(factor(year),Emissions,fill=cityname))+geom_bar(stat="identity")+facet_grid(.~ cityname) + theme_light()+ xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +  ggtitle('Motor Vehicle Emissions Baltimore City, MD vs Los Angeles, CA')

dev.off()

