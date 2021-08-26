#data_processing1
v <- sample(1:26,10)
sapply(v,function(a)LETTERS[a])


#case2
v<-sample(1:26,10)
convert <- function(x){
  char <- LETTERS[x]
  return(char)
}
sapply(x, convert)