# Postwork Sesi�n 3
# Equipo 12
setwd("C:/Users/alana/Documents/GitHub/Data-Science/Modulo 2/Sesion 3/Postwork Files")
# 1.- Con el �ltimo data frame obtenido en el postwork de la sesi�n 2, elabora 
#     tablas de frecuencias relativas para estimar las siguientes probabilidades:
library(dplyr)
library(ggplot2)
#u1718 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
#u1819 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
#u1920 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"

#download.file(url = u1718, destfile = "SP1-1718.csv", mode = "wb")
#download.file(url = u1819, destfile = "SP1-1819.csv", mode = "wb")
#download.file(url = u1920, destfile = "SP1-1920.csv", mode = "wb")

lista <- lapply(dir(), read.csv)
lista <- lapply(lista, select, Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR)

lista[[1]] <- mutate(lista[[1]], Date = as.Date(Date, "%d/%m/%y"))
lista[[2]] <- mutate(lista[[2]], Date = as.Date(Date, "%d/%m/%Y"))
lista[[3]] <- mutate(lista[[3]], Date = as.Date(Date, "%d/%m/%Y"))

data <- do.call(rbind, lista)

FTHG <- data$FTHG
FTAG <- data$FTAG

# 1.1.- La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
houseGols <- round(table(FTHG)/length(FTHG),2)

# 1.2.- La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)
awayGols <- round(table(FTAG)/length(FTAG),2)

# 1.3.- La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que 
#       juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)
jointProbability <- round(table(FTHG,FTAG)/length(FTAG),2)

# 2.- Realiza lo siguiente:
# 2.1.- Un gr�fico de barras para las probabilidades marginales estimadas del n�mero de goles que 
#       anota el equipo de casa
p <- plot(houseGols, main = "Probabilidad Marginal Estimada del N�mero de Goles que Anota el Equipo de Casa",
          xlab = "Goles Anotados", ylab = "Probabilidad")
p

# 2.2.- Un gr�fico de barras para las probabilidades marginales estimadas del n�mero de goles que anota el 
#       equipo visitante.

p <- plot(awayGols, main = "Probabilidad Marginal Estimada del N�mero de Goles que Anota el Equipo Visitante",
          xlab = "Goles Anotados", ylab = "Probabilidad")
p

# 2.3.- Un HeatMap para las probabilidades conjuntas estimadas de los n�meros de goles que anotan el equipo de 
#       casa y el equipo visitante en un partido.
p <- heatmap(jointProbability)
p
