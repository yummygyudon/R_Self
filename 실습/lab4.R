#문제1
L1 <- list(
  name = "scott",
  sal = 3000)
L1
result1 <- unlist(L1$sal)*2 ;result1

#문제2
L2 <- list("scott",c(100,200,300)) ;L2

#문제3
L3 <- list(c(3,5,7), c("A", "B", "C"))
L3[[2]][[1]] <-"Alpha" ;L3
           
#문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5)) ;L4
L4$alpha <- L4$alpha +10 ; L4

#문제5
L5 <- list(
  data1 = LETTERS,
  data2 = head(emp,n=3),
  data3 = L4
)
L5
L5[[1]][[1]]
L5$data2$ename
L5[[3]][[3]]

#문제6
L6 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
mean(c(unlist(L6$math),unlist(L6$writing),unlist(L6$reading)))

