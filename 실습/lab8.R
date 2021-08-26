library(rvest)
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
html <- read_html(url)
html
html<-NULL ;text<- NULL; title<-NULL; point<-NULL; review<-NULL; page<-NULL
## 전체 반복 순회 출력 : * 연산자 활용
## 다수의 출력물 : nodes / 단일 출력물 : node
## 속성명 : [속성명=조건 속성값] / 클래스 : 점(.) / 아이디 : #


### <h1>태그 컨텐츠
node <- html_node(html,"h1")
(text <- html_text(node))


### <a>태그 컨텐츠와 href 속성값
nodes <- html_nodes(html,"a")
html_text(nodes)
html_attr(nodes,"href")


### <img>태그의 src 속성값
nodes2 <- html_nodes(html, "img")
html_attr(nodes2, "src")


### 첫번째 <h2>태그의 컨텐츠

html_text(html_nodes(html,"body > h2:nth-child(9)"))#부모로부터 동일 차원 자식 태그들 중
html_text(html_nodes(html,"body > h2:nth-of-type(1)"))#부모로부터 태그 동일 타입 중


### <ul>태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠

nodes3 <- html_nodes(html, "body > ul > li:nth-child(3)")
# html_node(html,"ul > [style$=green]")
html_text(nodes3)


### 두번째 <h2>태그의 컨텐츠
html_text(html_nodes(html,"body > h2:nth-child(11)"))
# html_node(html,"ul > [style$=green]")
# html_node(html,"ul > [style$=green]")


### <ol>태그의 모든 자식 태그들의 컨텐츠
ol_text<-html_text( html_nodes(html, "body ol li"), trim = T)
ol_text
# html_text(html_nodes(html,"ol > li"))
# html_text(html_nodes(html,"ol > *"))


### <table>태그의 모든 자손 태그들의 컨텐츠
nodes4_1<-html_text(html_nodes(html, "table tr.name"),trim=T)
nodes4_2<-html_text(html_nodes(html, "table th"),trim=T)
nodes4_3<-html_text(html_nodes(html, "table tr:nth-child(2)"),trim=T)
nodes4_4<-html_text(html_nodes(html, "table tr:nth-child(2) td"),trim=T)
nodes4_5<-html_text(html_nodes(html, "table tr:nth-child(3)"),trim=T)
nodes4_6<-html_text(html_nodes(html, "table tr:nth-child(3) td"),trim=T)
print(c(nodes4_1, nodes4_2, nodes4_3, nodes4_4, nodes4_5, nodes4_6))
# ★중요★ html_text(html_nodes(html, "table *"))


### name클래스 속성을 갖는 <tr>태그의 컨텐츠
nodes5 <- html_nodes(html, "tr.name")
html_text(nodes5)

### target아이디 속성을 갖는 <td>태그의 컨텐츠
nodes6 <- html_nodes(html, "#target")
html_text(nodes6)
