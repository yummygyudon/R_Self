
# 문제1
library(ggplot2)
library(fmsb)
p.stat <- read.csv("data/picher_stats_2017.csv", encoding = "UTF-8")
View(p.stat)
p.stat <- data.frame(p.stat)
p.stat <- cbind(p.stat$선수명, p.stat$삼진.9, p.stat$볼넷.9, p.stat$홈런.9)
p.stat <- data.frame(p.stat)
colnames(p.stat) <- c("선수명", "삼진", "볼넷", "홈런")
yang.stat <- p.stat[p.stat$선수명 == "양현종",]

only_stat <- p.stat[,-1]

max <- rep(as.double(max(only_stat$삼진)),3)
min <- rep(0,3)
yang.stat <- as.double(unlist(yang.stat[,-1]))


ds <- rbind(max,min,yang.stat)
ds <- data.frame(ds)
colnames(ds) <- c("삼진", "볼넷", "홈런")
radarchart(ds,                           
            pcol='red',             
            pfcol="#ffcccc80",   # 다각형 내부 색
            plwd=3,                       # 다각형 선의 두께
            cglcol='grey',                # 거미줄의 색
            cglty=1,                      # 거미줄의 타입
            cglwd=0.8,                    # 거미줄의 두께
            axistype=1,                   # 축의 레이블 타입
            seg=4,                        # 축의 눈금 분할                         
            axislabcol='grey',            # 축의 레이블 색
            caxislabels=seq(0,100,25)     # 축의 레이블 값
            )+ title("양현종 선수의 성적")
dev.copy(png, "lab19.png")
dev.off()

           
library(htmlwidgets)

# 문제2
library(leaflet)
library(dplyr)
library(ggmap)
msg <- "<b>꿀맛규동의 집</b>" 
home_lonlat <- geocode(enc2utf8("송파구 석촌동219-4"), source='google')
lon <- home_lonlat$lon
lat <- home_lonlat$lat
home <- leaflet() %>% addTiles() %>% 
  setView(lng = home_lonlat$lon, lat = home_lonlat$lat, zoom = 15) %>%
  addCircleMarkers(lng = lon, lat = lat, color='red', popup = msg, radius = runif(2.5,2.5,6) )

saveWidget(home, file='lab19.html')


# 문제3
library(ggplot2)
iris
View(iris)
s.Sep_wd <- summary(iris$Sepal.Width)

#1
m.Sep_wd <- mean(iris$Sepal.Width)
quan.Sep_wd <- s.Sep_wd[[5]][1]
sd.Sep_wd <- sd(iris$Petal.Width)
cat("평균 : ",m.Sep_wd, "\n표준편차 : ", sd.Sep_wd,"\n3분위수 : ",quan.Sep_wd,"\n")

#2
hist(iris$Sepal.Width, main = "꽃받침 너비 Histogram", xlab=NULL, ylab=NULL )

#3
species <- factor(iris$Species)
boxplot(iris$Sepal.Width~species )
cat("Sepal.Width가 가장 넓은 품종은 Setosa 입니다.") 

#4
#s <- iris$Sepal.Width[iris$Species=="setosa"]
#s <- data.frame(as.double(s))
#colnames(s) <- "setosa"
#v <- iris$Sepal.Width[iris$Species=="versicolor"]
#v <- data.frame(as.double(v))
#colnames(v) <- "versicolor"
s <- subset(iris$Sepal.Width, iris$Species == "setosa")
v <- subset(iris$Sepal.Width, iris$Species == "versicolor")

#5
shapiro.test(s)
shapiro.test(v)
#s의 p값이 0.2715 이므로 귀무가설 기각 불가 = 정규분포
#v의 p값이 0.338 이므로 귀무가설 기각 불가 = 정규분포


#6
?t.test
t.test(s,v)
# s와 v의 p값은 2.484e-15 로 0.05보다 작으므로 대립가설 채택 = 평균이 다름

#7
test <- iris[,c(1,2,3,4)]
str(test)

#8
cor_test <- cor(test)
library(corrplot)
# diag : 자기자신과의 상관관계_ 대각선축 = F로 대각선 밑으로만 출력
corrplot(cor_test, method="number", type="lower", order="hclust", tl.srt=45, diag=F)

# Sepal.Length와 가장 큰 상관계수를 갖는 변수 = [Petal.Length] (0.87)