<<<<<<< HEAD
library (tidyverse)
library(httr)
library(janitor)
library(pacman)
library(jsonlite)

# READING DATA ------------------------------------------------------------
df_raw <- read_csv("coches-de-segunda-mano-sample.csv")

df1<-df_raw %>% janitor::clean_names() %>% type_convert(locale = locale(decimal_mark = ","))

##Clasificamos por europeo y no europeo NUEVA COLUMNA
dfeur <- df1 %>% mutate(europea = make %in% c("OPEL", "BMW", "MERCEDES-BENZ", "PEUGEOT", "RENAULT", "PORSCHE", "AUDI", "VOLKSWAGEN", "ALFA ROMEO", "FERRARI"))

write.csv(dfeur, "dfexamen.csv")
=======
library (tidyverse)
library(httr)
library(janitor)
library(pacman)
library(jsonlite)

# READING DATA ------------------------------------------------------------
df_raw <- read_csv("coches-de-segunda-mano-sample.csv")

df1<-df_raw %>% janitor::clean_names() %>% type_convert(locale = locale(decimal_mark = ","))

##Clasificamos por europeo y no europeo NUEVA COLUMNA
dfeur <- df1 %>% mutate(europea = make %in% c("OPEL", "BMW", "MERCEDES-BENZ", "PEUGEOT", "RENAULT", "PORSCHE", "AUDI", "VOLKSWAGEN", "ALFA ROMEO", "FERRARI"))

write.csv(dfeur, "dfexamen.csv")
>>>>>>> 62bfa3f989a1cc7c20c6f20c5a0b5ec8e0fa9933
