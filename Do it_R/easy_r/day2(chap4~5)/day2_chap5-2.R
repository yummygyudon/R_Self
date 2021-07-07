df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw

install.packages("dplyr")
library(dplyr)

df_new <- df_raw

df_new <- rename(df_new, v2 = var2)
df_new
mpg_new <-data.frame(mpg)
mpg_new
mpg_new <- data.frame(mpg)
mpg<-as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new <- rename(mpg_new, city = cty)
mpg_new <- rename(mpg_new, highway = hwy)
