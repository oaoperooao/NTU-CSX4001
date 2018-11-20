#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(dplyr)
rate = read.csv("RATE.csv",stringsAsFactors=FALSE)

# Define UI for application that draws a histogram
shinyUI(
  
  navbarPage("CSX4001_Gamer",  
             tabPanel("特色分析",
                      pageWithSidebar(
                        headerPanel('各遊戲特色分析'),
                        sidebarPanel(
                          selectInput('xcol', 'Name:', rate$Name)

                          
                        ),
                        mainPanel(
                          textOutput("radarPlot")
                        )
                      )
            )
  )
)