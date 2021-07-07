exam <- read.csv("csv_exam.csv")
exam
head(exam)
head(exam,10)
View(exam)
dim(exam)
str(exam)
summary(exam)

library(ggplot2)
mpg<-as.data.frame(ggplot2::mpg)
head(mpg)

tail(mpg)
summary(mpg)
summary(hwy)
