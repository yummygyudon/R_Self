#library(rvest)
#library(XML)
#library(httr)

news <- read_html("http://media.daum.net/ranking/popular/")

artc_num <- length(html_nodes(news," div.rank_news > ul.list_news2 li"))

title <- NULL
for (i in 1:artc_num){
  title[i] <-html_text(html_nodes(news,paste(" div.rank_news > ul.list_news2 > li:nth-child(", i, ") > div.cont_thumb > strong > a")),trim = T)
}

newstitle <- gsub("[[:punct:]]", "", title)
#gsub('\\"', "", title)


newspapername <- html_text(html_nodes(news,"div.cont_thumb > strong > span"),trim = T)

news_df <- data.frame(newstitle, newspapername)
View(news_df)


setwd("JDG(MultiCampus)/Rexam/")
write.csv(news_df,"output/daumnews.csv")
