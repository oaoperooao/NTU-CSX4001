require(datasets)

#查看airquality的前六行
head(airquality)

#長條圖
hist(x=airquality$Month, 
     main="Histogram of Month",         # 圖片的名稱
     xlab="Month",                      # X軸的名稱
     ylab="Frequency")                  # Y軸的名稱

#盒形分布圖
boxplot(formula = Ozone ~ Month, # Y ~ X (代表X和Y軸要放的數值) 
        data = airquality,       # 資料
        xlab = "Month",          # X軸名稱
        ylab = "Ozone (ppb)",    # Y軸名稱
        col ="gray")             # 顏色

#散布圖
plot(x=airquality$Month,            # X軸的值
     y=airquality$Temp,             # Y軸的值
     main="Month to Temperature",   # 圖片名稱
     xlab="Month(1~12)",            # X軸名稱
     ylab="Temperature(degrees F)") # Y軸名稱       

plot(x=airquality$Ozone,      # X軸的值
     y=airquality$Wind,       # Y軸的值
     main="Ozone to Wind",    # 圖片名稱
     xlab="Ozone(ppb)",       # X軸的名稱
     ylab="Wind(mph)"         # Y軸的名稱
)



# 建立一個畫布，上面已經有一張散布圖(Ozone to Wind)
plot(x=airquality$Ozone,
     y=airquality$Wind,
     main="Ozone to Wind",
     xlab="Ozone(ppb)",
     ylab="Wind(mph)",
     pch=16                  # 點的圖形
) 

# 現在我們要在這張圖片中，把5月的資料點用藍色標註上去
May_data <- airquality[airquality$Month==5, ]   # 找出5月的資料
# 標上藍色的點
points(x=May_data$Ozone,                       
       y=May_data$Wind, 
       pch=16,                  # 點的圖形
       col="blue")              # 顏色

# 同理，也可以把8月的資料點用紅色標註上去
Aug_data <- airquality[airquality$Month==8, ]   # 找出8月的資料
# 標上紅色的點
points(x=Aug_data$Ozone, 
       y=Aug_data$Wind, 
       pch=16,               # 點的圖形
       col="red")            # 顏色

# 在右上角做出標示
legend("topright",                                # 表示在右上角
       pch = 1,                                   # pch代表點的圖案
       col = c("blue", "red", "black"),           # col代表顏色 
       legend = c("May", "August", "Other Month") # 顏色所對應的名稱
)

# 我們也可以畫出回歸趨勢線
lm.model <- lm(Wind~Ozone, airquality)    # 建立一個線性回歸
# 畫上回歸的趨勢線
abline(lm.model,                          
       lwd=2)     # lwd 代表線的粗細



# c(1,2)，表示建立一個1x2的空間，用來呈現後續的圖
par(mfrow = c(1,2)) 

# 第一張圖
plot(airquality$Wind, airquality$Ozone, main = "Wind to Ozone") 
# 第二張圖
plot(airquality$Solar.R, airquality$Ozone, main = "Solar.R to Ozone")
