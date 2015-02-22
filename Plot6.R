#  Read Data  
2 NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds") 
3 SRC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds") 
4  
5  
6  
7 #  Create Plot Data  
8 VEH <- grep("vehicle",SRC$EI.Sector,value=T,ignore.case=T) 
9 SRC.VEH <- subset(SRC, SRC$EI.Sector %in% VEH, select=SCC) 
10 BC.LA <- subset(NEI, fips == "24510"|fips == "06037") 
11 NEI.VEH <- subset(BC.LA, BC.LA$SCC %in%  SRC.VEH$SCC) 
12 pd <- aggregate(NEI.VEH[c("Emissions")], list(fips = NEI.VEH$fips, year = NEI.VEH$year), sum) 
13 pd$city <- rep(NA, nrow(pd)) 
14 pd[pd$fips == "06037", ][, "city"] <- "Los Angles County" 
15 pd[pd$fips == "24510", ][, "city"] <- "Baltimore City" 
16  
17  
18 #  Create Plot 
19 library(ggplot2) 
20 png('plot6.png', width=480, height=480) 
21 p <- ggplot(pd, aes(x=year, y=Emissions, colour=city)) + 
22     geom_point(alpha=.3) + 
23     geom_smooth(alpha=.2, size=1, method="loess") + 
24     ggtitle("Vehicle Emissions in Baltimore vs. LA") 
25  
26 print(p) 
27  
28  
29 dev.off() 
