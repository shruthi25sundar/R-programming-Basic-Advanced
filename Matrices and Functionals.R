#######################
set.seed(10)
N=10
cs1<-rnorm(N,72,10)
cs2<-rnorm(N,65,7)
cs3<-rnorm(N,80,9)
cs4<-rnorm(N,55,7)
cs5<-rnorm(N,61,5)  
m<-matrix(ncol = 5,nrow=10)                    #5*10 matrix
colnames(m)<-c("cs1","cs2","cs3","cs4","cs5")  #column names 
rownames(m)<-1:10                              #row names
result<-cbind(cs1,cs2,cs3,cs4,cs5)             

print(result)                                  #result is displayed

######################
#set.seed(10)
#N=10
#cs1<-rnorm(N,72,10)
#cs2<-rnorm(N,65,7)
#cs3<-rnorm(N,80,9)
#cs4<-rnorm(N,55,7)
#cs5<-rnorm(N,61,5)
m<-matrix(ncol = 5,nrow=10)
colnames(m)<-c("cs1","cs2","cs3","cs4","cs5")
rownames(m)<-1:10
result<-cbind(cs1,cs2,cs3,cs4,cs5)
rownames(result)<-c(1:10)                    #rownames from 1 to 10
answer<-apply(result,2,function(x){          #apply function 
 sorted<- names(sort(x,decreasing = T))      #sort them in descending order and store the index values in storeed
 print(sorted)
 # x - column
 # x[6]-1
 # x[5]-2
 x[sorted]<-1:10                            #to map the values
 print(x)
})
rownames(answer)<-c("student#1","student#2","student#3","student#4","student#5","student#6","student#7","student#8","student#9","student#10")
print(answer)                               




#######################################
#set.seed(10)
#N=10
#cs1<-rnorm(N,72,10)
#cs2<-rnorm(N,65,7)
#cs3<-rnorm(N,80,9)
#cs4<-rnorm(N,55,7)
#cs5<-rnorm(N,61,5)
m<-matrix(ncol = 5,nrow=10)
colnames(m)<-c("cs1","cs2","cs3","cs4","cs5")
rownames(m)<-1:10
result<-data.frame(cbind(cs1,cs2,cs3,cs4,cs5))
rownames(result)<-c(1:10)
answer<-apply(result,2,function(x){
  sorted<- names(sort(x,decreasing = T))
  print(sorted)
 
  x[sorted]<-1:10
  print(x)
})
rownames(answer)<-c("student#1","student#2","student#3","student#4","student#5","student#6","student#7","student#8","student#9","student#10")


median<-apply(answer,1,median)                            #apply function to compute median 
print(data.frame(answer,median))                          #to print the result with median column in it







