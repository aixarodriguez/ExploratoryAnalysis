download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","pm25.zip")
unzip("pm25.zip")
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

Maryland<-NEI[NEI$fips=="24510",]
Emission_Maryland<-aggregate(Maryland$Emissions,list(Maryland$year),sum)
names(Emission_Maryland)<-c("Year","Total")
plot(Emission_Maryland$Year,Emission_Maryland$Total,
     type="l",
     col="blue",
     xlab="Year",
     ylab="Emission",
     main="Total PM2.5 emission in Maryland from 1999 to 2008")
dev.copy(png,filename="plot2.png")
dev.off()
