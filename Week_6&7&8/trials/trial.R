library(rvest)
library(tidytext)
library(tm)
library(plotly)
library(dplyr)

raw <- read_html("https://ani.gamer.com.tw/index.php")
rawN <-html_nodes(raw,".newanime-title")%>%html_text(raw)
rawN = rawN[1:21]
rawN
rawT <-html_nodes(raw,".newanime-count")%>%html_text(raw)
for (j in seq(rawN)){
  rawT[[j]] <- gsub("remove_red_eye","", rawT[[j]])
  rawT[[j]] <- gsub(",","", rawT[[j]])
 }
rawT = as.integer(rawT[1:21])
rawT

today <- Sys.Date()
today = format.Date(today)
list<-data.frame(list,today= rawT)
list
write.csv(list,"list.csv",fileEncoding = "UTF-8")




#list = data.frame(list, 
#list$today=as.character(list$today)

list.pre = arrange(list, desc(today))
list.pre

plot_ly(list.pre, y = ~today,x = ~Name,type = "scatter")
colnames(list.pre)<- c("名稱",today) 
list.pre

