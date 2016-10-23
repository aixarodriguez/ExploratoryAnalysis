download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","pm25.zip")
unzip("pm25.zip")
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

Emission<-aggregate(NEI$Emissions,list(NEI$year),sum)
names(Emission)<-c("Year","Total")
plot(Emission$Year,Emission$Total,
     type="l",
     col="red",
     xlab="Year",
     ylab="Emission",
     main="Total PM2.5 emission in United States from 1999 to 2008")
dev.copy(png,filename="plot1.png")
dev.off()
