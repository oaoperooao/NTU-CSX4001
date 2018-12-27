library(rvest)

Fy = read.csv("steam_2015.csv",stringsAsFactors = F)

Fy$Game = tolower(Fy$Game)
no15= c()

##抓資料主程式
#for(i in Fy$Game[目前的筆數:總數量])
for(i15 in Fy$Game[962:2680]){
  tryCatch({
    
    cur15 = read_html(paste("https://www.metacritic.com/game/pc/",i15,sep=""))
    Name = cur15 %>%html_nodes("h1")%>%html_text()
    Critic = cur15 %>%html_nodes(".positive span ,.mixed span,.negative span")%>%html_text()
    if(length(Critic)==0)Critic = c("NA")
    CriNum = cur15 %>%html_nodes(".count a span")%>%html_text()
    User = cur15 %>%html_nodes(".feature_userscore a")%>%html_text()
    if(length(User)==0)User = c("NA","0")
    else if(User == "\ntbd\n    ") User = c("NA","0")
  
    cur15_sta = c(Name,Critic,CriNum,User)
  
    chart15 = data.frame(chart15,cur15_sta)
  },
  error =function(err){
    no15 = c(no15,i15)
    print(i15)
    
  }
  )
  Sys.sleep(0.25)
}



##手動：沒有評論
cur15_sta = c("7,62 Hard Life","NA","0","NA","0")
chart15 = data.frame(chart15,cur15_sta)

##手動：非遊戲
cur15_sta = c("Borderless Gaming","X","X","X","X")
chart15 = data.frame(chart15,cur15_sta)

##抓完後轉置&儲存
tchart15 = t(chart15)
write.csv(tchart15,"2015rate.csv")


##
chart15 = data.frame(c("Name","CriticRate","CriticNum","UserRate","UserNum"))
