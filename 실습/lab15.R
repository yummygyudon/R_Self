install.packages("RColorBrewer")
library(tm)
library(RColorBrewer)

Click_Log <- readLines("data/product_click.log")


  #sapply(Click_Log, function(x){x[]})
#문제 1
dev.copy(png,"clicklog1.png")
p.click_table <-table(substr(Click_Log,nchar(Click_Log)-3,nchar(Click_Log))) 
p.name <- names(p.click_table)
nchar(p.click_table)

barplot(p.click_table, main = "세로바 그래프 실습", 
        xlab='상품ID', ylab='클릭수', 
        col=terrain.colors(length(p.name)), col.main="red", family='dog')
dev.off()

as.numeric("08")

#문제 2
t.click_table <- table(substr(Click_Log,9,10))
time <- as.numeric(names(t.click_table))

dev.copy(png, "clicklog2.png")
pie(t.click_table, labels = paste0(time,"-",time+1),main = "파이그래프 실습",
    col=rainbow(length(time)), col.main="blue", cex.main=1.8,
    family='dog')#, font.main=2, font.lab=2)
dev.off()

#문제 3
dev.copy(png,"clicklog3.png")
성적 <- read.table("data/성적.txt", header=TRUE)
성적$성명 <- c('길동','둘리','또치','도우너','희동','듀크','턱시', '토토로','올라프','우디')
student <- 성적$성명
score.mat <- 성적[3:5]
score.mat <- as.matrix(score.mat)
rownames(score.mat) <- student

xmax<-length(student)
ymax <- sum(max(성적[3]),max(성적[4]),max(성적[5]))


barplot(t(score.mat), main="학생별 점수",
        col=c("orange","aquamarine","pink"), col.main = "magenta",
        family='dog', cex.main=1.5)
legend(xmax+0.5, ymax-2, colnames(score.mat), cex=0.8, col = c("orange","aquamarine","pink") ,pch=15)  
dev.off()