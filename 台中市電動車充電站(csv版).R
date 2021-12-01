

install.packages("ggmap")
install.packages("ggplot2")

library(ggmap)
library(RgoogleMaps)
library(ggplot2)
class(ChargingStation)


ChargingStation
names(ChargingStation)
#[1] "項次"     "站名"     "站數"     "開放時間" "緯度座標" "經度座標" "行政區"   "地址"  


ChargingStation$站數<-as.numeric(ChargingStation$站數)
ChargingStation$Longitude<-as.numeric(ChargingStation$緯度座標)
ChargingStation$Latitude<-as.numeric(ChargingStation$經度座標)

Map = get_map(location = c(120.5001,24.05,120.8,24.45), zoom = 15 , maptype = 'hybrid')
Map
MapO = ggmap(Map)+ geom_point(data=subset(ChargingStation,站數>=0), aes(x=經度座標, y=緯度座標,color=站數,size=0.1))+ 
  scale_color_continuous(low = "yellow",high = "red")
MapO
