options(max.print = 100000)
pacman::p_load(httr, tidyverse, leaflet, janitor, readr, sparklyr)
url <- "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
df <- httr::GET(url)

library(sparklyr)
library(tidyverse)
library(dplyr)
library(stringr)
library(httr)
library(janitor)
library(pacman)
library(jsonlite)
library(leaflet)



#Cambiamos config
dataset <-df_source %>% janitor::clean_names() %>% type_convert(locale = locale(decimal_mark = ","))

f_raw <- jsonlite::fromJSON(url)
df_source <- f_raw$ListaEESSPrecio %>% glimpse()

janitor::clean_names(df_source) %>% glimpse()

#Gasoleo A. Top 10 mas caras
dataset %>% select(rotulo, latitud, longitud_wgs84, precio_gasoleo_a, localidad, direccion) %>%
  top_n(10, precio_gasoleo_a) %>% 
  leaflet() %>% addTiles() %>%
  addCircleMarkers(lng=~longitud_wgs84,lat=~latitud,popup=~rotulo,label= ~precio_gasoleo_a)
#Gasoleo A. Top 20 m?s baratas
dataset %>% select(rotulo, latitud, longitud_wgs84, precio_gasoleo_a, localidad, direccion) %>%
  top_n(-20, precio_gasoleo_a) %>%
  leaflet() %>% addTiles() %>%
  addCircleMarkers(lng=~longitud_wgs84, lat = ~latitud, popup = ~rotulo, label = ~precio_gasoleo_a)

#Gasoleo A. Sevilla 20 mas baratas
dataset %>% filter(provincia== "SEVILLA") %>% select(rotulo, latitud, longitud_wgs84, precio_gasoleo_a, localidad, direccion) %>%
  top_n(-20, precio_gasoleo_a) %>%
  leaflet() %>% addTiles() %>%
  addCircleMarkers(lng=~longitud_wgs84, lat = ~latitud, popup = ~rotulo, label = ~precio_gasoleo_a)

