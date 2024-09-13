library(palmerpenguins)
library(tidyverse)
data(penguins)

# Recuerda que es tu decisión si quieres remover los nulos del data frame
penguins <- drop_na(penguins)
#ggplot2- barra
#1. marcos y coordenadas-ggplot(aes())
#2.datos- ggplot(aes())- aesthethic x(culumna),y(fila), color(leyenda)
#3. tipo de grafico - geom_bar(),geom_histogram()
penguins %>% 
 ggplot(aes(x=species))+
 geom_bar()

#explorar el flipper_length_mm
#se observan dos grupos de longitud de aletas: 180-200 a 200-220
penguins %>% 
  ggplot(aes(x=flipper_length_mm)) +
  geom_histogram()
#explorar especies
#la especie gentoo tiene una mayor longgitud de aleta respecto a las otras especies
# la especie adelie y chinstrap tienen rangos muy parecidos
penguins %>% 
  ggplot(aes(x=flipper_length_mm, fill=species)) +
  geom_histogram(alpha=0.5)

#diagramas de caja 
penguins %>% 
  ggplot(aes(x=species, y=flipper_length_mm)) +
  geom_boxplot()
#diagrama de dispersion 
penguins %>% 
  ggplot(aes(x=bill_depth_mm, y=bill_length_mm, 
             color=species,
             size = flipper_length_mm))+
  geom_point(alpha= 0.5)
#comprender distribucion por categoria 
penguins %>% 
  ggplot(aes(x=species, y=island,
            color=sex))+
  geom_point(position = "jitter")
#vamos a ver todas las variables juntas -FUNCION facet_grid()
penguins %>% 
  ggplot(aes(x=bill_depth_mm, y=bill_length_mm, 
             color=species,
             size = flipper_length_mm))+
  geom_point(alpha= 0.5)+
  facet_grid(sex~island,scales = "free")
#violin
penguins %>% 
ggplot(aes(x=species, y=flipper_length_mm)) +
  geom_violin(scale="count")
