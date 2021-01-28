# Postwork Sesión 5
# Equipo 12
library(dplyr)
library(fbRanks)
setwd("C:/Users/alana/Documents/GitHub/Data-Science/Modulo 2/Sesion 5/Postwork Files")

# 1.- A partir del conjunto de datos de soccer de la liga española de las temporadas 
#     2017/2018, 2018/2019 y 2019/2020, crea el data frame SmallData, que contenga las
#     columnas date, home.team, home.score, away.team y away.score; esto lo puedes
#     hacer con ayuda de la función select del paquete dplyr. Luego crea un directorio
#     de trabajo y con ayuda de la función write.csv guarde el data frame como un archivo
#     csv con nombre soccer.csv. Puedes colocar como argumento row.names = FALSE en write.csv.
lista <- lapply(dir(), read.csv)
lista <- lapply(lista, select, Date,HomeTeam,FTHG,AwayTeam,FTAG)

lista[[1]] <- mutate(lista[[1]], Date = as.Date(Date, "%d/%m/%y"))
lista[[2]] <- mutate(lista[[2]], Date = as.Date(Date, "%d/%m/%Y"))
lista[[3]] <- mutate(lista[[3]], Date = as.Date(Date, "%d/%m/%Y"))

data <- do.call(rbind, lista)
colnames(data) <- c("date", "home.team", "home.score", "away.team", "away.score")
data
write.csv(data,"soccer.csv", row.names = FALSE)

# 2.- Con la función create.fbRanks.dataframes del paquete fbRanks importa el archivo soccer.csv
#     a R y al mismo tiempo asignarlo a una variable llamada listasoccer. Se creará una lista
#     con los elementos scores y teams que son data frames listos para la función rank.teams.
#     Asigna estos data frames a variables llamadas anotaciones y equipos.
listasoccer <- create.fbRanks.dataframes("soccer.csv")
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

# 3.- Con ayuda de la función unique crea un vector de fechas (fecha) que no se repitan y que
#     correspondan a las fechas en las que se jugaron partidos. Crea una variable llamada n
#     que contenga el número de fechas diferentes. Posteriormente, con la función rank.teams
#     y usando como argumentos los data frames anotaciones y equipos, crea un ranking de equipos
#     usando únicamente datos desde la fecha inicial y hasta la penúltima fecha en la que se
#     jugaron partidos, estas fechas las deberá especificar en max.date y min.date. Guarda los
#     resultados con el nombre ranking.
fecha <- unique(anotaciones$date)
n <- length(fecha)
min.date <- fecha[1]
max.date <- fecha[n-1]
ranking <- rank.teams(scores = anotaciones, teams = equipos, max.date = max.date, min.date = min.date)


# 4.- Finalmente estima las probabilidades de los eventos, el equipo de casa gana, el equipo
#     visitante gana o el resultado es un empate para los partidos que se jugaron en la última
#     fecha del vector de fechas fecha. Esto lo puedes hacer con ayuda de la función predict y
#     usando como argumentos ranking y fecha[n] que deberá especificar en date.


predict(ranking, date = fecha[n])




