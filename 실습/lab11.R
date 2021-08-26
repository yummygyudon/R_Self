library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")

remDr$open()
url<-"https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700"
remDr$navigate(url)

point <- NULL ; category <- NULL ; comment <- NULL



review_comment <- NULL
review <- NULL


for(i in 1: 10){
  p_point <- remDr$findElements(using = "css selector", "div.story-point")
  v_point <- sapply(p_point, function(x){x$getElementText()})
  point <- append(point, unlist(v_point))
  Sys.sleep(0.5)
  
  p_category <- remDr$findElements(using = "css selector", "div.story-recommend")
  v_category <- sapply(p_category, function(x){x$getElementText()})
  category <- append(category, unlist(v_category))
  Sys.sleep(0.5)
  
  p_comment <- remDr$findElements(using = "css selector", "div.story-txt")
  v_comment <- sapply(p_comment, function(x){x$getElementText()})
  comment <- append(comment, unlist(v_comment))
  Sys.sleep(0.5)
  
  Page_Next_CSS <- paste0("div > div.movie-idv-story > nav > a:nth-child(",i+1,")")
  Next_Page_Link <- remDr$findElement(using = 'css selector', Page_Next_CSS)
  Next_Page_Link$clickElement()
}

length(point)
length(category)
length(comment)


movie_text <- comment
write.table(movie_text, file = "movie.txt",fileEncoding = "UTF-8")

movie <- data.frame(point, category, comment)
View(movie)
write.csv(movie, "movie.csv")
  