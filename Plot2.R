1 ########################### Plot 2 Project  
2 #  Read Data  
3 NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds") 
4  
5 #  Create Data 
6 BC <- subset(NEI, fips == "24510") 
7 pd <- aggregate(BC[c("Emissions")], list(year = BC$year), sum) 
8  
9 #  Create Plot 
10 png('plot2.png', width=480, height=480) 
11 plot(pd$year, pd$Emissions, type = "l",  
12      main = "Total Emissions from PM2.5 in Baltimore City", 
13      xlab = "Year", ylab = "Emissions") 
14 dev.off() 
