#벡터 생성
v1 <- c(1,2,3,4,5,6,7,8,9)
v3 <- c(1,2,3,"a")
?matrix
matrix(v1)
matrix(v1, nrow=2)
matrix(data=v1, ncol=4)
matrix(data=v1, nrow=3, ncol=2)
matrix(data=v1, nrow=3, ncol=3)
matrix(data=v1, nrow=3, ncol=3, byrow=T)

m1 <- matrix(data=v1, nrow=3, ncol=3, byrow=T)

row.names(m1) <- c("row1", "row2", "row3")
m1

colnames(m1) <- c("col1", "col2", "col3")
m1

m1+100

row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)

v2 <- c("a","b","c","d","e","f")
m2 <- matrix(v2, nrow = 2, ncol = 3)
m2 <- rbind(m1, c("x", "y", "z"))
m2 <- cbind(m2, c("s", "p","q"))
# 이름까지
m2 <- cbind(m2, col3 = c("s", "p","q","u"))

#배열형성
?array
a1 <- array(seq(1:24), dim = c(2,3,4))
a2 <- array(seq(1:24), dim = c(2,3,5))

a1[1,,]
a1[,1,]
a1[,,1]
a1[1,c(2,3),]
