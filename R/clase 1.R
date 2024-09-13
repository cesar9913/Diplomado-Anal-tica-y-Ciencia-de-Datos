# mi primer script

#  enteros 
1+1
#operaciones decimales
0.3 - 0.1
#operaciones de multiplicación
4*5
#operaciones de potencia 
3**2
#raiz cuadrada 
sqrt(5)
#logaritmos
log(10)
#figuras geometricas
sin(90*pi/180)
#imprimir texto
texto <- "hola mundo!"
print(texto)
#tenemos 2 funciones para definir el tipo de dato en R 
#typeof()es el tipo de almacenamiento de en R
#Class()es un tipo de dato que define las funciones que pueden ser utilizadas
class(texto)#character
typeof(texto)#character
class(20.5)
typeof(20.5)
class (2)
typeof(2)
typeof(2L)
class(2+4i)
es_igual <- 3==3
class(es_igual)
typeof(es_igual)
#crear un vector
vector <-c(10,20,30,40)
class(vector)
vector2 <-c(10,20,30,"numero")
class(vector2)
#estadisticas del vector
length(vector)
max(vector)
min(vector)
sum(vector)
#extraer elementos
vector[1]
vector[c (1,2)]
vector[-c (1,2)]
#operar vectores 
vector3 <- c(1,2,3,4)

vector + vector3
vector - vector3
vector * 1000
c(vector,vector3)
#generar una muestra
muestra <-sample(vector,100,replace =TRUE )
muestra
hist(muestra)
#generar una muestra de distribución normal 
muestra_dnormal<- rnorm(1000, mean=5, sd=5)
hist(muestra_dnormal)
#creando un dataframe
ventas <- data.frame(
  cliente=c( "Antonio", "Juan", "Roberto", "Maria"),
  producto=c( "Celular", "Ordenador", "Ordenador", "Procesador"),
  precio=c(1500,3500,4000,2000)
)
#explorando nuestro data.frame
head(ventas,2)
tail(ventas,2) 
#ventana de datos
View(ventas)
#resumen del dataframe
str(ventas)
summary(ventas)
#extraer datos de una columna
ventas$producto
unique(ventas$producto)
#extrae datos del dataframe
nrow(ventas)
ncol(ventas)
dim(ventas)
#filtrar y acceder al dataframe
ventas[ventas$producto =="Ordenador",]
ventas[,c("producto","precio")]
ventas[ventas$precio > 1500 & ventas$cliente =="Juan",]

#distintas formas de hacerlo
ventas_subset <- subset(ventas,producto=="Ordenador",)
View(ventas_subset)
