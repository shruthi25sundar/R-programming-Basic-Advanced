#########################
set.seed(1000)
ids <- rep(as.character(1001:1005,2))
module <- c(rep("CT101",5),rep("CT102",5))
result <- c(rnorm(n = 5,mean = 70,sd = 5),rnorm(n = 5,mean = 50,sd = 8))
result<-c(NA,result[2:length(result)]) #add NA to the list
dataf<-data.frame(ids,module,result,stringsAsFactors = F) #printing the output in a format using dataframe
#############################
res_id<-ids
result<-c(NA,result[2:length(result)])
dataf<-data.frame(ids,module,result)
my_aggregate <- function(df, group_id, data_id, f, ...) #using aggregate user defined function 
  
{
  v<-unique(df[[group_id]]) #storing unique values of group_id in "v"
  res <- sapply(v,function(x)
  { 
    res<-f(df$result[df[[group_id]]==x], ...) #sapply function to iterate and operate the current value
    #the above statement checks if the column string matches with the unique values.They retrieve its corresponding value and store in res
    # res
  })
  names(res)<-v   
  print(res)
}

#test
my_aggregate(dataf, "module", "result", mean)


#3
my_aggregate(dataf, "module", "result", mean, na.rm=T)

#4
my_aggregate(dataf, "ids", "result", mean)

#5
my_aggregate(dataf, "ids", "result", mean, na.rm=T)

#6
my_aggregate(1:10, "module", "result", mean, na.rm=T)

#7
my_aggregate(dataf, "modul", "result", mean)

#8
my_aggregate(dataf, "module", "ids", mean)

#9
my_aggregate(dataf, "module", "result", 10)

