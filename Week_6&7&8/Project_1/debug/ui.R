#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  
  navbarPage("CSX4001_Gamer",  
             tabPanel("前言",
                      headerPanel("巴哈姆特PC評價排名前20的遊戲分析"),
                      mainPanel(
                        textOutput("intro"))
                      ),
             tabPanel("表格",
                      basicPage(
                        h2("The mtcars data"),
                        DT::dataTableOutput("mytable")
                      )
              ),
             tabPanel("類別分布",
                      basicPage(
                        plotlyOutput("catPlot")
                      )
             )
             
  )
)