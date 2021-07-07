df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df
df$var_sum <- df$var1 + df$var2
df
df$var_mean <- df$var_sum/2
df

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mpg$mean <- mpg$total /2
head(mpg)
mean(mpg$total)
summary(mpg$total)
hist(mpg$total)
mpg$test <- ifelse(mpg$total >=20, "pass", "fail")
head(mpg)
table(mpg$test)
hist(mpg$test)
qplot(mpg$test)

mpg$grade <- ifelse(mpg$total >=30, "A",
                    ifelse(mpg$total >=20, "B", "C"))
head(mpg, 20)

table(mpg$grade)
qplot(mpg$grade)

########################################################
########################################################

midwest <- as.data.frame(ggplot2::midwest)
summary(midwest)
midwest
table(midwest)
dim(midwest)
midwest <- rename(midwest, popasian = asian)
str(midwest)
View(midwest)
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)

midwest$ratio <- (midwest$asian / midwest$total)*100
hist(midwest$ratio)

mean(midwest$ratio)

midwest$group <- ifelse(midwest$ratio > mean(midwest$ratio), "large", "small")
qplot(midwest$group)
