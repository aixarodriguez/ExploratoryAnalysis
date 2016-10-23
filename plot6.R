download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","pm25.zip")
unzip("pm25.zip")
library(ggplot2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

Maryland<-NEI[NEI$fips=="24510",]
Emission_Maryland<-aggregate(Maryland$Emissions,list(Maryland$year),sum)
Emission_Maryland$City<-"Maryland"
Angeles<-NEI[NEI$fips=="06037",]
Emission_Angeles<-aggregate(Angeles$Emissions,list(Angeles$year),sum)
Emission_Angeles$City<-"Los Angeles"

Emission_Vrs<-rbind(Emission_Maryland,Emission_Angeles)
names(Emission_Vrs)<-c("Year","Total","City")

ggplot(Emission_Vrs,aes(x=Year,y=Total))+geom_point(aes(color=City))+geom_line(aes(color=City),linetype=2)+ggtitle("Emission Maryland vrs Los Angeles from 1999 to 2008")

dev.copy(png,filename="plot6.png")
dev.off()
