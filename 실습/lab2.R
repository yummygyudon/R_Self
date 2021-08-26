#문제1
v1<-sample(1:30,10,replace = T)
v2<-paste(letters[26:17],v1,sep = ':')
v1 ; v2

#원소마다 이름이 붙어있는 Vector : 네임벡터(NameVector)
#v1<-sample(1:30,10,replace = T)
#names(v1) <- letters[26:17]
#v2 <- names(v1)
#v1 ; v2

---------------
#문제2
v<-seq(10,38,2)
m1 <- matrix(v,3,5,byrow = T);m1
m2 <- m1+100;m2
m_max_v <- max(m1);m_max_v
m_min_v <- min(m1);m_min_v
row_max <- apply(m1,1,max);row_max
col_max <- apply(m1,2,max);col_max

---------------
#문제3
#n1 <- c(1,2,3)
#n2 <- c(4,5,6)
#n3 <- c(7,8,9)
#m2 <- cbind(n1,n2,n3) ;m2
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
n <- c(n1,n2,n3)
m2 <- matrix(n,3,3);m2 
#m2 <- matrix(c(n1,n2,n3),3,3)

---------------
#문제4
m3 <- matrix(1:9,3,3,byrow = T);m3   
  
---------------
#문제5
colnames(m3) <- c('col1', 'col2', 'col3')
rownames(m3) <- c('row1', 'row2', 'row3')
m4 <- m3 ;m4
  
---------------
#문제6
alpha <- matrix(letters[1:6],2,3) ;alpha 
alpha2 <- rbind(alpha,c('x', 'y', 'z'));alpha2 
alpha3 <- cbind(alpha,c('s','p'));alpha3
  
---------------
#문제7
a <- array(1:24,dim=c(2,3,4))
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
(a+100)
(a[,,4]*100)
(a[1,2,])
(a[1,3,])
#a[1,2:3,]
a[2,,2] <- a[2,,2]+100 ;a
a[,,1] <- a[,,1]-2 ;a
a <- a*100 ;a
rm(a)
a
---------------
  