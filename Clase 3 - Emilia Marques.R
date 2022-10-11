
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
url_ <- GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
glimpse(preciosEESS_es)

xml2::read_xml(url_$content)

f_raw <- jsonlite::fromJSON(url_)
df_source <- f_raw$ListaEESSPrecio %>% glimpse()
janitor::clean_names(df_source) %>% glimpse()

type_convert(df_source,locale = default_locale(","))


# READING AND WRITING (FILES) ---------------------------------------------




