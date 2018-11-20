############
set.seed(99)
x= sample(1:6, size=1000,replace=TRUE)
y= sample(1:6,size=1000,replace=TRUE)
z=x+y #adding the dice
d<- ifelse(z%%2==0,"even","odd") #checking if even or odd
Even<-length(d[d=="even"])       #sum of even
Odd<-length(d[d=="odd"])         #sum of odd
names(Odd)<- "Number Odd"        
names(Even)<- "Number Even"     
e<-c(Odd,Even)                    
print(e)

#####################
#set.seed(99)
#x= sample(1:6, size=1000,replace=TRUE)
#y= sample(1:6,size=1000,replace=TRUE)
#z=x+y

h<-1:12
for(i in z)
{ h[i]=length(z[z==i])}         #check for same values and determining their length

freq <- h[2:12]                 #frequency of unique numbers
names(freq) <- 2:12
print(freq)

#########
#set.seed(99)
#x= sample(1:6, size=1000,replace=TRUE)
#y= sample(1:6,size=1000,replace=TRUE)
#z=x+y

d<-z[rep(c(rep(FALSE,99),TRUE),10)] #repeat function used 10 times to determine the 100th element
print(d)