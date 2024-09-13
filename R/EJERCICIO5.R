# EJERCICIO 5
library(palmerpenguins)
library(tidyverse)
data(penguins)

# Recuerda que es tu decisión si quieres remover los nulos del data frame
# penguins <- drop_na(penguins)
penguins <- drop_na(penguins)
# 1. Selecciona las columnas species, island, y flipper_length_mm.
# 2. Filtra los pingüinos de la isla "Biscoe".
# 3. Filtra para obtener solo aquellos con un largo de aleta mayor a 200 mm.
# 4. Muestra los primeros 10 resultados.
penguins %>% 
  select(species,island,flipper_length_mm) %>% 
  filter(island =="Biscoe",flipper_length_mm >200) %>% 
  arrange(desc(flipper_length_mm))


# 1. Crea una nueva columna llamada "mass_category" que clasifique a los pingüinos
#    como "small" si pesan menos de 3000 gramos, y "large" si pesan 3000 gramos o más.
# 2. Filtra para incluir solo aquellos pingüinos que son de la especie "Gentoo".
# 3. Selecciona las columnas species, body_mass_g, y mass_category.
# 4. Ordena los resultados por peso corporal en orden ascendente.
penguins %>% 
  mutate(mass_category= case_when 
         (body_mass_g <3000 ~"small",
          body_mass_g >=3000 ~"large")) %>%
          filter(species=="Gentoo") %>% 
          select(species,body_mass_g, mass_category) %>% 
          arrange(body_mass_g)
  

# 1. Filtra los datos para obtener solo los pingüinos de la especie "Adelie".
# 2. Dentro de los pingüinos "Adelie", filtra aquellos que pesan más de 3500 gramos.
# 3. Selecciona las columnas species, island, body_mass_g y sex.
# 4. Obtén el promedio del peso corporal por isla y sexo.
# 5. Ordena el resultado por el peso promedio en orden descendente.
penguins %>% 
  filter(species=="Adelie") %>% 
  filter(body_mass_g > 3500) %>% 
  select(species, island, body_mass_g, sex) %>% 
  group_by(island, sex) %>% 
  summarise(promedio.peso.corporal= mean(body_mass_g)) %>% 
  ungroup() %>% 
  arrange(desc(promedio.peso.corporal))

# 1. Crea una nueva variable "bill_ratio" que sea la divsión entre la longitud del pico (bill_length_mm)
#    y la profundidad del pico (bill_depth_mm).
# 2. Filtra los datos para incluir solo los pingüinos con una "bill_ratio" mayor a 2.
# 3. Agrupa los datos por species y sex.
# 4. Calcula la mediana de "bill_ratio" y el número de muestras para cada grupo.
# 5. Muestra solo las especies y sexos con al menos 10 observaciones en el grupo
penguins %>% 
  mutate(bill_ratio= bill_length_mm/bill_depth_mm) %>% 
  filter(bill_ratio >2) %>% 
  group_by(species,sex) %>% 
  summarise(promedio.bill.ratio = mean(bill_ratio),
  muestras = n()) %>% 
  filter(muestras >=10) %>% 
  pivot_wider(names_from = sex, values_from = c(promedio.bill.ratio, muestras))
  
  #fish_encounters %>% 
  #pivot_wider(names_from = station, values_from = seen)
  
  
