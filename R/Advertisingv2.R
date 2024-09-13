library(tidyverse)
df <- read.csv("Advertisingv2.csv")
#resumen
str(df)
summary(df)
#Existen nulos
colSums(is.na(df))
#explorar las variables
df %>% ggplot(aes(x=TV))+ geom_histogram()
df %>% ggplot(aes(x=Newspaper))+ geom_histogram()
#calcular el sesgo/asimetria de la funcion 
install.packages("moments")
library(moments)
skewness(df$Newspaper)
#asimetria positiva- sesgada hacia la derecha
#asimetria negativa- sesgada a la izquirda 
# entre 0-0.5 simetrico
# 0.5 - 1 asimetria moderada
# >1 asimetria alta

#objetivo comprender por medio de un modelo como se comportan las ventas 
#No podemos manipular las ventas pero si podemos manipular el presupuesto

#diagrama de dispersion 
df %>% ggplot(aes(x=TV, y= Sales)) +
  geom_point()
df %>% ggplot(aes(x=Radio, y= Sales)) +
  geom_point()
df %>% ggplot(aes(x=Newspaper, y= Sales)) +
  geom_point()
#introducir los modelos
simple <- lm(Sales~TV,data = df)
#que podriamos hacer con este modelo lineal 
#cuales predictores estan asociados con la respuesta?
#que relacion existe entre la respuesta y cada predictor?
#la relacion entre el predictor y la respuesta es lineal?


#desde una forma practica podemos preguntarnos 
#existe una relacion entre el presupuesto de los anuncios y las ventas?
#que tan fuerte es la relacion entre el presupuesto en anuncios y las ventas?
#cuales medios contrubuyen a las ventas?

# 3xtraer parametros
coef(simple)
#summary
summary(simple)
0.047*1000
df %>% ggplot(aes(x=TV, y=Sales))+geom_point()+ 
  geom_smooth(method = "lm")
  #intervalo de confianza
confint(simple)
#modelo de regresion lineal multiple
multiple <- lm(Sales~.,data = df)

install.packages("GGally")
library(GGally)
ggpairs(df)
summary(multiple)
#visualizacion de los errores
hist(multiple$residual)
plot(multiple$fitted.values,multiple$residual)

#multiple y interacciones entre variables
#B*TV*Radio + B*TV + B*Radio 

interaccion<- lm(Sales~ TV*Radio, data=df)
summary(interaccion)

#visualizacion de los errores
hist(multiple$residual)
plot(multiple$fitted.values,multiple$residual)

 
