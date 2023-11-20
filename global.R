library(shiny)
library(shinyWidgets)
library(bs4Dash)

library(dplyr)
library(magrittr)
library(readxl)
library(reactable)
library(terra)
library(plotly)
library(leaflet)

Locations <- read_excel("www/Locations.xlsx")
data_emet <- read_excel("www/analiz.xlsx")

as_ef <- rast("www/rec_as_ef.tif")
as_igeo <- rast("www/rec_as_igeo.tif")
cd_ef <- rast("www/rec_cd_ef.tif")
cd_igeo <- rast("www/rec_cd_igeo.tif")
hg_ef <- rast("www/rec_hg_ef.tif")
hg_igeo <- rast("www/rec_hg_igeo.tif")
pb_ef <- rast("www/rec_pb_ef.tif")
pb_igeo <- rast("www/rec_pb_igeo.tif")

col_as_ef <- colorFactor(c("#fee6ce","#fdae6b","#e6550d"), values(as_ef),na.color = "transparent")
col_as_igeo <- colorFactor(c("#efedf5","#bcbddc","#756bb1"), values(as_igeo),na.color = "transparent")
col_cd_ef <- colorFactor(c("#fee6ce","#fdae6b","#e6550d"), values(cd_ef),na.color = "transparent")
col_cd_igeo <- colorFactor(c("#efedf5","#bcbddc","#756bb1"), values(cd_igeo),na.color = "transparent")
col_hg_ef <- colorFactor(c("#fee6ce","#fdae6b","#e6550d"), values(hg_ef),na.color = "transparent")
col_hg_igeo <- colorFactor(c("#efedf5","#bcbddc","#756bb1"), values(hg_igeo),na.color = "transparent")
col_pb_ef <- colorFactor(c("#fee6ce","#fdae6b","#e6550d"), values(pb_ef),na.color = "transparent")
col_pb_igeo <- colorFactor(c("#efedf5","#bcbddc","#756bb1"), values(pb_igeo),na.color = "transparent")

vars <- setdiff(names(data_emet), c("lat","lon","NN"))
# arsenik
# cıva
# kurşun
# kadmiyum

#select(data_emet, "NN","As(mg/kg)","as_ef","as_igeo")

# Enrichment Factor (EF) --------------------------------------------------
# ef sınıflandırılması ise;
# 1- ef < 2 : Minimal zenginleşme
# 2- 2 <= ef <= 5 Orta zenginleşme
# 3- 5 <= ef <= 20 Orta zenginleşme
# 4- 20 <= ef <= 40 Orta zenginleşme
# 5- ef > 40 Orta zenginleşme

# Geoaccumulation Index (l_geo) ---------------------------------------------------
# Geoaccumulation Index sınıflandırılması ise;
# 1- l_geo < 0 Pratik olarak kirlenmemiş
# 2- 0 < l_geo < 1 Kirlenmemiş-orta derecede kirlenmiş
# 3- 1 < l_geo < 2 Orta derecede kirlenmiş
# 4- 2 < l_geo < 3 Orta-çok kirlenmiş
# 5- 3 < l_geo < 4 Çok kirlenmiş
# 6- 4 < l_geo < 5 Çok aşırı kirlenmiş
# 7- l_geo > 5 Orta derecede kirlenmiş
