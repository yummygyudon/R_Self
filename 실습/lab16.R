library(tm)
library(proxy)
library(qgraph)
library(plotrix)
library(showtext)
showtext_auto()
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")

getwd()

Click_Log <- readLines("../data/product_click.log")

# 문제1
day <- substr(Click_Log,1,8)
y <- substr(day,1,4)
m <- substr(day,5,6)
d <- substr(day,7,8)

day <- paste0(y,'-',m,'-',d)
day<-as.POSIXlt(day)
w.day <- weekdays(day)

day_level <- c('월요일','화요일','수요일','목요일','금요일','토요일')
factor(w.day,levels=day_level,ordered = T)
w.day <- table(factor(w.day,levels=day_level,ordered = T))
#w.day <- table(w.day[c('월요일','화요일','수요일','목요일','금요일','토요일')])


#w.day <- table(w.day)
#mon <- as.numeric(w.day["월요일"])
#tue <- as.numeric(w.day["화요일"])
#wen <- as.numeric(w.day["수요일"])
#thu <- as.numeric(w.day["목요일"])
#fri <- as.numeric(w.day["금요일"])
#sat <-as.numeric(w.day["토요일"])

#w.day <- c(mon,tue,wen,thu,fri,sat)
#t(w.day)$월요일
#w.day <- as.matrix(w.day)
#w.name <- c('월요일','화요일','수요일','목요일','금요일','토요일')

#click.day <- as.matrix(rbind(w.day, w.name))


png("clicklog4.png", 900,600)
par(mfrow=c(1,2))
plot(w.day,
     ann=F,
     type='o',
     lty=1,
     lwd=5,
     ylab=NULL,# ""로도 삭제 가능
     ylim=c(0,300),
     main="요일별 클릭 수",
     col="orange",
     family='cat')
title(main = "요일별 클릭 수",family='cat', cex.main =2)
barplot(w.day,
        col = rainbow(length(w.day)),
        ylim=c(0,300),
        family='cat')
#col = topo.colors()
title(main = "요일별 클릭 수",family='cat', cex.main =2)
dev.off()


# 문제2
movie_review <- read.csv("../output/movie_reviews3.csv")
#ann=F 는 제목들 삭제

png("clicklog5.png", 900,600)
par(mar=c(5,5,5,5),mfrow=c(1,3))
hist(movie_review$vpoint,
     main = "모가디슈 영화 평점 히스토그램(auto)",
     cex.main = 1,
     xlab="평점",
     ylab="평가지수",
     xlim = c(1,10),
     family='dog',
     col = rainbow(length(table(movie_review$vpoint))))#heat.colors()


hist(movie_review$vpoint,
     family='dog',
     breaks = 2,
     main = "모가디슈 영화 평점 히스토그램(1~5,6~10)", 
     xlab = "평점",
     ylab="평가지수",
     col = c('skyblue','pink'))

hist(movie_review$vpoint,
     family='dog',
     breaks = c(1,5,6,7,8,9,10),
     probability = F,
     las=1,
     main = "모가디슈 영화 평점 히스토그램(1~5,6,7,8,9,10)", 
     xlab = "평점", 
     ylab="평가지수")
#probablity : 빈도
dev.off()



# 문제3
성적 <- read.table("data/성적.txt", header=TRUE)

png("clicklog6.png", 800,600)
par(mfrow=c(1,1))
score <- 성적[c("국어", "수학", "영어")]

boxplot(score, ann=F,axes=F,col=c("red","green","blue"))
title(main="과목별 성적 분포",col.main="orange",cex.main = 3,family='maple')
axis(1, at=1:3,lab=c("국어","수학", "영어"), family="maple")
axis(2, at=seq(0,10,2), family="maple")
box()
dev.off()