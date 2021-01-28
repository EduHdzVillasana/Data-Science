# Postwork Sesion 4
# Equipo 12

# **** Recuperando los datos del los postworks anteriores ****
library(dplyr)
library(ggplot2)
setwd("C:/Users/alana/Documents/GitHub/Data-Science/Modulo 2/Sesion 4/Postwork Files")

lista <- lapply(dir(), read.csv)
lista <- lapply(lista, select, Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR)

lista[[1]] <- mutate(lista[[1]], Date = as.Date(Date, "%d/%m/%y"))
lista[[2]] <- mutate(lista[[2]], Date = as.Date(Date, "%d/%m/%Y"))
lista[[3]] <- mutate(lista[[3]], Date = as.Date(Date, "%d/%m/%Y"))

data <- do.call(rbind, lista)

FTHG <- data$FTHG
FTAG <- data$FTAG

houseGols <-table(FTHG)/length(FTHG)
awayGols <- table(FTAG)/length(FTAG)
jointProbability <- table(FTHG,FTAG)/length(FTAG)

# Desarrollo del Postwork

# 1.- Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote
#     X=x goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6),
#     en un partido. Obtén una tabla de cocientes al dividir estas probabilidades 
#     conjuntas por el producto de las probabilidades marginales correspondientes.

# Creación del vector con el producto de las probabilidades marginales
PPM <- c()
for (i in 1:7)
{
  for (j in 1:9)
  {
    tmp <- as.numeric(houseGols[j][1]*awayGols[i][1])
    PPM <- c(PPM,tmp)
  }
}

(result <- jointProbability/PPM)


# 2.- Mediante un procedimiento de boostrap, obtén más cocientes similares a los 
#     obtenidos en la tabla del punto anterior. Esto para tener una idea de las 
#     distribuciones de la cual vienen los cocientes en la tabla anterior. Menciona
#     en cuáles casos le parece razonable suponer que los cocientes de la tabla en 
#     el punto 1, son iguales a 1 (en tal caso tendríamos independencia de las 
#     variables aleatorias X y Y).














