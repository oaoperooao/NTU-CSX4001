rsconnect::setAccountInfo(name='perilium', token='B4B46DB01C91FFF14469639DA621E961', secret='+vPFOvxSyTyBTCYtonfAmLIF8Fs9Kb7SGApXSfl8')

library(shiny)
library(DT)
rate = read.csv("RATE.csv",stringsAsFactors=FALSE)


shinyServer(function(input, output) {
   
  output$intro <- renderText("meow")
  
  output$mytable = DT::renderDataTable({
    rate
  })
  output$catPlot <- renderPlotly({
    plot_ly(rank.an, labels = ~Type ,values = ~no_rows, type = 'pie')%>%
      layout(title = 'Type percentage',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    
  })
})
