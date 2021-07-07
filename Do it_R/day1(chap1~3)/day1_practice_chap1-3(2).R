a <- 1
a
var <- c(1, 2, 5, 7, 8)
var
var2 <- c(1:5)
var
var2
var3 <-seq(1,5)
var3

install.packages("ggplot2")
library(ggplot2)
remove.packages('ggplot2')
library('ggplot2')
x <- c("a", "b", "c", "d", "e")
x
qplot(x)
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = drv)
qplot(data = mpg, x = drv, y = hwy, geom = "line")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)
