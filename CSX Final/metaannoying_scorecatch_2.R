library(rvest)


Fy = read.csv("steam_2016.csv",stringsAsFactors = F)

Fy$Games = tolower(Fy$Games)
fyname<-Fy$Games

fyname<-as.data.frame(fyname)
##
chart = data.frame(c("Name","CriticRate","CriticNum","UserRate","UserNum"))
no<-c()
##抓資料主程式
#for(i in Fy$Game[目前的筆數:總數量])
nocur<-i
for(i in Fy$Game[1501:6972]){
  
  cur = read_html(paste("https://www.metacritic.com/game/pc/",i,sep=""))
  Name = cur %>%html_nodes("h1")%>%html_text()
  Critic = cur %>%html_nodes(".positive span ,.mixed span,.negative span")%>%html_text()
  if(length(Critic)==0)Critic = c("NA")
  CriNum = cur %>%html_nodes(".count a span")%>%html_text()
  User = cur %>%html_nodes(".feature_userscore a")%>%html_text()
  if(length(User)==0)User = c("NA","0")
  else if(User == "\ntbd\n    ") User = c("NA","0")
  
  cur_sta = c(Name,Critic,CriNum,User)
  chart = data.frame(chart,cur_sta)
  Sys.sleep(0.5)
}

for(t in Fy$Games[1501:4614]){
  tryCatch({
    cur = read_html(paste("https://www.metacritic.com/game/pc/",t,sep=""))
    Name = cur %>%html_nodes("h1")%>%html_text()
    Critic = cur %>%html_nodes(".positive span ,.mixed span,.negative span")%>%html_text()
    if(length(Critic)==0)Critic = c("NA")
    CriNum = cur %>%html_nodes(".count a span")%>%html_text()
    User = cur %>%html_nodes(".feature_userscore a")%>%html_text()
    if(length(User)==0)User = c("NA","0")
    else if(User == "\ntbd\n    ") User = c("NA","0")
    
    cur_sta = c(Name,Critic,CriNum,User)
    chart = data.frame(chart,cur_sta)
  },
    error =function(err){
      count = 1
      print(t)
  }
  )
  
  if(count == 1){
    cur_sta = c("XXZ: STRIP CLUB","NA","0","NA","0")
    chart = data.frame(chart,cur_sta)
    
  }
  Sys.sleep(0.25)
}

nocur<- "vr-super-sports"
no = c(no, nocur)
##手動：沒有評論
cur_sta = c("XXZ: STRIP CLUB","NA","0","NA","0")
chart = data.frame(chart,cur_sta)

cur_sta = c("
JUST CAUSE 3","74","50","5.5","644 Ratings")
chart = data.frame(chart,cur_sta)

##手動：非遊戲
cur_sta = c("live-wallpaper-master","X","X","X","X")
chart = data.frame(chart,cur_sta)

##抓完後轉置&儲存
tchart = t(chart)
write.csv(tchart,"2016rate.csv")
