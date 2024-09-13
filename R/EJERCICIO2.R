# EJERCICIO2

# 1. Crea un vector con los nombres de 4 países.
paises<-c("mexico","eua","francia","colombia","brazil")
# Tu código aquí:
paises<-c("mexico","eua","francia","colombia","brazil")

# 2. Crea un segundo vector con la población (en millones) de cada país.
# https://www.unfpa.org/data/world-population-dashboard
paises2<-c(129.4,341.8,64.9,52.3,217.6)
# Tu código aquí:
paises2<-c(129.4,341.8,64.9,52.3,217.6)


# 3. Combina estos dos vectores en un dataframe.
paises3<-data.frame(
  paises,
  paises2
)
# Tu código aquí:

paises3<-data.frame(
  paises=paises,
  poblacion=paises2
)
head(paises3)
str(paises3)


# 4. Calcula la población total de los cuatro países.

# Tu código aquí:
sum(paises3$poblacion)
#creando listas
lista<-list(
  numero=23,
  texto="hola",
  vector=c(1,2,3)
)
View(lista)
valor<-lista[[1]]
valor
#instalar un paquete
install.packages("lubridate")
fecha_texto<-c("2024-01-15","2024-03-22","2024-07-10")
class("fehca_texto")
fecha<-ymd(fecha_texto)
class(fecha)
meses<- month(fecha)
meses
meses<- month(fecha,label=TRUE)
meses
fecha_mes_mas<- fecha+ month(1)
fecha_mes_mas
fecha_inicio<-"2024-01-01"
fecha_fin<-"2024-08-08"
#converitir a date
fecha_inicio <- ymd(fecha_inicio)
fecha_fin <- ymd(fecha_fin)
diferencia <- fecha_fin - fecha_inicio
diferencia
