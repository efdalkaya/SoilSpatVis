
library(dplyr)
library(ggplot2)
library(tidyverse)
library(rgdal)
library(sf)


load("data.RData")

dataDF <- data.frame(data)
colnames(dataDF) <- c("Latitude",
                      "Longitude",
                      "PointNumber",
                      "Cu","Pb","Zn","Ni","As","Cd","Cr","Hg")

dataPopup <- mutate(dataDF, 
                    cntnt=paste0('<strong>Point Number:</strong>',dataDF$NN,
                                '<br><strong>Longitude:</strong>',dataDF$lon,
                                 '<br><strong>Latitude:</strong>',dataDF$lat))

vars <- setdiff(names(dataDF), c("Latitude","Longitude","PointNumber"))

basemaps <- c("Esri.WorldImagery",
              "OpenStreetMap.Mapnik",
              "OpenStreetMap.HOT",
              "OpenTopoMap",
              "Stamen.Terrain",
              "Stamen.Watercolor",
              "Stamen.Toner",
              "Stamen.TonerBackground",
              "Stamen.TonerLite")

#pointData <- readOGR("www/pointData.shp", stringsAsFactors = F)
#studyArea <- readOGR("www/studyArea.shp", stringsAsFactors = F)

# Enrichment Factor (EF) --------------------------------------------------
# ef = (cn/cref)ornek / (bn/bref)referans
# cn: İncelenen elemntin analizi yapılan örnekteki değeri
# cref: Referans elementin analizi yapılan örnekteki değeri
# bn: İncelenen elementin yer kabuğundaki ortalama değeri
# bref: referans elementin yer kabuğundaki ortalama değeri
# ef sınıflandırılması ise;
# ef < 2 : Minimal zenginleşme
# 2 <= ef <= 5 Orta zenginleşme
# 5 <= ef <= 20 Orta zenginleşme
# 20 <= ef <= 40 Orta zenginleşme
# ef > 40 Orta zenginleşme

# Geoaccumulation Index (l_geo) ---------------------------------------------------
# l_geo <- log2(cn/(1.5*bn))
# cn: toprak örneğindeki metal konsantrasyonunun değeri
# bn: n metalinin yer kabuğundaki ortalama değeri
# Geoaccumulation Index sınıflandırılması ise;
# 0 l_geo < 0 Pratik olarak kirlenmemiş
# 1 0 < l_geo < 1 Kirlenmemiş-orta derecede kirlenmiş
# 2 1 < l_geo < 2 Orta derecede kirlenmiş
# 3 2 < l_geo < 3 Orta-çok kirlenmiş
# 4 3 < l_geo < 4 Çok kirlenmiş
# 5 4 < l_geo < 5 Çok aşırı kirlenmiş
# 6     l_geo > 5 Orta derecede kirlenmiş


# Contamination Factor (CF) ----------------------------------------------------
# cf <- c_metal / co
# cmetal: Toprak örneğindeki metalin konsantrasyonu
# co: İncelenen metalin yer kabuğundaki ortalama değeri
# cf sınıflaması ise;
# cf < 1 Az kirlenme
# 1 < cf < 3 Orta derecede kirlenme
# 3 < cf < 6 Önemli derecede kirlenme
#     cf > 6 Aşırı derecede kirlenme