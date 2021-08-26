library(rvest)
library(XML)
library(httr)
url <- "https://comic.naver.com/genre/bestChallenge"
html <- read_html(url)
html

comic.name <- html_text(html_nodes(html,"div.challengeInfo > h6 >a "), trim = T)
comic.summary <-html_text(html_nodes(html,"div.summary "), trim = T)
comic.grade <-html_text(html_nodes(html,"div.rating_type strong"), trim = T)

navercomic1 <- data.frame(comic.name, comic.summary, comic.grade)
View(navercomic1)

write.csv(navercomic1, file = "navercomic1.csv")