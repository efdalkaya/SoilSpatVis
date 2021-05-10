library(tidyverse)
library(rgdal)
library(sf)
library(sp)

# Referans Element: Bakir
# Hesaplamada: Nikel
#link <- "https://github.com/efdalkaya/SoilSpatVis"

load("data.RData")

dataDF <- data.frame(kutahya)
colnames(dataDF) <- c("Latitude",
                    "Longitude",
                    "PointNumber",
                    "Cu","Pb","Zn","Ni","As","Cd","Cr","Hg","Ti","EF","GI","GEO_Index","CF")

vars <- setdiff(names(dataDF), c("Latitude","Longitude","PointNumber"))

basemaps <- c("Esri.WorldImagery","OpenStreetMap.Mapnik","OpenStreetMap.HOT","OpenTopoMap","Stamen.Terrain",
              "Stamen.Watercolor","Stamen.Toner","Stamen.TonerBackground","Stamen.TonerLite")

pointData <- readOGR("www/pointData.shp", stringsAsFactors = F)
ef <- raster("www/ef.tif")
gi <- raster("www/gi.tif")
cf <- raster("www/cf.tif")

# Enrichment Factor (EF) --------------------------------------------------
# ef sınıflandırılması ise;
# ef < 2 : Minimal zenginleşme
# 2 <= ef <= 5 Orta zenginleşme
# 5 <= ef <= 20 Orta zenginleşme
# 20 <= ef <= 40 Orta zenginleşme
# ef > 40 Orta zenginleşme

# Geoaccumulation Index (l_geo) ---------------------------------------------------
# Geoaccumulation Index sınıflandırılması ise;
# 0 l_geo < 0 Pratik olarak kirlenmemiş
# 1 0 < l_geo < 1 Kirlenmemiş-orta derecede kirlenmiş
# 2 1 < l_geo < 2 Orta derecede kirlenmiş
# 3 2 < l_geo < 3 Orta-çok kirlenmiş
# 4 3 < l_geo < 4 Çok kirlenmiş
# 5 4 < l_geo < 5 Çok aşırı kirlenmiş
# 6     l_geo > 5 Orta derecede kirlenmiş

# Contamination Factor (CF) ----------------------------------------------------
# cf sınıflaması ise;
# cf < 1 Az kirlenme
# 1 < cf < 3 Orta derecede kirlenme
# 3 < cf < 6 Önemli derecede kirlenme
#     cf > 6 Aşırı derecede kirlenme