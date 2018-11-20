library(ggplot2)
library(readxl)
orig_list<-read_excel("C:/Users/Shruthi/Downloads/titanic3_assignment (1).xls")
plist<-orig_list
dim(plist)
summary(plist)
mode(plist$survived)<-"logical"
summary(plist)
mode(plist$pclass)<-"character"
summary(plist)
Mean<-mean(plist$age,na.rm=T)
print(Mean)
MeanFare<- mean(plist$fare,na.rm=T)
print(MeanFare)

set.seed(99)
summary(plist$embarked)

unique(plist$embarked)


