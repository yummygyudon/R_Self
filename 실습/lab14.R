library(tm)

fruits <-c("포도", "귤","오렌지",
           "포도", "바나나", "망고",
           "오렌지", "바나나", "복숭아",
           "복숭아", "사과", "포도",
           "포도", "자몽", "자두",
           "사과", "포도", "망고")

corp <- VCorpus(VectorSource(fruits))
tdm <- TermDocumentMatrix(corp, 
                          control=list(wordLengths = c(1, Inf)))

m <- as.matrix(tdm)
cm <- m %*% t(m)
rownames(m) <-c('듀크', '둘리', '또치', '도우너', '길동', '희동')

favor <- rowSums(m)




most <- names(sort(favor, decreasing = T)[1])
#worst <- names(favor[which.min(favor)])
worst <- names(favor[favor == min(favor)])

cat("최다 선택 과일 : ", most,"\n")
cat("최저 선택 과일 : ", worst, "\n")



library(proxy)



group <- NULL
duke <- c("사과 포도 망고")
duli <- c("포도 자몽 자두")
ddochi <- c("복숭아 사과 포도")
douner <- c( "오렌지 바나나 복숭아")
gildong <- c("포도 바나나 망고")
hedong <- c("포도 귤 오렌지")
group <- c(duke, duli, ddochi, douner, gildong, hedong)

#데이터들의 이름 부여한 dataframe 생성
df_group <- as.data.frame(group)
df_group[,"name"] <- c('듀크', '둘리', '또치', '도우너', '길동', '희동')
df_group[1,2]


corp2 <- VCorpus(VectorSource(group))
dtm2 <- DocumentTermMatrix(corp2,
                           control = list(wordLengths = c(1, Inf)))
m2 <- as.matrix(dtm2)
#rownames(m) <-c(....)
tm <- t(m2)

cm <- m2 %*% tm

cos <- dist(cm, method = "cosine")

#cosine 거리 순 dataframe 만들기
cos_mat <- as.matrix(dist(cm, method = "cosine"))
n <- ncol(cos_mat)
col_nm <- colnames(cos_mat)
r <- 1
cos_long <- data.frame()

for (i in 1: (n-1)){
  for (j in (i+1):n){
    cos_long[r,1]<-col_nm[i]
    cos_long[r,2]<-col_nm[j]
    cos_long[r,3]<-cos_mat[i,j]
    r <- r+1
  }
}

#cosine 거리 가까운 순 정렬
cos_long <- cos_long[order(cos_long$V3),]
#cosine 거리 최솟값 데이터 추출
sim_fruit <- subset(cos_long, V3 == min(cos_long$V3))
#같은 cosine 거리 가진 데이터 쌍 group 이름 불러와서 출력
data_n <- ncol(sim_fruit)

cat("유사한 과일 취향")
for (i in 1: (data_n-1)){
  cat(df_group[sim_fruit[i,1],2],"-", df_group[sim_fruit[i,2],2],"\n")
}

library(qgraph)

qgraph(cm, labels=rownames(cm))



