#getwd() : 현재 프로젝트 디렉토리 조회
#setwd() : 해당 디렉토리 위치 옮겨가기

#문제 6
nums <- scan("data/iotest1.txt")
cat("오름차순 : ",sort(nums),"\n","내림차순 : ",sort(nums, decreasing = T),"\n","합 : ",sum(nums),"\n","평균 : ",mean(nums))
#cat("오름차순 : ",sort(nums),"\n")
#cat("내림차순 : ",sort(nums, decreasing = T),"\n")
#cat("합 : ",sum(nums),"\n")
#cat("평균 : ",mean(nums),"\n")