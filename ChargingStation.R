options(digits=4, scipen=40)
library(dplyr)
library(leaflet)
library(RColorBrewer)
class(ChargingStation) 
str(ChargingStation)
#data.frame':	52 obs. of  8 variables:
#$ 項次    : int  1 2 3 4 5 6 7 8 9 10 ...
#$ 站名    : chr  "陽明大樓第二停車場" "臺中市政府秘書處-陽明大樓B1停車場" "市政中心地下停車場" "臺中市豐原區公所" ...
#$ 站數    : int  15 5 21 2 7 2 1 2 2 2 ...
#$ 開放時間: chr  "上班日 0700-2000 假日不開放" "上班日 0700-2000 假日不開放" "上班日07-21假日07-2230" "上班日 0800-1700 假日不開放" ...
#$ 緯度座標: num  24.2 24.2 24.2 24.2 24.2 ...
#$ 經度座標: num  121 121 121 121 121 ...
#$ 行政區  : int  420 420 407 420 420 436 421 428 428 429 ...
#$ 地址    : chr  "臺中市豐原區自強南街兩側" "臺中市豐原區陽明街36號" "臺中市西屯區臺灣大道三段99號" "臺中市豐原區市政路2號" ...

table(ChargingStation$站數) %>% sort %>% tail(3)
rbind(range(ChargingStation$經度座標, na.rm=T), range(ChargingStation$緯度座標, na.rm=T))
#      [,1]   [,2]
#[1,] 120.5 120.73
#[2,]  24.1  24.36
map <- leaflet() %>%
  addTiles() %>%  # 加上預設的地圖資料
  addMarkers(lng=120.64687272375231, lat=24.16191317771565, popup="訊息方塊的文字說明")
map  # 繪製地圖
class(map)
#[1] "leaflet"    "htmlwidget"
m <- leaflet() %>%
  addTiles() %>%
  setView(120.64687272375231, 24.16191317771565, zoom = 18)
m #地圖放大

#test1
leaflet(ChargingStation)%>%
  addTiles()%>%
  addMarkers(lng = ~經度座標,lat = ~緯度座標,popup = ~as.character(站名))

#test2
leaflet(ChargingStation)%>%
  addTiles()%>%
  addMarkers(lng = ~經度座標,lat = ~緯度座標,
             popup = ~paste0(as.character(站名),"（",as.character(地址),"）","充電站數量為：",as.character(站數))
  )
