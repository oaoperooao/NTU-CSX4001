library(ggplot2)

airquality

qplot(x=Ozone,                      
      data=airquality,              
      geom="histogram",             # 圖形=histogram
      main = "Histogram of Ozone",  
      xlab="Ozone(ppb)",            
      binwidth = 25,                # 每25單位為一區隔
      fill= Month                   # 以顏色標註月份，複合式的直方圖
)


qplot(x=Temp,                               
      y=Ozone,                              
      data=airquality,                      
      geom="point",                         # 圖形=scatter plot
      main = "Scatter Plot of Ozone-Temp",  
      xlab="Temp",                          
      ylab="Ozone(ppb)",                    
      color= Month                          # 以顏色標註月份，複合式的散布圖
)

qplot(x=Temp,                             
      data=airquality,                     
      geom="density",        # 圖形=density
      xlab="Temp",                         
      color= Month           # 以顏色標註月份，複合式的機率密度圖
)

qplot(x=Month,                               
      y=Ozone,
      data=airquality,                     
      geom="boxplot",       # 圖形=boxplot
      xlab="Temp",                          
      color= Month          # 以顏色標註月份，複合式的合鬚圖
)


canvas <- ggplot(data=airquality)


canvas +
  # 以直方圖的圖形呈現資料
  geom_histogram(aes(x=Ozone,     # X 放Ozone
                     fill=Month   # 根據月份顯示不同的顏色   
  ) 
  )     


canvas +
  # 以直方圖的圖形呈現資料
  geom_histogram(aes(x=Ozone,
                     fill=Month)  # 以粉紅色填滿         
  ) +
  
  # 用facet()，分別各畫一張各月份的直方圖
  facet_grid(.~Month)   # 因為Month放在右邊，故圖片以水平方向呈現


# 準備畫布
ggplot(data=airquality) +   
  
  # 散布圖對應的函式是geom_point()
  geom_point(aes(x=Temp,  # 用aes()，描繪散布圖內的各種屬性
                 y=Ozone,
                 main="Scatter Plot of Ozone-Temp",
                 color=Month) 
  ) + 
  # 用geom_smooth()加上趨勢線
  geom_smooth(aes(x=Temp,
                  y=Ozone)) +
  
  # 用labs()，進行文字上的標註(Annotation)
  labs(title="Scatter of Temp-Ozone",
       x="Temp",
       y="Ozone") +
  
  # 用theme_bw(background white)，改變主題背景成白色
  # 更多背景設定： http://docs.ggplot2.org/current/ggtheme.html            
  theme_bw()          


ggplot(data=airquality) +   
  
  # 要畫線的話，對應的函式是geom_line()
  geom_line(aes(x=Temp,  
                y=Ozone,
                color=Month) 
  ) +
  
  # 用labs()，進行文字上的標註(Annotation)
  labs(title="Line Plot of Temp-Ozone",
       x="Temp",
       y="Ozone") +
  
  theme_bw()


ggplot(data=airquality) +   
  
  # 散布圖對應的函式是geom_point()
  geom_point(aes(x=Temp,  
                 y=Ozone,
                 main="Scatter Plot of Ozone-Temp",
                 color=Month) 
  ) + 
  # 要畫線的話，對應的函式是geom_line()
  geom_line(aes(x=Temp,  
                y=Ozone,
                color=Month) 
  ) + 
  
  # 用labs()，進行文字上的標註(Annotation)
  labs(title="Combination of Scatter and Line Plots",
       x="Temp",
       y="Ozone") +
  
  theme_bw()


# 自己定義一筆新的資料
df <- data.frame(sex=c("child", "teen", "adult", "old man"),
                 perc=c(21,53,85,8)
)

#準備畫布
ggplot(data=df) +
  
  # 先畫bar plot
  geom_bar(aes(x=factor(1),
               y=perc,
               fill=sex),
           stat = "identity"
  ) +
  
  # 再沿著Y，轉軸成圓餅圖
  coord_polar("y", start=0)

