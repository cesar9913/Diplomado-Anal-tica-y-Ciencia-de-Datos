library(tidyverse)
library(forecast)
library(ggfortify)
library(zoo)
#total de pasajeros por internacionales de 1949 a 1960, muestras totales por mes
data("AirPassengers")
 #class
class(AirPassengers)#ts time series

#conceptos
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)

cycle(AirPassengers)

#visualizar la serie del tiempo
autoplot(AirPassengers)
boxplot(AirPassengers ~ cycle(AirPassengers))
#visualizaciones especiales
ggseasonplot(AirPassengers)
ggseasonplot(AirPassengers, polar=TRUE)
ggsubseriesplot(AirPassengers)

#componentes de una serie de tiempo
#tendendencia, estacionalidad y residuo aleatorio

adi <- decompose(AirPassengers, type = "additive")
autoplot(adi)

detrend_adi <- adi$x - adi$trend
autoplot(detrend_adi)

mult <- decompose(AirPassengers, type = "multiplicative")
autoplot(mult)

#training sed--- datos utilizados para ajustar modelos
#test_sed--- datos utilizados para concer la precision del  modelo- 2 años de predccion

#segmentar series de tiempo 1961-2=1959
training <- window(AirPassengers, end=c(1958,12))#año y mes
test <- window(AirPassengers, start=c(1958,1))

#proyeccion
#meanf() supone que el siguiente dato es igual al promedio de todos los datos 
prom <- meanf(training,h=length(test))

#Suavizamiento exponencial-- exponential smoothing
#pesos promediados de observaciones pasadas, donde los pesos decaen exponencialmente
#holt-winters
exp_adi <- HoltWinters(training, seasonal = "additive")

#predecir
pred_exp_adi <- forecast(exp_adi, h=length(test))
autoplot(pred_exp_adi)

#para medir la precision utilizamos accuracy
accuracy(pred_exp_adi)

#modelo multiplicativo
exp_mult <- HoltWinters(training, seasonal = "multiplicative")

#predecir
pred_exp_mult <- forecast(exp_mult, h=length(test))
accuracy(pred_exp_mult,test)
#para un exponencial smooting ajustado automaticamente tenemos ets
ets <- ets(training)
summary(ets)
#
pred_ets <- forecast(ets, h=length(test))
autoplot(pred_ets)
accuracy(pred_ets, test)

#ARIMA
#AR--- atoregresivo: calcula cuantos meses atras influye en nuestra serie de tiempo
#I--- integrados: se encarga que la serie de tiempo sea estacionaria (media y varianza constante)
#MA--- promedios moviles: calcula que tanto fallo en el pasado y lo considera en el 

arima <- auto.arima(training, stepwise = FALSE, approximation = FALSE)
pred_arima  <- forecast(arima, h=length(test))
accuracy(pred_arima,test)

df <- data.frame(
  date=as.Date(as.yearmon(time(test))),
       test=as.vector(test)
       )
prom_df <- as.data.frame(prom$mean) %>% 
rename(prom=x)

adi_df <- as.data.frame(pred_exp_adi$mean) %>% 
  rename(adi=x)

mult_df <- as.data.frame(pred_exp_mult$mean) %>% 
  rename(mult=x) 

ets_df <- as.data.frame(pred_exp_ets$mean) %>% 
  rename(ets=x)

arima_df <- as.data.frame(pred_exp_arima$mean) %>% 
  rename(arima=x)

ensamble <- cbind(df,prom_df,adi_df,mult_df,ets_df,arima_df)
ensamble_2 <- ensamble %>% 
  pivot_longer(-c(date),
               names_to = "forecast",
               values_to = "value")
ensamble_2 %>% ggplot(aes(x=date, y=value, color=forecast))+
  geom_line()
