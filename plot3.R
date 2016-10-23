download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","pm25.zip")
unzip("pm25.zip")
library(ggplot2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

Maryland<-NEI[NEI$fips=="24510",]
Emission_Type_Maryland<-aggregate(Maryland$Emissions,list(Maryland$type,Maryland$year),sum)
names(Emission_Type_Maryland)<-c("Type","Year","Total")
ggplot(Emission_Type_Maryland,aes(x=Year,y=Total))+geom_point(aes(color=Type))+geom_line(aes(color=Type),linetype=2)+ggtitle("Emission for Type Source in Baltimore City from 1999 to 2008")
dev.copy(png,filename="plot3.png")
dev.off()
