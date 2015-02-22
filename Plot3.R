1 #####################Plot 3 
2 #  Read Data  
3 NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds") 
4  
5 #  Create Data  
6 BC <- subset(NEI, fips == "24510")  
7 pd <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum) 
8  
9 #  Create Plot 
10 png('plot3.png', width=480, height=480) 
11 p <- ggplot(pd, aes(x=year, y=Emissions, colour=type)) + 
12      geom_point(alpha=.3) + 
13      geom_smooth(alpha=.2, size=1, method="loess") + 
14      ggtitle("Total Emissions by Type in Baltimore City") 
15  
16 print(p) 
17  
18 dev.off() 
