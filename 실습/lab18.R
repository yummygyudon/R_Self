library(ggplot2)
library(treemap)
library(dplyr)
library(tidyr)
library(showtext)
showtext_auto() 
font_add(family = "dog", regular = "fonts/THEdog.ttf")

# 문제1
mpg <- as.data.frame(ggplot2::mpg)
ggplot(mpg, aes(cty,hwy)) + geom_point(col="blue") #+ theme(text=element_text...)
ggsave("result1.png")


# 문제2
ggplot(mpg, aes(class)) +geom_bar(aes(fill=factor(drv))) #fill=drv 가능 / + alpha= / + theme=
ggsave("result2.png")


# 문제3
log <- readLines("data/product_click.log")
# read.table() 훨씬 용이
V2 <- substr(log,14,17)
V2 <- as.data.frame(V2)



ggplot(V2, aes(V2)) +geom_bar(aes(fill=V2)) + 
  labs(x="상품ID", y="클릭수",title = "제품당 클릭수\n제품당클릭수를 바그래프로 표현") +
  theme_bw()
ggsave("result3.png")


# 문제4
data(GNI2014)
View(GNI2014)

#png("result4.png")
treemap(GNI2014, vSize = "population", index=c("continent","iso3"), title = "전세계 인구 정보", fontsize.title = 20,fontsize.labels=c(15,8), border.col="green", fontfamily.title="dog")

?treemap
dev.copy(png, "result4.png")
dev.off()


# 문제5
score <- read.csv("data/성적2.csv", encoding="UTF-8")
 
str(score)
#그림1
View(score)
#그림2
#range=1 : 이상치까지 모두 표현 / range = 0 :극단치 표현 X
boxplot(score$국어,score$수학, names=c("국어","수학"),range=1)
#그림3
m_math <- round(mean(score$수학, na.rm=T))
score$수학[score$수학>10] <- m_math

score$수학 <- ifelse(score$수학> 10 , round(mean(score$수학, na.rm=T)), score$수학)

View(score)
#그림4
score <- fill(score,국어,수학, .direction = "updown")
View(score)
#score <- as.data.frame(score)
#그림5
ggplot(score,aes(국어,수학,col=성명,size=3)) +geom_point()
#ggplot(score,aes(국어,수학,col=성명)) +geom_point(aes(size=3))

ggsave("result5.png")

