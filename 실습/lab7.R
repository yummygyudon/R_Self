#문제1
countEvenOdd <- function(...){
  num <- c(...)
  if (is.vector(num)){
    count_even <- 0;
    count_odd <- 0;
    for (i in num){
      if (i %% 2 == 0){
        cat(i," : even\n");
        count_even <- count_even+1;
      }else{
        cat(i," : odd\n");
        count_odd <- count_odd+1;
      }
    }
    return(list(count_even, count_odd))
  }else{
    return()
  }
}
countEvenOdd(1,2,3,4,5,6)
countEvenOdd()

#countEvenOdd <- function(x){
#  even <-0
#  odd <-0
#  if (is.vector(x) && !is.list(x) && is.numeric(x)) {
#    for (i in x){
#      if (i %% 2 == 0){
#        even <- even+1;
#      }else{
#        odd <- odd+1;
#      }
#    }
#    return(list(even=even, odd=odd))
#  }else{
#    return()
#  }
#}



#문제2
vmSum <- function(...){
  num <- c(...);
  if (!is.vector(num)){
    return("벡터만 전달하숑!")
  }else if(!is.numeric(num)){
    print("숫자 벡터만 전달하숑!")
    return(0)
  }else{
    return(sum(num))
  }
}

#!is.vector 와 함께 is.list()도 같이
#if에 is.vector , !is.list , is.numeriic 하고 sum(num) 해도됨
#is.list(x) 로 "벡터만 전달하숑!"

vmSum()
vmSum(1,2,3,4,5,6)
vmSum(1,2,3,4,"가")



#문제3
vmSum2 <- function(...){
  num <- c(...);
  if (!is.vector(num)){
    stop("벡터만 전달하숑!")
  }else if(!is.numeric(num)){
    warning("숫자 벡터만 전달하숑!")
    return(0)
  }else{
    return(sum(num))
  }
}
vmSum2()
vmSum2(1,2,3,4,5,6)
vmSum2(1,2,3,4,"가")



#문제4
mySum <- function(...){
  num <- c(...)
  if (is.null(num)){
    return()
  }else{
    if (!is.vector(num) || is.list(num)){
    stop("벡터만 처리 가능!!")
  }else if (any(is.na(num))){
    num[which(is.na(num))] <- num[which.min(num)];
    warning("NA를 최저값으로 변경하여 처리함!!");
    evenSum <- 0;
    oddSum <- 0;
    for (i in 1:length(num)){
      if (i %% 2 == 0){
        evenSum <- evenSum+num[i];
      }else{
        oddSum <- oddSum+num[i];
      }
    }
    return(list(evenSum,oddSum))
  }else{
    evenSum <- 0
    oddSum <- 0
    for (i in 1:length(num)){
      if (i %% 2 == 0){
        evenSum <- evenSum+num[i];
      }else{
        oddSum <- oddSum+num[i];
      }
    }
    return(list(evenSum,oddSum))
  }
  }
}
#min(num, na.rm=T) 방식도 가능_na는 제거한 후, 함수적용하라는 명령

mySum(1,2,3,4,5,6)
mySum()
mySum(1,2,3,4,5,NA)
mySum(list(1,2,3,4,5,6))
mySum(iris)



#문제5
myExpr <- function(func){
  if (!is.function(func)){
    stop("수행 안할꺼임!!")
  }else{
    num <- sample(1:45,6);
    print(num)
    result <- func(num);
    return(result)
  }
}
myExpr(mean)



#문제6
createVector1 <- function(...){
  arg <- c(...)
  if (is.null(arg)){
    return()
  }else if (any(is.na(arg))){
    return(NA)
  }else {
    return(arg)
  }
}

# !length(arg) 나 length(arg) == 0 으로 0은 False가 되는 성질 활용 가능
createVector1(1,2,3,4)
createVector1('가','나','다','라')
createVector1(1,2,3,'가')
createVector1(1,2,3,4,NA)
createVector1()


#문제7
#정답1 
createVector2 <- function(...){
  arg <- list(...)
  if (is.null(arg)){
    return()
  }else{
    num <- c(); cha <- c(); log <- c();undefined <- c();
    for (value in arg){
      if (is.numeric(value)){
        num <- c(num, value)
      }else if (is.character(value)){
        cha <- c(cha, value)
      }else if (is.logical(value)){
        log <- c(log, value)
      }else{
        undefined <- c(undefined, value)
      }
    }
    result <- list(num, cha, log, undefined)
    return(result)
  }
}

#정답2
createVector2 <- function(...){
  lst<-list(...)
  num <- c(); char <- c(); log <- c()
  if(is.null(lst)){
    return()
  }else{
    for (i in lst){
      if (is.numeric(i)){
        num[length(num)+1] <- i
      }else if (is.character(i)){
        char[length(char)+1] <- i
      }else {
        log[length(log)+1] <- i
      }
    }
    return(list(num, char, log))
  }
}
#R에서는 index가 1부터 시작인 것 주의!  
#c(...)가 아닌 list(...)로 선언해야함.
#append() 사용 가능
  
createVector2(1,2,3,4)
createVector2('가','나','다','라')
createVector2(1,2,3,'가')
createVector2(1,2,3,4,NA)
createVector2()
createVector2(1,2,3,'가','나',TRUE,FALSE)

