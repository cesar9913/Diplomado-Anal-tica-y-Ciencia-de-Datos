# EJERCICIO 4

# 1.- Instala el paquete "palmerpenguins"

install.packages("palmerpenguins")

# 2.- Carga el paquete palmerpenguins
library("palmerpenguins")


# 3.- Carga el dataset penguins

data("penguins")

# 4.- Explora los datos con las funciones str() y summary()
str(penguins)
summarise(penguins)
# 5.- Verifica si hay valores na
is.na(penguins)
colSums(is.na(penguins))


# 6.- Explora los valores nulos
filter(penguins,is.na(sex))


# 7.- Filtra los valores nulos
penguins<- drop_na(penguins)


# 8. Selecciona las columnas: `species`, `island`, `bill_length_mm`, `bill_depth_mm`, y `flipper_length_mm`.
penguins_s <- select(penguins,species,island,bill_length_mm,bill_depth_mm,
                     flipper_length_mm)

# 9. Filtra las filas donde la especie sea "Adelie"  y la longitud de la aleta (`flipper_length_mm`) sea mayor a 190 mm.
penguins_sf <- filter(penguins_s, species == "Adelie",flipper_length_mm > 190)


# 10. Ordena el resultado orden ascendente según la longitud del pico (`bill_length_mm`).

penguins_sfo <- arrange(penguins_sf, bill_length_mm)

# 11. Calcula el promedio de la longitud del pico (`bill_length_mm`) para los pingüinos "Adelie" de la isla "Dream".
summarise(penguins_sfo,promedio.bill.length= mean(bill_length_mm))

