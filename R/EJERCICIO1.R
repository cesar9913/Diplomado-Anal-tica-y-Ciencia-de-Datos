# EJERCICIO1

# 1. Crea un vector con tus 5 números favoritos.

# Tu código aquí:

che <-c(23,13,4,7,99)
# 2. Calcula la media de esos números.

# Tu código aquí:
mean(che)
# 3. Crea un dataframe con los nombres de 3 ciudades y sus respectivas temperaturas.

# Tu código aquí:
ciudades <-data.frame(
  ciudades=c("manzanillo","comala","armeria"),
  temperatura=c("22°","17°","24°")
)
View(ciudades)
# 4.- Obten un resumen de las columnas de tu dataframe

# Tu código aquí:

str(ciudades)
summary(ciudades)
