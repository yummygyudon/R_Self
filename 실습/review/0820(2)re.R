#문제 1
countEvenOdd <- function(...){
  v <- c(...)
  if(is.vector(v)){
    even <- 0
    odd <- 0
    for (i in v){
      if (i %% 2 == 0){
        cat(i," : even\n");
        even <- even+1;
      }else{
        cat(i," : odd\n");
        odd <- odd+1;
      }
    }
    return(list(even, odd))
  }else{
    return()
  }
}
countEvenOdd()
ls <- list(1,2,3,4)
countEvenOdd(ls)

vmSum <- function(...){
  
}