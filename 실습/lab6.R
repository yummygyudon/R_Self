#문제 1
exam1 <- function(){
  return(paste0(LETTERS,letters))
}
exam1()

#문제 2
exam2 <- function(a){
  sum <- 0
  for (i in 1:a){
    sum <- sum + i
  }
  return(sum)
}
cat("함수 호출 결과 : ",exam2(10))

#문제 3
exam3 <- function(a, b){
  dff <- abs(a-b)
  return(dff)
}
print(paste("함수 호출 결과 : ",exam3(9,4)))
print(paste("함수 호출 결과 : ",exam3(10,20)))
print(paste("함수 호출 결과 : ",exam3(20,5)))
print(paste("함수 호출 결과 : ",exam3(5,30)))
print(paste("함수 호출 결과 : ",exam3(6,3)))
print(paste("함수 호출 결과 : ",exam3(3,3)))

#문제 4
# 다중 선택 %in% 의 중요성
exam4 <- function(n,op,m){
  if (op %in% c("+","-","*","%/%","%%")){
    if(op == "%/%" || op == "%%"){
      if(n == 0){
        return("오류1")
      }else if (m == 0){
        return("오류2")
      }else{
        return(switch(EXPR = op, "%/%" = n%/%m, "%%" = m%%m))
      }
    }else{
      return(switch(EXPR = op, "+" = n+m,"-" = n-m,"*" = n*m))
    }
  }else{
    return("규격의 연산자만 전달하세요")
  }
}
exam4(10,"/",5)



#문제 5
exam5 <- function(n, char="#"){
  if (n>0){
    for (i in 1:n){
      cat(char,sep = '')
    }
  }
  return()
}
exam5(3)
exam5(-3)
exam5(5,"@")


#문제 6
#NA에러 처리를 가장 먼저 설계
exam6 <- function(vec){
  for (i in vec){
    if (is.na(i)){
      cat("NA는 처리불가\n")
    }else if (i >=85){
      cat(i, "점은 상등급입니다.\n")
    }else if (i >=70){
      cat(i, "점은 중등급입니다.\n")
    }else{
      cat(i, "점은 하등급입니다.\n")
    }
  }
  return()
}
exam6(c(90, 100, 61, 84, 94, 70))
