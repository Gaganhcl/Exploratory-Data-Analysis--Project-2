1 ######### Plot 1 
2  
3  
4 #  Read Data  
5 NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds") 
6  
7 #  Create Plot-Data 
8 pd <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum) 
9  
10 #  Create Plot 1 
11  
12 png('plot1.png', width=480, height=480) 
13 plot(pd$year, pd$Emissions, type = "l",  
14      main = "Total Emissions from PM2.5 in the US", 
15      xlab = "Year", ylab = "Emissions") 
16  
17  
18 dev.off() 
19  
20 ######################################################## 
