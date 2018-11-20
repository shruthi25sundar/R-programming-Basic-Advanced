library(nycflights13)
library(dplyr)
library(lubridate)
library(ggplot2)
#2 
my_flights<-flights 
print(my_flights)
#3
my_flights<-flights%>%filter(!is.na(dep_delay),!is.na(arr_delay)) #filter Na from dep delay and arr_delay
my_flights<-select(my_flights,time_hour,origin,dest,carrier,dep_delay,arr_delay,air_time,distance)
#3(b)
my_flights$DayOfWeek<-wday(my_flights$time_hour,label=T,abbr = T) #creating new day of week using time_hour
my_flights$HourOfDay<-hour(my_flights$time_hour)                  #creating Hour of the day column using time_hour
my_flights$Month<-month(my_flights$time_hour,label=T,abbr=T)      #creating new column Month
select(my_flights,time_hour,DayOfWeek,HourOfDay,everything())


#4
delay_hourly<-my_flights%>%group_by(HourOfDay)%>%                #delay_hourly column is created
  summarize(AvgDepDelay=mean(dep_delay),                         #mean of dep_delay
            SD=sd(dep_delay),                                    #standard deviation of dep_delay
            Mindelay=min(dep_delay),                             #to determine the minimum value
            Maxdelay=max(dep_delay),MaxDelayHour=max(dep_delay/60))%>% arrange(desc(AvgDepDelay)) #determine max and arrange them in descending order


#5
delay_monthly<-my_flights%>%group_by(Month)%>% 
  summarize(AvgDepDelay=mean(dep_delay),
            SD=sd(dep_delay),
            Mindelay=min(dep_delay),
            Maxdelay=max(dep_delay),MaxDelayHour=max(dep_delay/60))%>% arrange(desc(AvgDepDelay))

#6
delay_carrier<-my_flights%>%group_by(carrier)%>% 
  summarize(AvgDepDelay=mean(dep_delay),
            SD=sd(dep_delay),
            Mindelay=min(dep_delay),
            Maxdelay=max(dep_delay),MaxDelayHour=max(dep_delay/60),NObs=n())%>% arrange(desc(AvgDepDelay)) #number of observations column is added 


#7
delay_Airport_Month<-my_flights%>%group_by(origin,Month)%>% 
  summarize(AvgDepDelay=mean(dep_delay),
            SD=sd(dep_delay),
            Mindelay=min(dep_delay),
            Maxdelay=max(dep_delay),MaxDelayHour=max(dep_delay/60),NObs=n())%>% arrange((Month))

#8
delay_Airport_time<-my_flights%>%group_by(HourOfDay,origin)%>% 
  summarize(AvgDepDelay=mean(dep_delay),
            SD=sd(dep_delay),
            Mindelay=min(dep_delay),
            Maxdelay=max(dep_delay),MaxDelayHour=max(dep_delay/60),NObs=n())%>% arrange(HourOfDay)

#9


my_flights$Daysection=                                                                   #filtering the time_hour into three categories
case_when( hour(my_flights$time_hour) >= 5 & hour(my_flights$time_hour) <= 12 ~ "Morning",
           hour(my_flights$time_hour) >12 & hour(my_flights$time_hour) <18 ~"Afternoon",
           TRUE                                                ~"Evening")
select(my_flights,Daysection,everything())


#10
set.seed(99)

myfsample<-my_flights%>% sample_n(10000) %>% filter(dep_delay<180)                      #creating sample and fileter dep_delay less than 180
myfsample

#11
bp<-ggplot(data=myfsample,aes(x=Month,y=dep_delay,fill=Daysection,color=Daysection))+geom_boxplot() #boxplot for myfsample
print(bp)
