1 #####################Plot 4 
2  
3  
4 #  Read Data  
5 NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds") 
6 SRC <- readRDS("./exdata-data-NEI_dataSource_Classification_Code.rds") 
7  
8 #  Create Data 
9 CC <- grep("coal",SRC$EI.Sector,value=T,ignore.case=T) 
10 SRC.CC <- subset(SRC, SRC$EI.Sector %in% CC, select=SCC) 
11 NEI.CC <- subset(NEI, NEI$SCC %in%  SRC.CC$SCC) 
12 pd <- aggregate(NEI.CC[c("Emissions")], list(year = NEI.CC$year), sum) 
13  
14 #  Create Plot 
15 png('plot4.png', width=480, height=480) 
16 p <- ggplot(pd, aes(x=year, y=Emissions)) + 
17      geom_point(alpha=.3) + 
18      geom_smooth(alpha=.2, size=1) + 
19      ggtitle("Total PM2.5 Coal Combustion Emissions in the US") 
20 print(p) 
21  
22  
23 dev.off() 
