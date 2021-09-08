# 문제 1
#output/movie_reviews3.csv
movie_review <- read.csv("output/movie_reviews3.csv")
review <- movie_review[,4]
# movie_review$vreview
re_words <- gsub("[[:punct:][:lower:][:upper:][:digit:]]","",review)
re_words2 <- gsub("[ㄱ-ㅎ]","",re_words)
re_words3 <- gsub("[ㅏ-ㅣ]","",re_words2)
# blank 여러개 올 때 gsub(" ( )+", " ", re_words3) _ blank 하나로

library(KoNLP)
words_data<-unlist(extractNoun(re_words3))
words_data<-Filter(function(x) {nchar(x) >= 2}, words_data)

words_count<-head(sort(table(words_data), decreasing = T),10)

movie_words <- data.frame(words_count)
colnames(movie_words)<- c("단어", "횟수")
write.csv(movie_words, "output/movie_top_word.csv")



# 문제 2
library(wordcloud2)
re_book <- readLines("output/yes24.txt", encoding = "ANSI")
review <- gsub("[[:digit:][:punct:][:lower:][:upper:]]","",re_book)
review2 <- gsub("(추천합니다){2,}|\\b","",review)
#review2 <- review2[nchar(review2) > 0]  빈 행 제거

#gsub("^가-힣[:space:]]",...) 로 바로 붙혀 한글 의미 구분을 위해 필요한 공백 보존 (space도 제외하고 삭제제)


re_book_data <- unlist(extractNoun(review2))
re_book_data <- Filter(function(x){nchar(x)<5&nchar(x)>=2},re_book_data)

review_words <- data.frame(sort(table(re_book_data),decreasing = T))
result <- wordcloud2(review_words,fontFamily = "THE개이득",
           color="random-dark")

htmltools::save_html(result,"yes24.html")



gsub("[ㄱ-ㅎㅏ-ㅣ가-힣]", "@", "abcABC123가나다 !#ㅋㅋㅋ##ㅠ123")
gsub("[ㄱ-ㅎ]", "@", "abcABC123가나다 !#ㅋㅋㅋ##ㅠ123")
gsub("[ㅏ-ㅣ]", "@", "abcABC123가나다 !#ㅋㅋㅋ##ㅠ123")
