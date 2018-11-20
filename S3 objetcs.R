myvec <- function(v){
  if(!is.numeric(v))
    stop("Error, data type must be numeric.")
  structure(list(data=v),class="myvec")
}
x<-myvec(1:10)
#print function
print.myvec<-function(x){
  cat("S3 class=myvec")
  cat("\n number of elements",length(x$data),"\n")
  cat(x$data)
}
######################

'[.myvec'<-function(a,b){a$data[b]}
#################################
'[<-.myvec'<-function(a,b,value=c){
  a$data[b]<-value
  a
  }
################################
'<.myvec'<-function(a,b){
  a$data<b
}
##################################
'>.myvec'<-function(a,b){
  a$data>b
}
#######################################
'!=.myvec'<-function(a,b){
  a$data!=b
}
###################################
#sum
sum.myvec<-function(a,na.rm=F){
  if(na.rm==T){
    sum(a$data,na.rm=T)
  }
  else{
    sum(a$data)
  }
}

#################################
#mean
mean.myvec<-function(a,na.rm=F){
  if(na.rm==T){
    mean(a$data,na.rm=T)
  }
  else{
    mean(a$data)
  }
}



#questions
x[1:2]
x[1:2] <- 0
x[x<1]
x[x>1]
x[x!=0]
x[1]<-NA
sum(x)
sum(x,na.rm = T)
mean(x)
mean(x,na.rm=T)
