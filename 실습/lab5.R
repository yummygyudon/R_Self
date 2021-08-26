#문제 1
(grade <- sample(1:6,1))
if (grade<4) {
  cat(grade,"학년은 저학년입니다.")
}else{
  cat(grade,"학년은 고학년입니다.")
}

#문제 2
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

#문제 3
(count <- sample(3:10,1))
(deco <- sample(1:3,1))
if(deco == 1){
  rep("*",times=count)
}else if(deco == 2){
  rep("$",times=count)
}else{
  rep("#",times=count)
}
#{for(i in 1:count)...cat()} 로하면 "" 없이


#문제 4
(score <- sample(0:100,1))
(score_head <- as.character(score%/%10))
level <- switch(EXPR = score_head,
                 "10"=,"9"="A 등급",
                "8"="B 등급",
                "7"="C 등급",
                "6"="D 등급",
                "F등급")
cat(score,"점은 ",level,"입니다.")

#문제 5
for(i in 1:length(LETTERS)){
  cat(LETTERS[i],letters[i]," ",sep = "")
}
#(alpha <- paste0(LETTERS, letters))
