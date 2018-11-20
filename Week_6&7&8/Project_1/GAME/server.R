rsconnect::setAccountInfo(name='perilium', token='B4B46DB01C91FFF14469639DA621E961', secret='+vPFOvxSyTyBTCYtonfAmLIF8Fs9Kb7SGApXSfl8')
options(encoding = "UTF-8")
library(shiny)
library(datasets)
library(rvest)
library(dplyr)
library(plotly)
library(DT)


ran = read.csv("RATE.csv",stringsAsFactors=FALSE)
rank= ran
rank$rankpoint = 21-rank$Rank
rate = read.csv("feature_rate.csv",stringsAsFactors=FALSE,header = T)
radar = read.csv("feature_radar.csv",stringsAsFactors=FALSE,header = T)

rank.an = rank
rank.an = rank.an %>%  
  group_by(Type) %>%
  summarise(no_rows = length(Type))

cou = c()
for(i in c(1:20)){
  for(j in rate[[2*i-1]]){
    cou = c(cou,j)
  }
}

cou= as.factor(cou)

cou = data.frame(cou,c(1:100))

cu = cou %>%  
  group_by(cou) %>%
  summarise(freq = length(cou))
cu = arrange(cu, desc(freq))

shinyServer(function(input, output) {
  
 
  output$intro <- renderText("This analysis is based on the ranking of 20 games that have the highest ranking of all PC games on Bahamut Forum.")
  
  
    output$catPlot <- renderPlotly({

     plot_ly(rank.an, labels = ~Type ,values = ~no_rows, type = 'pie')%>%
       layout(title = 'Type percentage',
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

   })
   
   
   
   
   output$timePlot <- renderPlotly({
     
     plot_ly(rank, x= ~Date ,y= ~rankpoint, type = 'scatter',mode="markers",text = ~paste('Name: ', Name))
     
   })
   
   output$elePlot <- renderPlotly({
     
     plot_ly(cu, labels = ~cou,values = ~freq, type = 'pie') %>%
       layout(title = 'feature percentage',
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
     
   })
   
   output$radarPlot <- renderPlotly({
     alpha = input$GN
a <- case_when(
       alpha == "Hollow Knight"~1 ,
       alpha == "Undertale"~2,
       alpha == "Minecraft"~3,
       alpha == "The Elder Scrolls V: Skyrim"~ 4,
       alpha == "The Legend of Heroes: Trails of Blue Flame"~ 5,
       alpha == "The Witcher 3: Wild Hunt"~ 6,
       alpha == "Little Busters!"~7,
       alpha == "CLANNAD"~ 8,
       alpha == "Ori and the Blind Forest"~9,
       alpha == "Stardew Valley"~10,
       alpha == "Ever17 -the out of infinity-"~11,
       alpha == "Fantasy Poem"~12,
       alpha == "Witch on the Holy Night"~13,
       alpha == "RPG Maker MV"~14,
       alpha == "The Legend of Heroes 6: Sora No Kiseki Special Edition"~15,
       alpha == "Slime Rancher"~16,
       alpha == "Hearts of Iron IV"~17,
       alpha == "Stellaris"~18,
       alpha == "Grand Theft Auto 5"~19,
       alpha == "The Legend of Heroes: Zero No Kiseki"~20
     )
    plot_ly(type = 'scatterpolar',r = radar[[2*a]],theta = radar[[2*a-1]],fill = 'toself') %>%
  layout(title = input$GN,polar = list(radialaxis = list(visible = T,range = c(0,100))),showlegend = F)
     
   })
   
   output$mytable = DT::renderDataTable({
     ran
   }) 
   output$radex <- renderText("The area doesn't represent the popularity of a game.\n
                              If the area is big, it means lots of players like it because of the same feature.\n
                              On the other hand,the area is small when people like it because of different reason.")
   
})

