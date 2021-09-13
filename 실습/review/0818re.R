#문제 1
str(iris)
summary(iris)

df1 <- data.frame(x=c(1,2,3,4,5), y=c(2,4,6,8,10))
df2 <- data.frame(col1=c(1:5), col2=letters[1:5], col3=c(6:10))

제품명 = c("사과", "딸기", "수박")
가격 = c(1800, 1500, 3000)
판매량 = c(24, 38, 13)
df3 <- data.frame(제품명,가격, 판매량)
str(df3)

mean(df3$가격)
mean(df3$판매량)
rm(df4)
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)

df4 <- data.frame(name, gender, math)

df4$stat <- c(76,73,95,82,35)
df4$score <- df4$stat + df4$math
str(df4)
df4$grade <- ifelse(df4$score >= 150, "A",
                    ifelse(df4$score >=100, "B",
                           ifelse(df4$score >=70,"C","D")))
df4


##lab3 참고

#Indexing 으로 원하는 조건값 꺼내기
#3,4,5행만
myemp[c(3,4,5),]
iris[1,1]
iris[c(1,2,3)]

#4열만 빼고
myemp[,-4]

# ename열만
myemp[,"ename"]
iris["Sepal.Width"]
iris$Sepal.Width

# ename , sal 두 열만
myemp[,c("ename","sal")]

##subset
# subset([dataframe] , [조건식], [뽑아올 열 이름])
subset(myemp,myemp$job=="SALESMAN", c("ename","sal","job"))


# 조건식 논리연산자& 함수 사용가능
myemp[myemp$sal>=1000 & myemp$sal<=3000,c("ename","sal","deptno")]

myemp[myemp$job != "ANALYST",c("ename","job","sal")]

myemp[myemp$job=="SALESMAN" | myemp$job=="ANALYST",c("ename","job")]

myemp[is.na(myemp$comm),c("ename","sal")]

iris[iris$Sepal.Width >= 3.0 & iris$Sepal.Length >= 4.0, c("Petal.Width", "Species")]

## Sort
#특정열만 sort 가능
#decreasing = F (오름차순 기본값)
sort(myemp$sal) ; myemp

#sort는 "정렬 후 반환"/ order는 비교 후 정렬하지 않고 index 값만 반환
myemp[c(order(myemp$sal)),]
#order로 자동 sort되어 작은순으로 index값으로 반환하는 것을 활용
#order(myemp$sal)을 하면 작은 순의 index를 반환하여 행번호를 출력한 후, 이를 myemp[]의 행 인덱스로 입력

#행 갯수 / 열 갯수 / 행&열 갯수(dim)
nrow(myemp)
ncol(myemp)
dim(myemp)

# 요약본(summary) , facter/level 별 빈도수
summary(as.factor(myemp$deptno))
table(myemp$deptno)

table(myemp$job)


#######################################
#######################################
L1 <- list(name=c("scott"),
           sal=c(3000))
result1 <- unlist(L1$sal)[1] * 2


name <- list("scott")
sal <- list(c(100, 200, 300))
L2 <- c(name, sal)


L3 <- list(c(3,5,7),c("A", "B", "C"))
L3[[2]][1] <- "Alpha"


L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4$alpha <- L4$alpha +10
L4


L5 <- list(data1 = LETTERS,
           data2 = L4)


test.iris <- iris
test.iris[c(1,5,10), 2] <- NA
test.iris[is.na(test.iris[2]),c(1:5)]
