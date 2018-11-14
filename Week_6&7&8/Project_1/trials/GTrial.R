library(rvest)
library(tidytext)
library(tm)
library(plotly)
library(dplyr)

AND = read.csv("AND.csv")
IOS = read.csv("IOS.csv")





.wikiContent , .ACG-persent span
#list = data.frame(list, 
#list$today=as.character(list$today)

list.pre = arrange(list, desc(today))
list.pre

plot_ly(list.pre, y = ~today,x = ~Name,type = "scatter")
colnames(list.pre)<- c("名稱",today) 
list.pre

