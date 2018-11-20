library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(readxl)
#2
#importing the dataset 
ener <- read_excel("C:/Users/Shruthi/Desktop/datasets/IrelandData January 2017.xlsx")
ener
#3
#creating new columns accordig to the specified format
ener$NIFlow<- ifelse(ener$NetImports<0,"Exporting","Importing")
ener$Date<-date(ener$DateTime)
ener$Time<-format(as.POSIXct(ener$DateTime),format("%H:%M:%OS"))
ener$HourofDay<-hour(ener$DateTime)
ener$MinuteofDay<-minute(ener$DateTime)
ener$DayofWeek<-wday(ener$DateTime,label=T)
select(ener,DateTime,Date,Time,HourofDay,MinuteofDay,DayofWeek,NIFlow,Demand,everything())
#4
#	net	import	data	over	time,	colour	by	NIFlow,	and	facet	by	day	of	the	week
bp<-ggplot(data=ener)+geom_point(mapping=aes(x=HourofDay,y=NetImports,color=NIFlow))+facet_wrap(~DayofWeek)+labs(x="time (Hour of Day)",y="Net Imports")
print(bp)
#5
#wind	generation	vs	CO2 Emissions
bp<-ggplot(data=ener)+geom_point(mapping=aes(x=Wind,y=CO2,color=NIFlow))+labs(x="Wind Generation",y="CO2 Emissions")
print(bp)
#6
#importing dataset
weather <- read_excel("C:/Users/Shruthi/Desktop/datasets/Mac Head Wind Data.xlsx")
weather
#7
#changeing the date into a format specified
weather$Date<-as.Date(weather$Date)
weather
#8
#	average	wind	speed plot using geom_line
bp<-ggplot(data=weather)+geom_line(mapping=aes(x=Date,y=AVRWind),linetype="dotted")+geom_point(mapping=aes(x=Date,y=AVRWind),color="blue")+labs(y="Average Wind Speed(Knots)")
print(bp)

#9
#summarize using weather using the date after converting it into type date
Avg_Daily_wind<-ener %>% group_by(Date)%>% summarize(AvgWindGeneration=mean(Wind))
Avg_Daily_wind

#10
#joining the datasets and plot the graph
new_set<-inner_join(weather,Avg_Daily_wind,type='key')
bp<-ggplot(data=new_set)+geom_point(mapping=aes(x=AVRWind,y=AvgWindGeneration))+labs(x="Average Wind speed(Mac Head)",y="Average Wind Generation")
print(bp)

#10(b)

bp<-ggplot(data=new_set)+geom_point(mapping=aes(x=AVRWind,y=AvgWindGeneration))+geom_smooth(aes(x=AVRWind,y=AvgWindGeneration),se=TRUE,method="lm")+labs(x="average wind spedd(MAc Head)",y="Average Wind Generation")
print(bp)

#10(c)
bp<-ggplot(data=new_set)+geom_point(mapping=aes(x=AVRWind,y=AvgWindGeneration))+geom_smooth(aes(x=AVRWind,y=AvgWindGeneration),se=TRUE,method="loess")+labs(x="Average Wind speed(Mac Head)",y="Average Wind Generation")
print(bp)
