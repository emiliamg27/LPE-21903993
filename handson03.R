# ID SCRIPT ---------------------------------------------------------------


## LENGUAJES DE PROGRAMACIÓN ESTADÍSTICA
## PROFESOR: CHRISTIAN SUCUZHANAY AREVALO
## ALUMNO: EMILIA MARQUES GARCIA EXPEDIENTE 21903993
## HANDS ON 02

browseURL("https://github.com/emiliamg27/LPE21903993")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(pacman, magrittr, productplots, psych, RColorBrewer, tidyverse)

#pacman = load and unload
#magritt = Bidirectional piping
#productplots = graphics and cat var
#psych = estadística
#RColorBrewer = painting and colour palette

# LOAD AND PREPARE DATA ---------------------------------------------------
browseURL("http://j.mp/37Wxvv7")
que_tipo <- happy
df <- happy %>% as_tibble()
#Check happy levels
levels(df$happy)
#Reverse levels
df %<>%mutate(happy=fct_rev(happy)) %>% view()

# OUTCOME VARIABLES : HAPPINESS -------------------------------------------
df %>% ggplot()+geom_bar(aes(happy, fill=happy))+theme(axis.title.x = element_blank(),legend.position = "none")#Plot

#Frequencies for happy
df %>% count(happy)
df %<>% select(happy:health) %>% view()
df %<>% filter(!is.na(happy))

# HAPPINESS AND GENDER ----------------------------------------------------
df %>% ggplot(aes(sex, fill=happy))+geom_bar(position ="fill")

# HAPPINESS AND MARITAL STATUS --------------------------------------------

# HAPPINESS AND EDUACTION LEVEL -------------------------------------------


