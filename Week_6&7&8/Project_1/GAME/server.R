rsconnect::setAccountInfo(name='perilium', token='B4B46DB01C91FFF14469639DA621E961', secret='+vPFOvxSyTyBTCYtonfAmLIF8Fs9Kb7SGApXSfl8')
library(shiny)
library(datasets)
library(rvest)
library(dplyr)
library(DT)
setwd("C:/Users/perot/Desktop/NTU-CSX4001/Week_6&7&8(Project_1)/Project_1")




shinyServer(function(input, output) {
  ran = read.csv("RATE.csv",stringsAsFactors=FALSE)
  rank= ran
  rank$point = 21-rank$Rank
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
   output$catPlot <- renderPlotly({

     p <- plot_ly(rank.an, labels = ~Type ,values = ~no_rows, type = 'pie')%>%
       layout(title = 'Type percentage',
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

   })
   
   output$timePlot <- renderPlotly({
     
     p <- plot_ly(rank, x= ~Date ,y= ~rankpoint, type = 'scatter',mode="markers",text = ~paste('Name: ', Name))
     
   })
   
   output$elePlot <- renderPlotly({
     
     p <- plot_ly(cu, labels = ~cou,values = ~freq, type = 'pie') %>%
       layout(title = 'feature percentage',
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
     
   })
   
   output$aTab <- renderDataTable({
     DT::datatable(ran)
   })
   
   
})

