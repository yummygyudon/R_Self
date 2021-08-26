#문제1
str(iris)


#문제2
x <- c(1:5)
y <- seq(2,10,2)
df1 <- data.frame(x,y)

 
#문제3
col1 <- c(1:5)
col2 <- letters[col1]
col3 <- col1+5
df2 <- data.frame(col1,col2,col3)


#문제4
df3 <- data.frame(가격=c(1800, 1500, 3000),
                  판매량=c(24, 38, 13))
rownames(df3)<-c("사과","딸기","수박")
df3
#뭐가 맞는지 모르겠어서..
#df3 <- data.frame(제품명=c("사과","딸기","수박"),
#                  가격=c(1800, 1500, 3000),
#                  판매량=c(24, 38, 13))
#제품명<-c("사과","딸기","수박")
#rownames(df3)<-제품명
#df3


#문제5
mean(df3$가격)
mean(df3$판매량)


#문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math) ;df4
#a
df4$stat <- c(76,73,95,82,35)
#b
df4$score <- df4$math + df4$stat
#c
df4$grade <- ifelse(df4$score>=150,"A",
                ifelse(df4$score>=100, "B",
                       ifelse(df4$score>=70,"C","D")))


#myemp <- read.csv(file.choose())
myemp <- read.csv("C:/JDG(MultiCampus)_common/Rexam/data/emp.csv")


#문제7
myemp
View(myemp)
str(myemp)


#문제8
myemp[c(3,4,5),]


#문제9
myemp[,-4]


#문제10
myemp[,"ename"]


#문제11
myemp[,c("ename","sal")]


#문제12
subset(myemp,myemp$job=="SALESMAN", c("ename","sal","job"))


#문제13
myemp[myemp$sal>=1000 & myemp$sal<=3000,c("ename","sal","deptno")]


#문제14
myemp[myemp$job != "ANALYST",c("ename","job","sal")]


#문제15
myemp[myemp$job=="SALESMAN" | myemp$job=="ANALYST",c("ename","job")]


#문제16
myemp[is.na(myemp$comm),c("ename","sal")]


#문제17
#이건 sal의 요소들만 처리한 명령
#sort(myemp$sal) ; myemp

myemp[c(order(myemp$sal)),]
#order로 자동 sort되어 작은순으로 index값으로 반환하는 것을 활용
#order(myemp$sal)을 하면 작은 순의 index를 반환하여 행번호를 출력한 후, 이를 myemp[]의 행 인덱스로 입력

#문제18
nrow(myemp)
ncol(myemp)
dim(myemp)

#문제19
summary(as.factor(myemp$deptno))
table(myemp$deptno)



#문제20
table(myemp$job)
