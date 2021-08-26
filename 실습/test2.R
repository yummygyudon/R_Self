#문제 7
words <- scan("data/iotest2.txt", what="",encoding="UTF-8")
words <- as.character(words)
#words <- as.factor(words)
words

words_table <- data.frame(table(words))
#View(words_table)
words_table <- words_table[order(words_table$Freq,decreasing = T),]
words_table[1,1]



#############################################################

words <- scan("data/iotest2.txt", what="",encoding="UTF-8")
sort(table(words),decreasing = T)[1]
cat("가장 많이 등장한 단어는", names(sort(table(words),decreasing = T)[1]),"입니다.\n")

words <- table(words)
name<- names(words[which.max(words)])
cat("가장 많이 등장한 단어는", name,"입니다.\n")