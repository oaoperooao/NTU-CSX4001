library(shiny)
library(DT)
# Define UI for miles per gallon application
shinyUI(
  
  navbarPage("CSX4001_Gamer",  
      tabPanel("前言",
        headerPanel("巴哈姆特PC評價排名前20的遊戲分析"),
        textOutput("這是一個宅宅懷抱著遠大的夢想所製出的作品，希望各位喜歡~~\n
                     這次的資料採用了巴哈姆特論壇所統計的遊戲評分排名前20名的遊戲進行分析，\n
                     試著想看看遊戲市場的趨勢以及為何這些遊戲走紅。")
        )
      ,

  
      navbarMenu("總體分析",
          tabPanel("類別分布",
           plotOutput("catPlot")
          ),
          tabPanel("發布時間與評價",
            plotOutput("timePlot")
         ),
          tabPanel("玩家注重的元素",
            plotOutput("elePlot")
        )
          
      ),
  
   
   
   
       tabPanel("個體分析",
    textOutput("這是一個宅宅懷抱著遠大的夢想所製出的作品，希望各位喜歡~~\n
                     這次的資料採用了巴哈姆特論壇所統計的遊戲評分排名前20名的遊戲進行分析，\n
                           試著想看看遊戲市場的趨勢以及為何這些遊戲走紅。")
       )
                
       )
  )
