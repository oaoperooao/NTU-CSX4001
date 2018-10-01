library(ggplot2)
library(plotly)
#data from https://www.kaggle.com/lava18/google-play-store-apps
mydata = read.csv("googleplaystore.csv")

summary(mydata)

qplot(x=Size,                               
      y=Rating,                              
      data=mydata,                      
      geom="point",                         # 圖形=scatter plot
      main = "Scatter Plot of APPs",  
      xlab="Reviews",                          
      ylab="Rating",                    
      color= Category                          # 以顏色標註月份，複合式的散布圖
      )


#評分分布
my.plot3 <- ggplot(mydata, aes(x = Rating))
my.plot3 <- my.plot3 +
  geom_histogram(binwidth = 0.2, fill = "steelblue")
my.plot3


plot_ly(mydata, x = ~Rating, color = ~Category, type = "box")
