# Retos Sesión 4
# 18 de enero 2021
library(ggplot2)
library(reshape2)
# ******** Reto 1 ********

# Distribución Binomial:
# Consideremos un experimento binomial con n = 35 pruebas idénticas e independientes, 
# en donde la probabilidad de éxito en cada prueba es p = 0.51. Encuentre lo siguiente:

n <- 35
p <- 0.51

# 1.- La probabilidad de observar exactamente 10 éxitos
dbinom (x = 10, size = n, prob = p)

# 2.- La probabilidad de observar 10 o más exitos
pbinom(q = 10, size = n, prob = p, lower.tail = FALSE)

# 3.- El cuantil de orden 0.5
qbinom(p = 0.50, size = n, prob = p)

# 4.- Genere una muestra aleatoria de tamaño 1000 de esta distribución, 
# construya una tabla de frecuencias relativas con los resultados y realice el gráfico de barras 
# de los resultados que muestre las frecuencias relativas.
muestra <- rbinom(n = 1000, size = n, prob = p)
df1 <- as.data.frame(table(muestra)/length(muestra))
names(df1) <- c("Exitos", "FR")

ggplot(df1, aes(x = Exitos, y = FR)) + 
  geom_bar (stat="identity", position = "dodge") 

# Distribución Normal:

# Considere una variable aleatoria normal con media 110 y desviación estándar 7. Realice lo siguiente:
mean <- 110
std <- 7

# 1.- Grafique la función de densidad de probabilidad
x <- seq(-4, 4, 0.01)*std + mean
y <- dnorm(x, mean = mean, sd = std)
plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == mean, " y ", sigma == std)))
abline(v = mean, lwd = 2, lty = 2)

# 2.- Encuentre la probabilidad de que la v.a. sea mayor o igual a 140
pnorm(q = 182, mean = mean, sd = std, lower.tail = FALSE)

# 3.- Encuentre el cuantil de orden 0.95
qnorm(p = 0.95, mean = mean, sd = std)

# 4.- Genere una muestra aleatoria de tamaño 1000 y realice el histograma de frecuencias relativas para esta muestra
muestra <- rnorm(n = 1000, mean = mean, sd = std)
mdf <- as.data.frame(muestra)

ggplot(mdf, aes(muestra)) + 
  geom_histogram(colour = 'red', 
                 fill = 'blue', 
                 binwidth = 3) + 
  geom_vline(xintercept = mean(mdf$muestra), linetype="dashed", color = "black") + 
  ggtitle('Histograma para la muestra normal') + 
  labs(x = 'Valores obtenidos', y = 'Frecuencia')+
  theme(plot.title = element_text(hjust = 0.5, size = 16))  

# ******** Reto 2 ********

# 1.- Genere 1500 muestras de tamaño 67 de la distribución exponencial con parámetro 5

# 2.- Obtenga las 1500 medias correspondientes a cada una de las muestras

# 3.- Realice el histograma de frecuencias de las 1500 medias

# 4.- Encuentre la media muestral y desviación estándar muestral de las 1500 medias
# 5 .-Compare la media muestral encontrada en el paso anterior con la media real (1/5)
# de la población de la cual provienen las muestras

# 6.- Compare la desviación estándar muestral encontrada con la desviación estándar real (1/5) 
# de la población de la cual provienen las muestras pero dividida por 67 (el tamaño de las muestras)

# ******** Reto 3 ********

# Dada una muestra aleatoria de tamaño n = 10 de una distribución normal
# estamos interesados en contrastar las hipótesis H0: mu = 120 vs H1: mu < 120 (contraste de cola inferior).

# 1.- Decida si rechazar o no la hipótesis nula si el nivel de significancia es alpha = 0.05

# 2.- Obtenga el p-value de la prueba

# 3.- Lleve a cabo la prueba con la función t.test