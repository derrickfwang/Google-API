library(dplyr)
library(data.table)
library(countrycode)
library(plotly)
library(leaflet)
library(ggplot2)
library(readxl)

HCA <- read_excel('C:/.....xlsx', sheet=1)

DF <- fread('C:/....csv', encoding = 'UTF-8', stringsAsFactors = T)

D <- DF[DF$ChainName=='Dxxxxx']
Oth <- DF[!DF$ChainName %in% c('Fxxx','Dxxxxx')]

HCA1 <- HCA %>% filter(HCA ==1)
HCA0 <- HCA %>% filter(is.na(HCA))

leaflet() %>% 
  addTiles() %>% 
  addRectangles(lat1= HCA0$Latitude - 0.003, lng1 = HCA0$Longitude-0.003,
                lat2= HCA0$Latitude + 0.003, lng2 = HCA0$Longitude+0.003, 
                color = "grey", weight =10,stroke = FALSE, 
                fillOpacity = 1) %>%
  addRectangles(lat1= HCA1$Latitude - 0.003, lng1 = HCA1$Longitude-0.003,
                lat2= HCA1$Latitude + 0.003, lng2 = HCA1$Longitude+0.003, 
                color = "green", weight =10,stroke = FALSE, 
                fillOpacity = 1) %>%
  addCircles(lat= D$Latitude, lng = D$longitude, 
             color = "blue", weight = 10, opacity = 1) %>%
  addCircles(lat= Oth$Latitude, lng = Oth$longitude, 
             color = "black", weight = 10, opacity = 1) 



