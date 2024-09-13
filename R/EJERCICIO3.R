# EJERCICIO3

# Parte 1: Operaciones y Manipulación de Vectores

# Ejercicio 1: Creación de vectores
# Crea un vector con los números del 11 al 20.
# Encuentra el valor máximo, mínimo, y la suma de los elementos de este vector.

# Tu código aquí:
numeros<-c(11,12,13,14,15,16,17,18,19,20)
max(numeros)
min(numeros)
sum(numeros)

# Ejercicio 2: Operaciones con vectores
# Crea un segundo vector con los números del 21 al 30.
# Realiza una suma y una resta entre los elementos del primer y segundo vector.

# Tu código aquí:
elemet <-c(21,22,23,24,25,26,27,28,29,30)
sum(numeros,elemet)
numeros + elemet
numeros - elemet

# Parte 2: Trabajo con Dataframes

# Ejercicio 3: Creación y manipulación de un dataframe
# Crea un dataframe que contenga los nombres de 5 frutas, 
# el precio por kilogramo.
# Calcula el precio total de 2.5kg de cada fruta 
# y añade esta información al dataframe como una nueva columna.

# Tu código aquí:
df <-data.frame(
  fruta=c("manzana","platano","naranja","uva","mango" ),
  preciokg=c(50,30,40,60,54)
  
)
df
df$preciototal <-df$preciokg * 2.5
df
# Ejercicio 4: Filtrado y selección
# Filtra el dataframe para mostrar solo las frutas que tienen un precio total mayor a 100
# Selecciona únicamente las columnas con los nombres de las frutas y el precio total.

# Tu código aquí:
df[df$preciototal >100,c("fruta", "preciototal")]
df[,c("fruta", "preciototal")]


# Parte 3: Uso de Funciones y Paquetes

# Ejercicio 5: Instalación y uso de paquetes
# Instala el paquete stringr.
# Usa la función str_to_upper() para convertir los nombres de las frutas en el dataframe a mayúsculas.

install.packages("stringr")


# Tu código aquí:
install.packages("stringr")
library(stringr)
str_to_upper(df$fruta)
df$fruta <- str_to_upper(df$fruta)
df
install.packages("tidyverse")
library(tidyverse)
