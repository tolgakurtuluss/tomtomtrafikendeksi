library(jsonlite)
library(httr)
library(ggplot2)
library(hrbrthemes)

sehir_isim1 <- "ankara"
sehir_isim2 <- "istanbul"

df <- fromJSON(paste0("https://api.midway.tomtom.com/ranking/live/TUR_", sehir_isim1))
df2 <- fromJSON(paste0("https://api.midway.tomtom.com/ranking/live/TUR_", sehir_isim2))

data <- df$data
colnames(data) <- c("RaporlananGecikme","CanlıEndeks", "Tarih","TrafikUzunlugu(km)","TrafikSayisi")
data$Tarih<- as.POSIXct(data$Tarih/1000, origin = "1970-01-01", tz = "UTC")

data2 <- df2$data
colnames(data2) <- c("RaporlananGecikme","CanlıEndeks", "Tarih","TrafikUzunlugu(km)","TrafikSayisi")
data2$Tarih<- as.POSIXct(data2$Tarih/1000, origin = "1970-01-01", tz = "UTC")


gg <- ggplot(data, aes(x=Tarih, y=CanlıEndeks)) + 
  geom_line(color="grey") +
  geom_point(aes(col=TrafikSayisi, size=RaporlananGecikme)) + 
  labs(subtitle= paste0("Son 7 gün değerleri (",sehir_isim,")"), 
       y="Tomtom Trafik Endeksi", 
       x="Tarih", 
       title="Haftalik Trafik Endeksi", 
       caption = "Kaynak: TomTom International BV")

plot(gg)


gg2 <- ggplot(data, aes(x=Tarih, y=CanlıEndeks)) + 
  geom_line(color="grey") +
  geom_point(shape=21, color="black", fill="#69b3a2", size=3) +
  theme_ipsum() +
  labs(subtitle= paste0("Son 7 gün değerleri (",sehir_isim,")"), 
       y="Tomtom Trafik Endeksi", 
       x="Tarih", 
       title="Haftalık Trafik Endeksi", 
       caption = "Kaynak: TomTom International BV")

plot(gg2)


gg3 <- ggplot(data, aes(Tarih)) + 
  geom_line(mapping=aes(y = CanlıEndeks,color="Şehir 1"),size=1) +
  geom_line(mapping=aes(y = data2$CanlıEndeks,color="Şehir 2"),size=1) +
  scale_color_manual(values = c(
    "Şehir 1" = 'blue',
    "Şehir 2" = 'red')) +
  labs(color = 'Lejant',
       subtitle=paste0("Son 7 gün değerleri ","Şehir 1:",sehir_isim1," Şehir 2:",sehir_isim2), 
       y="Tomtom Trafik Yogunluk Endeksi", 
       x="Tarih", 
       title="Şehirler Arası Trafik Karşılaştırma", 
       caption = "Kaynak: TomTom International BV")


plot(gg3)

