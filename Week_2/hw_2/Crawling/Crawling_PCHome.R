library(jsonlite)
url <- "https://ecshweb.pchome.com.tw/search/v3.3/all/results?q=asus&page=1&sort=rnk/dc"  #設定網址
my.data <- read_json(url)   #Json結構的資料抓下來

data.frame(do.call(rbind,my.data$prods))

View(data.frame(do.call(rbind,my.data$prods)))
