library(tidyverse)
Titanicv2 %>% 
  ggplot(aes(x=Survived))+
  geom_bar() #se observo que el numero de personas fallecidas rondaba arriba de
# los 250 y los sobrevivientes al rededor de 150.

Titanicv2 %>% 
  ggplot(aes(x=Pclass))+
  geom_bar() # se observo con base en su clase que la clase baja eran las que 
#mas habitaron en el barco seguido de la clase alta y por ultimo la clase media
Titanicv2 %>% 
  ggplot(aes(x=PassengerId, y=Age,
             color=Survived))+
  geom_point() # En el grafico se observa que la mayoria de personas que murieron
#tenian una edad de entre 20 y 40.

Titanicv2 %>% 
  ggplot(aes(x=PassengerId, y=Age,
             color=Sex,
             size = Survived))+
  geom_point(alpha= 0.5) #con base en el analisis se puede observar que la mayoria 
#de las mujeres sobrevivieron y ningun hombre o eso se logra apreciar. 

omitir_na <- na.omit(Titanicv2)

max_edad <- max(omitir_na$Age) # 76 años de edad la persona mas vieja a bordo
print(max_edad)             

min_edad <- min(omitir_na$Age) # 1 año de edad la persona mas joven a bordo
print(min_edad) 

prom_edad <- mean(omitir_na$Age)
print(prom_edad) #el promedio de edad rondaba en los 39 años 
