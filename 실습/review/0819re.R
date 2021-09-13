grade <- sample(1:6, 1)

alarm <- ifelse(grade%in%c(1,2,3),cat(grade, "학년은 저학년입니다."),cat(grade, "학년은 고학년입니다."))
if (grade < 4){
  cat(grade, "학년은 저학년입니다.")
}else{
  cat(grade, "학년은 고학년입니다.")
}

## 대입식 소괄호로 묶어주면 실행결과 값도 출력

(choice <- sample(1:5,1))
if(choice == 1){
  cat("결과값 : ",300+50)
}else if(choice == 2){
  cat("결과값 : ",300-50)
}else if(choice == 3){
  cat("결과값 : ",300*50)
}else if(choice == 4){
  cat("결과값 : ",300/50)
}else{
  cat("결과값 : ",300%%50)
}

## rep() 함수
#rep([반복할 값], times = [반복횟수])

count <- sample(3:10,1)
deco <- sample(1:3,1)

if(deco == 1){
  rep("*",times=count)
}else if(deco == 2){
  rep("$",times=count)
}else{
  rep("#",times=count)
}


## switch() : 문자열 대조 및 할당(""= 형식) 값 출력
# expr : 명령 줄 유닉스 유틸리티의 하나로, 식을 평가하고 일치하는 값을 출력
# as.character() 로 같은 데이터 형식으로 통일화
score <- sample(0:100,1)
score_head <- as.character(score%/%10)
level <- switch(EXPR = score_head,
                "10"=,"9"="A 등급",
                "8"="B 등급",
                "7"="C 등급",
                "6"="D 등급",
                "F등급")
cat(paste0(score,"점은 ",level,"입니다."))

#
#getwd() : 현재 프로젝트 디렉토리 조회
#setwd() : 해당 디렉토리 위치 옮겨가기