download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","pm25.zip")
unzip("pm25.zip")
library(ggplot2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

Nei_OnRoad<-NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD" ,]
Emission_OnRoad_Maryland<-aggregate(Nei_OnRoad$Emissions,list(Nei_OnRoad$type,Nei_OnRoad$year),sum)

names(Emission_OnRoad_Maryland)<-c("Type","Year","Total")

ggplot(Emission_OnRoad_Maryland,aes(x=Year,y=Total))+geom_point(aes(color=Type))+geom_line(aes(color=Type),linetype=2)+ggtitle("Emission for ON-ROAD in Baltimore City from 1999 to 2008")

dev.copy(png,filename="plot5.png")
dev.off()
