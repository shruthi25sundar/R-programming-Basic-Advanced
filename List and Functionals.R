####################
set.seed(111)

v<-1:10                #input from 1 to 10
my_table<-function(v)  
{if(!is.character(v))  #function checks if the input is character 
  stop("Error,input must be a character vector") 
 else
 print(v)}             #print the values
my_table(v)            #function call

########################
#set.seed(111)
d <- sample(c('M','F'),10,prob = c(.3,.7),replace = T) #sample input

d <- c(d,NA)                                           #add NA to the input

my_table<-function(d)
{
  
  if(anyNA(d)=='TRUE')                                #checks if NA                               
    stop("Error,input element has a NA element")      
  else 
    f=length(d[d=="F"])
  m=length(d[d=="M"])                               #else prints the count
  print(f)
  print(m)
  
}

my_table(d)                                         #function call

#########################
set.seed(111)
s <- sample(c('M','F'),10,prob = c(.3,.7),replace = T)
s<-c(s,NA)

my_table<-function(s,na.rm=T)                        
{ s<-s[!is.na(s)]                                 
female<- length(s[s=='F'])
male<- length(s[s=='M'])
names(female)<-'F'
names(male)<-'M'
c(female,male)

}
my_table(s,na.rm=T)


#function call

#################
#set.seed(111)
s <- sample(c('M','F'),10,prob = c(.3,.7),replace = T)
my_table<-function(s)
{ 
  f<- length(s[s=='F'])                            #check the length of 'F'
  m<- length(s[s=='M'])                            #check the length of 'M'
  names(f)<-'F'                                    #name it 'F'
  names(m)<-'M'                                    #name it 'M'
  c(f,m)
  
}
my_table(s)





