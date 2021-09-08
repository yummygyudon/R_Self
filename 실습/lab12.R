library(KoNLP)
# [문제1]
v1 <- c('Happy', 'Birthday', 'to', 'You')
cat("각 원소들의 문자 개수 : ",nchar(v1), ", 모든 문자들의 합 : ", sum(nchar(v1)))

# [문제2]
v2 <- paste(v1, collapse = " ")
length(v2)
nchar(v2)

# [문제3]
c1<- sapply(1:10, function(x) paste(LETTERS[x],x,collapse = " ") ) 
c2<- sapply(1:10, function(x) paste0(LETTERS[x],x) ) 

# [문제4]
txt <- "Good Morning"
unlist(strsplit(txt,split = " "))
unl_txt <- unlist(strsplit(txt,split = " "))
word1 <- unl_txt[1] ; word2 <- unl_txt[2]
list(word1,word2)

# [문제5]
str <- c("Yesterday is history, tomorrow is a mystery, today is a gift!", 
         "That's why we call it the present – from kung fu Panda")

str2 <- gsub(pattern = "[,–]","",str)
str2 <- gsub(pattern = "  "," ",str2)
#str2 <- gsub(pattern = "–","",str)
#str3 <- gsub(pattern = "[[:punct:]]","",str2)

unlist(strsplit(str3,split = " "))


# [문제6]
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."

r1 <- gsub("[가-힣]","",s1)
r2 <- gsub("[@^!.]", "", s1)
#r2 <- gsub("[[:punct:]]", "", s1)

r3 <- gsub("[가-힣]|[@^!.]", "", s1)
#r3 <- gsub("[[:punct:]]","",r1)

r4 <- gsub("100","백",s1)


# [문제8]
day<-as.POSIXlt("2021-10-01")
weekdays(day)

# [문제9]
log <- readLines("data/product_click.log")
date <- substr(log, 1, 8)
date <- as.Date(date,format='%Y%m%d')
weekdays <- weekdays(as.POSIXlt(date))
weekdays <- table(weekdays)
kr_weekdays <- c("금", "월", "토", "목", "화", "수")
cat("클릭수가 가장 많은 요일은 ", kr_weekdays[which.max(weekdays)], "요일 입니다", sep="")
cat("클릭수가 가장 많은 요일은 ", names(sort(weekdays, decreasing = T)[1]), "입니다", sep="")

#click<- read.table("data/product_click.log")
#click <- data.matrix(click, sort(click,click$V2))
#data.frame(click, sort(integer(click$V2)))
#,colnames(c("index","date","clk_times")))