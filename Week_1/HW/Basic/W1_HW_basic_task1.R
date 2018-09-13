# 查看內建資料集: 鳶尾花(iris)資料集
iris
#查看資料

# 使用dim(), 回傳iris的列數與欄數
dim(iris)
#獲得 "列數   欄數"

# 使用head() 回傳iris的前六列
head(iris,6)
#使用方式：head(資料,列數)

# 使用tail() 回傳iris的後六列
tail(iris,6)
#使用方式：tail(資料,列數)

# 使用str() 
str(iris)
#將資料製成陣列

# 使用summary() 查看iris敘述性統計、類別型資料概述。
summary(iris)
#獲得最小值、四分之一位數、中位數、平均數、四分之三位數、最大值