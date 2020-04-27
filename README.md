# tomtomtrafikendeksi
TomTom Trafik Endeksi Veri Çekme ve Şehirlerin Trafik Değerlerini Karşılaştırma


TomTom JSON API kullanılarak yapılan veri kazıma işleminin sonucunda:
"RaporlananGecikme", "CanlıEndeks", "Tarih", "TrafikUzunlugu(km)","TrafikSayisi"
değerlerine ulaşılabilmektedir.

sehir_isim1 <- "ankara"
sehir_isim2 <- "istanbul"

Şehir isimleri default olarak Ankara ve İstanbul seçilmiştir. Türkiye'deki şehirlerden herhangi biri/ikisi küçük harfler ve türkçe karakter içermeyen şekilde yazıldığında o şehirlere ait veri de çekilebilmektedir.

Veri kaynağı: TomTom International BV
https://www.tomtom.com/en_gb/traffic-index/ranking/
