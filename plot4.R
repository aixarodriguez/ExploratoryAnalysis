download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","pm25.zip")
unzip("pm25.zip")
library(ggplot2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

Scc_Coal<-SCC[grep("Coal",SCC$Short.Name),]
Nei_Coal<-NEI[NEI$SCC %in% Scc_Coal$SCC,]

Emission_Coal<-aggregate(Nei_Coal$Emissions,list(Nei_Coal$year),sum)
names(Emission_Coal)<-c("Year","Total")

plot(Emission_Coal$Year,Emission_Coal$Total,
     type="l",
     col="green",
     xlab="Year",
     ylab="Emission",
     main="Coal combustion-related sources changed from 1999 to 2008")
dev.copy(png,filename="plot4.png")
dev.off()
