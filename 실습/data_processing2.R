#data_processing2
memo <- readLines("data/memo.txt",encoding = "UTF-8")
memo

#gsub("[[:punct:]]",replacement = "", x=memo[1])

memo[1] <- gsub("[&|$|!|#|@|%]",replacement = "", x=memo[1])

memo[2] <- gsub("[[:lower:]]","E",x=memo[2])

memo[3] <- gsub("[[:digit:]]","",x=memo[3])

memo[4] <- gsub("[A-z]","",x=memo[4])

memo[5] <- gsub("[A-z|[:punct:]|[:digit:]]","",x=memo[5])

memo[6] <- gsub("\\s","",x=memo[6]) #gsub("[[:space:]]","",x=memo[6])

memo[7] <- paste(gsub("YOU","you",x=substr(memo[7],start = 1,stop = 10)),gsub("OK","ok",x=substring(memo[7],11)))

memo[7] <- gsub(pattern= '([[:upper:]])', perl=T, replacement='\\L\\1', memo[7])





write.table(memo,file = "memo_new3.txt",sep = "\n",fileEncoding = "UTF-8",row.names = F,col.names = F )


#case2
