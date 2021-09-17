setwd("C:/Users/duck9/OneDrive/바탕 화면/R(Doit_Self)/실습/review")

#문제 1
exam1 <- function(){
  return(paste0(LETTERS,letters))
}
exam1()

#문제 2
exam2 <- function(num){
  return(sum(1:num))
}
cat("함수 호출 결과 :",exam2(10))

#문제 3
exam3 <- function(num1, num2){
  return(abs(num1-num2))
}
# print() 함수는 cat과 달리 어떠한 수행 명령의 결과값을 출력하는 함수 
print(paste("함수 호출 결과 :",exam3(10,18)))

#문제 4
exam4 <- function(n1,op,n2){
  if(op %in% c("+", "-", "*", "%/%", "%%")){
    if(op == "%/%" || op == "%%"){
      if(n1 == 0){
        return("오류1")
      }else if(n2 == 0){
        return("오류2")
      }else{
        return(switch(EXPR = op, "%/%" = n1%/%n2, "%%" = n1%%n2))
      }
    }else{
      return(switch(EXPR = op, "+" = n1+n2,"-" = n1-n2,"*" = n1*n2)) # SWITCH()함수의 중요성
    }
  }else{
  return("규격의 연산자만 전달하세요")
  }
}
exam4(10,"+",5)
exam4(10,"-",5)
exam4(10,"*",5)
exam4(10,"%/%",5)
exam4(10,"%%",5)
exam4(0,"%%",0)
exam4(5,"%%",0)
exam4(10,"$",5)

#문제 5
# return() <- 이렇게 아무 return 값을 지정하지 않으면 NULL 출력
exam5 <- function(rep, char = "#"){
  if(rep>0){
    for(i in 1:rep){
      cat(char,sep = " ")
    }
  }
  return()
}

exam5(0)
exam5(3,"%")

#문제 6
#NA에러 처리를 가장 먼저 설계
exam6 <- function(scores){
  for (score in scores){
    if (is.na(score)){
      cat("NA는 처리불가\n")
    }else if (score >=85){
      cat(score, "점은 상등급입니다.\n")
    }else if (score >=70){
      cat(score, "점은 중등급입니다.\n")
    }else{
      cat(score, "점은 하등급입니다.\n")
    }
  }
  return()
}
exam6(c(90, 100, 61, 84, 94, 70))