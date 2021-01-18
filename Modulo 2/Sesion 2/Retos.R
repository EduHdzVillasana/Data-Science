# Retos Sesion 2 Data Science - BEDU 11/01/2021

# RETO 1

set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)
library(DescTools)
#1.- Calcule, la media, mediana y moda de los valores en x
mean(x)
median(x)
Mode(x)

#2.- Obtenga los deciles de los números en x
quantile(x, seq(0.1,0.9, by = 0.1))

#3.- Encuentre la rango intercuartílico, la desviación estándar y varianza muestral de las mediciones en x
IQR(x)
sd(x)
var(x)

# RETO 2

str(mtcars)

summary(mtcars)

head(mtcars)

View(mtcars)

# RETO 3

# 1.-Descargue los archivos csv que corresponden a las temporadas 2017/2018, 2018/2019, 2019/2020 y 2020/2021 
# de la Bundesliga 1 y que se encuentran en el siguiente enlace https://www.football-data.co.uk/germanym.php

# 2.-Importe los archivos descargados a R
lista <- lapply(dir(), read.csv)

# 3. Usando la función select del paquete dplyr, seleccione únicamente las columnas:

#Date
#HomeTeam
#AwayTeam
#FTHG
#FTAG
#FTR
lista <- lapply(lista, select, Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR)
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); head(lista[[4]])

# 4.-Combine cada uno de los data frames en un único data frame con ayuda de las funciones:
#rbind
#do.call
data <- do.call(rbind, lista)
View(data)
data <- mutate(data, Date = as.Date(Date, "%d-%m-%Y"))

               