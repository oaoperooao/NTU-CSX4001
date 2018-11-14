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
   
   output$mytable = DT::renderDataTable({
     ran
   })  
   
})

