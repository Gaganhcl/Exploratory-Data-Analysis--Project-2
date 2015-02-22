#  Read Data  
2 NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds") 
3 SRC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds") 
4  
5  
6  
7 #  Create Data 
8 VEH <- grep("vehicle",SRC$EI.Sector,value=T,ignore.case=T) 
9 SRC.VEH <- subset(SRC, SRC$EI.Sector %in% VEH, select=SCC) 
10 BC <- subset(NEI, fips == "24510") 
11 NEI.VEH <- subset(BC, BC$SCC %in%  SRC.VEH$SCC) 
12 pd <- aggregate(NEI.VEH[c("Emissions")], list(year = NEI.VEH$year), sum) 
13  
14  
15 #  Create Plot 
16 library(ggplot2) 
17 png('plot5.png', width=480, height=480) 
18 plot(pd$year, pd$Emissions, type = "l",  
19      main = "Total Vehicle Emissions in Baltimore City", 
20      xlab = "Year", ylab = "Emissions") 
21  
22  
23 dev.off() 
