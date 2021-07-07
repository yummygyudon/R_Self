exam <- read_excel("C:/JDG(SelfStudy)/Do it_R/easy_r/day2(chap4~5)/excel_exam.xlsx")

exam %>% arrange(math)
exam
library(dplyr)
exam %>% arrange(desc(math))
exam %>% arrange(class,desc(math, english, science))

audi <- mpg %>% filter(manufacturer == "audi")
audi
audi %>% arrange(desc(hwy))
audi
head(audi%>% arrange(desc(hwy)), 5)

mpg_total <-mpg
mpg_total %>% mutate(total = hwy + cty) >%>
  mutate(total_mean = (hwy + cty)/2) %>%
  arrange(desc(total_mean)) %>%
  head(3)


mpg %>% group_by(class) %>%
        summarise(mean_cty = mean(cty)) %>%
        arrange(desc(mean_cty))

mpg %>% group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

mpg %>% 
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

          