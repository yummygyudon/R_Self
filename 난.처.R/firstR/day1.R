#194 pg ?뿰?뒿臾몄젣
x <- c(2,4,6,8)
y <- c(10, 12, 14, 16)
z <- c(18, 20, 22, 24)
m1 <- rbind(x, y, z)
m2 <- cbind(x, y, z)

matrix(c(2, 10, 18,
         4, 12, 20,
         6, 14, 22,
         8, 16, 24),
       nrow = 4, byrow =T )

matrix(c(2,4,6,8,
         10, 12, 14, 16,
         18, 20, 22, 24),
       ncol = 3, byrow = F )


install.packages('cowsay')
TRUE + TRUE

# 112pg 연습문제
#01
a <- 7
b <- 9
c <- a*b ; c

#02
a <- 90 
b <- 60
c <- 80
d <- 360 -(a+b+c) ; d

#03
dis <- 60
v1 <- 20
v2 <- 30
(avg <- dis/v1 + dis/v2)

#04
sugar <- 25
water <- 125
percent <- (sugar/(water+sugar)) * 100
print(percent)

# 194pg 연습문제
#04
m<- matrix(c(9,7,5,3,8,11,2,9),ncol=4,byrow = T)
m2 <- data.frame(m)
rownames(m2) <- c("x", "y")
colnames(m2) <- c("a", "b", "c", "d")
m2

#08
matrix(1:12, nrow=3) %% 3
matrix(1:12, nrow=3) + 3
rbind(matrix(1:9, nrow=3), c('1,','2','3')) +3 

#09
번호 <- c(1,2,3,4,5,6,7)
제목 <- c("그대랑","다툼","빨래", "두통","보조개", "매듭", "이상해" )
좋아요 <- c(16075, 8218, 12119, 738, 3200, 16144, 5110)
love <- data.frame(번호, 제목, 좋아요)

best <- subset(love, 좋아요 == max(love$좋아요))
best