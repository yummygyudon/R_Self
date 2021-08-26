library(rvest)
library(XML)
library(httr)
url <- "https://comic.naver.com/genre/bestChallenge?&page="

comic.name = NULL
comic.summary = NULL
comic.grade = NULL

for(i in 1: 50) {
  urls <- paste0(url, i)
  page <- read_html(urls)
  comic.name<- append(comic.name,html_text(html_nodes(page,"div.challengeInfo > h6 >a "), trim = T))
  comic.summary<- append(comic.summary,html_text(html_nodes(page,"div.summary "), trim = T))
  comic.grade<- append(comic.grade,html_text(html_nodes(page,"div.rating_type strong "), trim = T))
}
navercomic2 <- data.frame(comic.name, comic.summary, comic.grade)
View(navercomic2)

write.csv(navercomic2, file="navercomic2.csv")

