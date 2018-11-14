data <- read.table("show.csv",  # 資料檔名 
                 header=T,      # 資料中的第一列，作為欄位名稱
                 sep=",")       # 將逗號視為分隔符號來讀取資料

head(data)
pca <- prcomp(formula = ~X1+X2+X3+X4+X5+X6 ,  #選擇個變數 
              data = data,                           # 資料
              scale = TRUE)                          # 正規化資料
# 這就是我們的主成份
pca  

# 使用plot()函式
plot(pca,         # 放pca
     type="line", )

# 用藍線標示出特徵值=1的地方
abline(h=1, col="blue") # Kaiser eigenvalue-greater-than-one rule
vars <- (pca$sdev)^2  # 從pca中取出標準差(pca$sdev)後再平方，計算variance(特徵值)
vars

props <- vars / sum(vars)    
props
cumulative.props <- cumsum(props)  # 累加前n個元素的值
cumulative.props
cumulative.props[5]
plot(cumulative.props)
top3_pca.data <- pca$x[, 1:5]
top3_pca.data 
pca$rotation

top3.pca.eigenvector <- pca$rotation[, 1:5]

top3.pca.eigenvector

first.pca <- top3.pca.eigenvector[, 1]   #  第一主成份
second.pca <- top3.pca.eigenvector[, 2]  #  第二主成份
third.pca <- top3.pca.eigenvector[, 3]   #  第三主成份
fourth.pca <- top3.pca.eigenvector[, 4]   #  第三主成份
fifth.pca <- top3.pca.eigenvector[, 5]   #  第三主成份

first.pca[order(first.pca, decreasing=FALSE)]  

dotchart(first.pca[order(first.pca, decreasing=FALSE)] ,   # 排序後的係數
         main="Loading Plot for PC1",                      # 主標題
         xlab="Variable Loadings",                         # x軸的標題
         col="red")    

second.pca[order(second.pca, decreasing=FALSE)]  
dotchart(second.pca[order(second.pca, decreasing=FALSE)] ,  # 排序後的係數
         main="Loading Plot for PC2",                       # 主標題
         xlab="Variable Loadings",                          # x軸的標題
         col="blue")

third.pca[order(third.pca, decreasing=FALSE)]  

dotchart(third.pca[order(third.pca, decreasing=FALSE)] ,   # 排序後的係數
         main="Loading Plot for PC3",                      # 主標題
         xlab="Variable Loadings",                         # x軸的標題
         col="purple")    

fourth.pca[order(fourth.pca, decreasing=FALSE)]  

dotchart(fourth.pca[order(fourth.pca, decreasing=FALSE)] ,   # 排序後的係數
         main="Loading Plot for PC1",                      # 主標題
         xlab="Variable Loadings",                         # x軸的標題
         col="orange")    

fifth.pca[order(fifth.pca, decreasing=FALSE)]  

dotchart(fifth.pca[order(fifth.pca, decreasing=FALSE)] ,   # 排序後的係數
         main="Loading Plot for PC1",                      # 主標題
         xlab="Variable Loadings",                         # x軸的標題
         col="lightblue")    

biplot(pca, choices=4:5)
