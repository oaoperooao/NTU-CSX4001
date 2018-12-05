library(rvest)
library(jsonlite)
library(tm)
library(date)
library(plotly)
#####################################
alldoc =data.frame(name=c(),cri.rate=c(),user.rate=c(),date=c(),content=c())

for(i in c(0:3)){
  URL=paste("https://www.metacritic.com/browse/games/score/metascore/year/pc/filtered?view=detailed&sort=desc&year_selected=2015&page=",i,sep="")
  raw = read_html(URL)
  name = raw %>% html_nodes("#main h3") %>% html_text(raw)
  cri.rate = raw %>% html_nodes(".clamp-metascore .positive,.clamp-metascore .mixed,.clamp-metascore .negative") %>% html_text(raw)
  user.rate = raw %>% html_nodes(".user") %>% html_text(raw)
  cri.rate = as.integer(cri.rate)
  user.rate = as.double(user.rate)  
  content = raw %>% html_nodes(".summary") %>% html_text(raw)
  date = raw %>% html_nodes("#main .label+ span") %>% html_text(raw)
  date = as.date(date)
  date = strftime(date,format="%m")
  docs = data.frame(name,cri.rate,user.rate,date,content)
  alldoc = rbind(alldoc,docs)
}

write.csv(alldoc,"2015.csv")
######################################

all =data.frame(name=c(),cri.rate=c(),user.rate=c(),date=c(),content=c(),year=c())

dat = read.csv("2017.csv")
dat$year = "2017"

all = rbind(all,dat)

write.csv(all,"threeyears.csv")
plot_ly(all,x=~date,type="histogram")

plot_ly(all,x=~cri.rate,y=~user.rate,type = "scatter",text = ~paste('遊戲名稱: ', name),color =~year)


cordoc = Corpus(VectorSource(all))


cordoc <- tm_map(cordoc, removePunctuation)
cordoc <- tm_map(cordoc, removeNumbers)
cordoc <- tm_map(cordoc, content_transformer(tolower))
cordoc <- tm_map(cordoc, removeWords,stopwords::stopwords(language = "en",source = "snowball"))
cordocPTD <- tm_map(cordoc, PlainTextDocument)


