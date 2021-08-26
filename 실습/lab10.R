library(httr)
library(rvest)
library(XML)
library(rtweet) 

#실습1
query <- URLencode("맛집")
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
P_doc <- htmlParse(doc, encoding = "UTF-8")
text<- xpathSApply(P_doc, "//item/description", xmlValue)
text<- gsub("</?b>", "", text)
text


write.table(text, file = "naverblog.txt" , fileEncoding = "UTF-8", append = F, row.names = F, col.names = F, sep = "\n")


#실습2
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret,
  set_renv = F)

key <- enc2utf8("코로나")
result <- search_tweets(key, n=100, token = twitter_token)
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]","",result$retweet_text)

covid_content <- content[is.na(content)==0]

write.table(covid_content, file = "twitter.txt" , fileEncoding = "UTF-8", append = F, row.names = F, col.names = F, sep = "\n")


#실습3
#예제 17번 참고
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
View(df)
bus.360 <- df[df$busRouteNm == 360,]

cat("[", bus.360$busRouteNm, "번 버스정보 ]\n")
cat("노선ID :", bus.360$busRouteId, "\n")
cat("노선길이 :", bus.360$length, "\n")
cat("기점 :", bus.360$stStationNm, "\n")
cat("종점 :", bus.360$edStationNm, "\n")
cat("배차간격 :", bus.360$term, "\n")



#실습4
#예제 20 참고
library(jsonlite)
library(httr)
searchUrl<- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/json",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

json_data <- content(doc, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data)
text <- data.frame(json_obj)
View(text)
text <- text$items.title
text <- gsub("</?b>", "", text)
text <- gsub("&.+;", "", text)
text
write(text, "output/navernews.txt")
