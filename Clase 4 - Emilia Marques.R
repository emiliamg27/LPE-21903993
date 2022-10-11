
# ID SCRIPT ---------------------------------------------------------------

##LENGUAJES DE PROGRAMACION ESTADISTICA
##PROFESOR: CHRISTIAN SUCUZHANAY AREVALO
##ALUMNO: EMILIA MARQUES GARCIA
##HANDS ON 01


# INGEST FUNTION ----------------------------------------------------------



# SHORTCURTS --------------------------------------------------------------
## crtl + l = clean console
##crtl + shift + r = new section

# GIT COMMANDS ------------------------------------------------------------
git status
git init
git add
git commit -m "message"
git push -u origin main
git branch Emilia
git merge
git remote add origin https://github.com/emiliamg27/LPE21535220.git
git clone https://github.com/emiliamg27/LPE21535220.git
git pull
git fetch

# TERMINAL COMMANDS -------------------------------------------------------
ls listar lo que tienes
cd
pwd para ver donde estas
cd ..
mkdir crear directorio
touch crear archivo
nano
less 
cat 
.. volver atras
clear
where
which


# LOADING LIBS ------------------------------------------------------------
install.packages(c("tidyverse","httr","janitor","pacman","jsonlite"))


library(tidyverse)

library(httr)

library(janitor)

library(pacman)

library(jsonlite)

# BASIC OPERATIONS --------------------------------------------------------
cristina <- 20
clase_lep <- c("marta","emilia","pablo")

# GETTING DATA FROM THE INTERNET ------------------------------------------
url_ <- ("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
df <- GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
glimpse(preciosEESS_es)

xml2::read_xml(url_$content)

f_raw <- jsonlite::fromJSON(url_)
df_source <- f_raw$ListaEESSPrecio %>% glimpse()
janitor::clean_names(df_source) %>% glimpse()

locale()

df1 <- df_source %>% janitor::clean_names() %>% type_convert(locale = locale(decimal_mark = ","))

# CREATING A NEW VARIABLES ------------------------------------------------

## Clasificamos en gasolineras baratas y no baratas

ds21903993_33 <- df1 %>% mutate(lowcost = !rotulo %in% c("CEPSA","REPSOL","BP","SHELL"))

## Precio medio del gasoleo en las CCAA

ds21903993_33 %>% select(precio_gasoleo_a, idccaa, rotulo, lowcost) %>% drop_na() %>% group_by(idccaa, lowcost) %>% summarize(mean(precio_gasoleo_a)) %>% view()


write.csv(ds21903993_33, file= "ds21903993_33.csv")

## Columna que identifica ccaa

ds21903993_34 <- df1 %>% replace(ccaa = idccaa %in% c("01"="ANDALUCIA","02"="ARAGON","03"="ASTURIAS","04"="BALEARES","05"="CANARIAS","06"="CANTABRIA","07"="CASTILLA Y LEON","08"="CASTILLA LA MANCHA","09"="CATALUÑA",
                                             "10"="COMUNIDAD VALENCIANA","11"="EXTREMADURA","12"="GALICIA","13"="MADRID","14"="MURCIA","15"="NAVARRA","16"="PAIS VASCO",
                                             "17"="RIOJA","18"="CEUTA","19"="MELILLA")) %>% view()


# READING AND WRITING (FILES) ---------------------------------------------




