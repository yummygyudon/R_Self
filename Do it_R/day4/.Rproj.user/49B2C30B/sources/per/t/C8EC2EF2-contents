df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
is.na(df)

df_nomiss <- df %>% filter(!is.na(sex) & !is.na(score))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

library(readxl)
exam <- read_excel("C:/JDG(SelfStudy)/Do it_R/easy_r/day2(chap4~5)/excel_exam.xlsx")
exam[c(3, 8, 15), "math"] <- NA
exam
exam %>% mutate(mean.math = mean(math, na.rm = T))
exam$math <- ifelse(is.na(exam$math), mean(exam$math,na.rm = T ), exam$math)
exam
mean(exam$math)

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA
table(is.na(mpg$hwy))
table(is.na(mpg$drv))

mpg %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy))


boxplot(mpg$hwy)  
boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy < 12| mpg$hwy >37, NA, mpg$hwy)
table(is.na(mpg$hwy))


mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "sty"] <- c(3, 4, 39, 42)

#178pg 혼자서 해보기
#Q1

table(!is.na(mpg$drv))
table(is.na(mpg$hwy))
table(mpg$drv)

mpg$drv <- ifelse(mpg$drv == "k", NA, mpg$drv)
table(is.na(mpg$drv))
table(mpg$drv)

#Q2
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

#Q3
mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(cty_mean = mean(cty))
