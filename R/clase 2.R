df <- read.csv("online sales data.csv")
view(df)
#explorar los datos 
str(df)
summary(df)
#dplyr para manipulacion de datos 
#select(df,columna 1,...)para extraer columnas 
df_1 <- select(df,Transaction.ID, Date, Total.Revenue)
view(df_1)
head(df_1)
df_2 <- select(df,starts_with("Product"))%
head(df_2)
view(df_2)
df_3 <- select(df,starts_with("Unit"))
head(df_3)
#rename (df, nuevo nombre=nombre actual,...) renombrar columna
df_rename <- rename(df,
                    Fecha=Date,
                    Categoria=Product.Category)
head(df_rename)
#mutate (df,regla_de_transformacion)crea una nueva columna cpn base en una regla
df <- mutate(df, Total.Calculado= Units.Sold*Unit.Price)
view(df)
df<- mutate(df,
            Product.Unit=paste(Product.Name,"(",Units.Sold,")"))
view(df)
#filter(df,regla de filtro,)-filtrar de acuerdo a una condicion 
df_Filter <- filter(df,
            Payment.Method=="Credit Card") 
#filtrar de acuerdo a mas condiciones con vectores 
view(df_Filter)
df_filter2 <- filter(df,Payment.Method %in% c("Credit Card","PayPal") )
view(df_filter2)
df_filter3 <- filter(df,
                     Units.Sold >2, Unit.Price >200)
#arrange()-ordenar datos
df_arrange <- arrange(df,Total.Revenue)#se ordenan de forma asc
view(df_arrange)
df_arrange_desc <- arrange(df,desc(Total.Calculado))
view(df_arrange_desc)
#Summarise()-funciion de agregacion aplicadas a columnas
summarise(df,suma.Total.Calculado=sum(Total.Calculado))

summarise(df,
          suma.Total.Calculado=sum(Total.Calculado),
          Promedio.Total.Calculado=mean(Total.Calculado),
          Productos.Unicos=n_distinct(Product.Name))
#group by()-agrupo valores 
#paso 1. generar grupos
df_group <- group_by(df,Product.Name)
head(df_group)
#paso 2. summarise()
resumen<- summarise(df_group,
          suma.Total.Calculado=sum(Total.Calculado),
          Promedio.Total.Calculado=mean(Total.Calculado),
          Productos.Unicos=n_distinct (Product.Name)
)
#guardar en csv
write.csv("resumen por productos.csv")


#Paso 3. desagrupar
df_group <- ungroup(df_group)

#nota: se vuelve cansado definir variables para lleggar a un analisis 
#tidyverse funciona tambien con el operador "pipe", para hacer cadenas de funciones#
#para escribir el operador en windows: ctrl+shift+m
#para escribir en operador mac: cmd+shift+m
#%>% %>% %>% %>% %>% %>% mmmm %>% %>% m %>% %>% %>% %>% %>% %>% 
library(palmerpenguins)
data("penguins")
penguins %>% 
  select(species,island,bill_length_mm,flipper_length_mm) %>% 
  filter(flipper_length_mm >190) %>% 
  drop_na() %>% 
  group_by(species) %>% 
  summarise(promedio.flipper.length=mean(flipper_length_mm))
