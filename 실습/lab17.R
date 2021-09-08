library(dplyr)
library(ggplot2)

getwd()
emp <- read.csv("data/emp.csv")
View(emp)

str(emp)

### [[1단계]] ###
## 문제1
emp %>% filter(job == "MANAGER")

## 문제2
emp %>% select(empno,ename,sal)

## 문제3
emp %>% select(-empno)

## 문제4
emp %>% select(ename, sal)

## 문제5
emp %>% group_by(job) %>% 
  summarise(count=n())

## 문제6
emp %>% filter(sal>=1000, 3000>=sal) %>% 
  select(ename,sal,deptno)


## 문제7
emp %>% filter(job != "ANALYST") %>% select(ename,job,sal)

## 문제8
emp %>% filter(job == "SALESMAN"|job =="ANALYST") %>% select(ename, job)

## 문제9
emp %>% group_by(deptno) %>% summarise(dep_sal=sum(sal))

## 문제10
arrange(emp,sal)

## 문제11
arrange(emp,desc(sal)) %>% head(1)

## 문제12
empnew <- rename(emp,salary=sal, commrate=comm)
str(empnew)

## 문제13
emp %>% group_by(deptno) %>% tally(sort = T) %>% head(1) %>% select(deptno)

## 문제14
emp %>% mutate(enamelength=nchar(ename)) %>%  arrange(enamelength) %>% select(ename, enamelength)

## 문제15
emp %>% filter(!is.na(comm)) %>% summarise(comm_emp=n())


### [[2단계]] ###
## 문제16
# 1
(mpg<-as.data.frame(ggplot2::mpg))
str(mpg)

# 2
cat("열의 개수 : ",ncol(mpg),"\n")
cat("행의 개수 : ", nrow(mpg),"\n")

dim(mpg)

# 3
head(mpg,10)

# 4
tail(mpg,10)

# 5
View(mpg)

# 6
summary(mpg)

# 7
mpg %>% group_by(manufacturer) %>% summarise(count=n())


# 8
#tibble형태
mpg %>% group_by(manufacturer, model) %>% summarise(count=n())
#data frame 형태
mpg %>% count(manufacturer, model)

## 문제17
# 1
(mpg_new <- rename(mpg,city=cty, highway=hwy))
str(mpg_new)

# 2
mpg_new %>% head()



## 문제18
# 1
mpg %>% mutate(group=ifelse(displ<=4,"배기량 4 이하","배기량 5 이상")) %>% group_by(group) %>%summarise(mean_hwy=mean(hwy)) %>% arrange(desc(mean_hwy))

cat("배기량이 4 이하인 자동차의 hwy가 평균적으로 높다.")

# 2
mpg %>% group_by(manufacturer) %>% filter(manufacturer=="audi"|manufacturer=="toyota") %>% summarise(mean_cty=mean(cty)) %>% arrange(desc(mean_cty))
#filter(manufacturer %in% c('audi', 'toyota'))

# 3
#3사 평균비교
manu_hwy <- mpg %>% group_by(manufacturer) %>% filter(manufacturer=="chevrolet"|manufacturer=="ford"|manufacturer=="honda") %>% summarise(mean_hwy=mean(hwy)) %>% arrange(desc(mean_hwy))
manu_hwy
#전체평균
manu_hwy %>% summarise(mean=mean(mean_hwy))


## 문제19
# 1
(cty_class <- mpg %>% select(class, cty))
cty_class %>% head()

# 2
cty_class %>% filter(class=="suv"|class=="compact") %>% group_by(class) %>% summarise(mean_cty=mean(cty)) %>% arrange(desc(mean_cty))


## 문제20
# 1
mpg %>% filter(manufacturer=="audi") %>% arrange(desc(hwy)) %>% head(5)
