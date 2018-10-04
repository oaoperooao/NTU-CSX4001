library(leaflet)
data <- read.csv("C:\\Users\\perot\\Desktop\\NTU-CSX4001\\Week_4\\hw_4\\map\\address.csv")
data <- data.frame(data)
leaflet(data = data[1:135,]) %>% addTiles() %>%
  addMarkers(~經度, ~緯度)
