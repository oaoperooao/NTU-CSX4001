rsconnect::setAccountInfo(name='perilium', token='B4B46DB01C91FFF14469639DA621E961', secret='+vPFOvxSyTyBTCYtonfAmLIF8Fs9Kb7SGApXSfl8')

library(shiny)
library(plotly)
library(DT)
library(dplyr)
rate = read.csv("RATE.csv",stringsAsFactors=FALSE)


shinyServer(function(input, output) {

  output$intro <- renderText("meow")
  
  output$mytable = DT::renderDataTable({
    rate
  })
  output$catPlot <- renderPlotly({
    plot_ly(rank.an, labels = ~Type ,values = ~no_rows, type = 'pie') %>%layout(title = 'Type percentage',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    
  })
  output$radarPlot <- renderText({
      i = case_when(
        input$xcol == "Hollow Knight"~"1",
        input$xcol == "Undertale"~"2",
        input$xcol == "Minecraft"~"3",
        input$xcol == "The Elder Scrolls V: Skyrim"~"4",
        input$xcol == "The Legend of Heroes: Trails of Blue Flame"~"5",
        input$xcol == "The Witcher 3: Wild Hunt"~"6",
        input$xcol == "Little Busters!"~"7",
        input$xcol == "CLANNAD"~"8",
        input$xcol == "Ori and the Blind Forest"~"9",
        input$xcol == "Stardew Valley"~"10",
        input$xcol == "Ever17 -the out of infinity-"~"11",
        input$xcol == "Fantasy Poem"~"12",
        input$xcol == "Witch on the Holy Night"~"13",
        input$xcol == "RPG Maker MV"~"14",
        input$xcol == "The Legend of Heroes 6: Sora No Kiseki Special Edition"~"15",
        input$xcol == "Slime Rancher"~"16",
        input$xcol == "Hearts of Iron IV"~"17",
        input$xcol == "Stellaris"~"18",
        input$xcol == "Grand Theft Auto 5"~"19",
        input$xcol == "The Legend of Heroes: Zero No Kiseki"~"20"
      )
    print(i)
  })
})
