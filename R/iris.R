library(tidyverse)
data("iris")
#histogramas de las variables
iris %>% ggplot(aes(x=Petal.Length, fill = Species))+
          geom_density()
#Diagrama de despersion 
iris %>% ggplot(aes(x=Petal.Length, y=Petal.Width, color=Species)) + 
  geom_point(size=3)
#diagrama de cajas
iris %>% 
  ggplot(aes(x=Species, y=Petal.Width)) +
  geom_boxplot()
