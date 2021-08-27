install.packages("rvest") 
install.packages("XML")
install.packages("httr")
install.packages("jsonlite")

library(httr)
library(rvest)
library(XML)
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" ,
                      port = 4445, browserName = "chrome")
remDr$open()

gs_site <- "http://gs25.gsretail.com/gscvs/ko/products/event-goods"
remDr$navigate(gs_site)
t_o_link <- remDr$findElement(using='css selector','#TWO_TO_ONE')
t_o_link$clickElement()

goodsprice <- NULL ; goodsname <- NULL
endFlag <- FALSE
#전체 페이지
Cur_page <- 1
CSS <- "div:nth-child(5)  li:nth-child("
P_CSS <-'#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5)'
repeat{
  for (i in 1:8){
    product <- remDr$findElements(using ="css selector",paste0(CSS,i,")"))
    p_name <- remDr$findElements(using ="css selector",paste0(CSS,i,") p.tit"))
    g_name <-sapply(p_name,function(x){x$getElementText()})
    goodsname <- append(goodsname, unlist(g_name))
    
    p_price <- remDr$findElements(using ="css selector",paste0(CSS,i,") p.price"))
    g_price <-sapply(p_price,function(x){ x$getElementText()})
    goodsprice <- append(goodsprice, gsub("[원]|[,]", "",unlist(g_price)))
    Sys.sleep(0.5)
    if (length(product)==0){
      cat("종료\n")
      endFlag <- TRUE
      break
    }
  }
  
  Next_page<- Cur_page+1
  if(endFlag){
    break
  }
  if(Next_page%%10 == 1){
    nextpageLink <-remDr$findElement(using='css selector', paste0(P_CSS,' a.next'))
    nextpageLink$clickElement()
    Sys.sleep(0.5)
    Cur_page<-Next_page-10
  }else{
  Cur_page<-Next_page
  nextCss <- paste0(P_CSS," span > a:nth-child(",Next_page,")")  
  nextListLink<-remDr$findElement(using='css selector',nextCss)
  nextListLink$clickElement()
  Sys.sleep(0.5)
  }
}

gs_twotoone <- data.frame(goodsname, goodsprice)
View(gs_twotoone)
write.csv(gs_twotoone, "gs25_twotoone.csv")

