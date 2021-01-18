data <- read.csv("C:/Users/alana/Documents/GitHub/Data-Science/Modulo 2/Sesion 3/R1 Data/BD_Altura_Alunos.csv")
names(data)
str(data)

hist(data$Altura, breaks = seq(120,200, 5), 
     main = "Histograma de Altura de Alumnos",
     xlab = "Mediciones",
     ylab = "Frecuencia")
str(data)

data2 <- read.csv("C:/Users/alana/Documents/GitHub/Data-Science/Modulo 2/Sesion 3/players_stats.csv")
str(data2)

data2 %>%
  ggplot() + 
  aes(MIN) +
  geom_histogram(binwidth = 100, fill = "blue") +
  ggtitle("Histograma de Mediciones") +
  ylab("Frecuencia") +
  xlab("Mediciones") + 
  geom_vline(xintercept =  mean(data2$MIN), col = "red", lwd = 1.5, lty =2)+
  theme_light()

data2 %>%
  ggplot() + 
  aes(Age) +
  geom_histogram(binwidth = 2, fill = "blue") +
  ggtitle("Histograma de Mediciones") +
  ylab("Frecuencia") +
  xlab("Mediciones") + 
  geom_vline(xintercept =  mean(na.omit(data2$Age)), col = "red", lwd = 1.5, lty =2)+
  theme_light()

(my_scatplot <- ggplot(data2, 
                       aes(x = Weight, y = Height)) + 
    geom_point())
pos <- which.max(data2$Height)
paste("El jugador más alto es: ",data2$Name[pos],", con una altura de: ",data2$Height[pos])

pos <- which.min(data2$Height)
paste("El jugador más bajito es: ",data2$Name[pos],", con una altura de: ",data2$Height[pos])

paste("La altura promedio es: ",mean(na.omit(data2$Height)))

data2 %>% ggplot( aes(AST.TOV, PTS )) +
  geom_point() + 
  facet_wrap("Pos")

library(TSA)
AP <- AirPassengers
ts(AP)
plot (apts)
apts <- ts(AP)
da <- decompose(AP, type = "additive")

plot(da)
dm <- decompose(AP, type = "multiplicative")

plot(dm)
