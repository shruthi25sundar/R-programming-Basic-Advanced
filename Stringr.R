library(readr)
library(ggplot2)
library(plyr)
library(dplyr)

library(stringr)
stopwords <- c("a", "about", "above", "above", "across", "after", "afterwards", "again", 
               "against", "all", "almost", "alone", "along", "already", "also","although",
               "always","am","among", "amongst", "amoungst", "amount",  "an", "and", "another", 
               "any","anyhow","anyone","anything","anyway", "anywhere", "are", "around", "as",  
               "at", "back","be","became", "because","become","becomes", "becoming", "been", 
               "before", "beforehand", "behind", "being", "below", "beside", "besides", 
               "between", "beyond", "bill", "both", "bottom","but", "by", "call", "can", 
               "cannot", "cant", "co", "con", "could", "couldnt", "cry", "de", "describe", 
               "detail", "do", "done", "down", "due", "during", "each", "eg", "eight", "either", 
               "eleven","else", "elsewhere", "empty", "enough", "etc", "even", "ever", "every", 
               "everyone", "everything", "everywhere", "except", "few", "fifteen", "fify", 
               "fill", "find", "fire", "first", "five", "for", "former", "formerly", "forty", 
               "found", "four", "from", "front", "full", "further", "get", "give", "go", "had", 
               "has", "hasnt", "have", "he", "hence", "her", "here", "hereafter", "hereby", 
               "herein", "hereupon", "hers", "herself", "him", "himself", "his", "how", "however", 
               "hundred", "ie", "if", "in", "inc", "indeed", "interest", "into", "is", "it", "its", 
               "itself", "keep", "last", "latter", "latterly", "least", "less", "ltd", "made", 
               "many", "may", "me", "meanwhile", "might", "mill", "mine", "more", "moreover", 
               "most", "mostly", "move", "much", "must", "my", "myself", "name", "namely", 
               "neither", "never", "nevertheless", "next", "nine", "no", "nobody", "none", "noone", 
               "nor", "not", "nothing", "now", "nowhere", "of", "off", "often", "on", "once", "one", 
               "only", "onto", "or", "other", "others", "otherwise", "our", "ours", "ourselves", 
               "out", "over", "own","part", "per", "perhaps", "please", "put", "rather", "re", 
               "same", "see", "seem", "seemed", "seeming", "seems", "serious", "several", "she", 
               "should", "show", "side", "since", "sincere", "six", "sixty", "so", "some", "somehow", 
               "someone", "something", "sometime", "sometimes", "somewhere", "still", "such", "system",
               "take", "ten", "than", "that", "the", "their", "them", "themselves", "then", 
               "thence", "there", "thereafter", "thereby", "therefore", "therein", "thereupon", 
               "these", "they", "thickv", "thin", "third", "this", "those", "though", "three", 
               "through", "throughout", "thru", "thus", "to", "together", "too", "top", "toward",
               "towards", "twelve", "twenty", "two", "un", "under", "until", "up", "upon", "us", 
               "very", "via", "was", "we", "well", "were", "what", "whatever", "when", "whence", 
               "whenever", "where", "whereafter", "whereas", "whereby", "wherein", "whereupon", 
               "wherever", "whether", "which", "while", "whither", "who", "whoever", "whole", 
               "whom", "whose", "why", "will", "with", "within", "without", "would", "yet", "you", 
               "your", "yours", "yourself", "yourselves", "the")

invalid_characters <- c("--","\\?","\\!","\\.",",","'",":")

#question1
f_pre<-readLines("C:/Users/Shruthi/Desktop/Chapter_2.txt")
str(f_pre)
f_pre[1:10]
convert_to_words_vector<-function(f_pre){
  new_pre<-unlist(str_split(f_pre," "))
  new_pre<-new_pre[new_pre!=""]
  return(new_pre)
}
f_pre_vec <- convert_to_words_vector(f_pre)
str(f_pre_vec)
f_pre_vec[1:10]

#question2
invalid_char<-str_c(invalid_characters,collapse = "|")
new_char<-str_replace_all(f_pre_vec,invalid_char, "")
new_char<- tolower(new_char)
stop_words<-str_c(stopwords,collapse = "$|^")
stop_words<-str_c("^",stop_words,"$",collapse="|")
f_post<-str_replace_all(new_char,stop_words, "")
f_post<-f_post[f_post!=""]
str(f_post)

#question 4
new_words <-tibble( word=unique(f_post))
new_words<- new_words %>% mutate(
Pattern = str_c("^",word,"$"),
Wlength = str_length(word))
print(new_words)


#question5
freq<- new_words[,3,drop=F]
freq <- freq %>% count(Wlength)
colnames(freq)[1]<-"Wlength"
colnames(freq)[2]<-"Wfrequency"
print(freq)

#question6
bp<-ggplot(data=freq)+geom_line(mapping=aes(x=Wlength,y=Wfrequency))+geom_point(mapping=aes(x=Wlength,y=Wfrequency),color="blue")+labs(x="Word Length",y="Word Frequency")
print(bp)

     
