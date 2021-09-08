## chapter 7 연습문제 ##
##1
n <- 12

if (n%%2 ==1){
  type <- "odd"
}else{
  type <- "even"
}

print(type)


##2
n <- 10
n<- -3
res<-ifelse(n<0,-n,n)
print(res)


##3
input <- 1:10
n <- length(input)
switch <- T
#switch <- F

if (switch == T){
  result <- 1
  for (i in input){
    result <- result*i
  }
}else{
  result <- 0
  result <- sum(input)
}
print(result)


##4
num <- 1:20
result <-1
for (i in num){
  if (i%%2 == 1){
    result <- result*i
  }
}
print(result)


##5
num <- 1:20
result <- 1
i <- 1
while(i<=length(num)){
  if (num[i]%%2 == 1){
    result <- result*i
  }else{
    
  }
  i <- i+1
}
print(result)

##6


##7


##8


##9


##10


##11


##12