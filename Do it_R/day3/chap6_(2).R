test1 <- data.frame(id = c(1, 3, 2, 5, 4),
                    midterm = c(30, 90, 85, 75, 50))
test2 <- data.frame(id = c(3, 1, 2, 4, 5),
                    final = c(20, 50, 75, 45, 90))

total <- left_join(test1, test2, by = "id")
total

exam
f1 = c("c", "d", "e", "p", "r")
typeof(f1)
typeof(ggplot2::mpg::"manufaturer")

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
left_join(mpg, fuel, by="fl")

mpg %>%
  select(model, fl, price_fl)%>%
  head(5)

midwest_new <- as.data.frame(ggplot2::midwest)
midwest_new %>% 
  mutate(under = (poptotal - popadults) / poptotal * 100) %>%
  arrange(desc(under)) %>%
  select(county, under) %>%
  head(5)

midwest_new
library(dplyr)
library(ggplot2)
midwest_new %>%
  mutate(asian_ratio = popasian / poptotal *100) %>%
  arrange(asian_ratio) %>%
  select(state, county, asian_ratio) %>%
  head(10)
