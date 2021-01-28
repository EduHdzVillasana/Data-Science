# Retos Sesion 6

# Reto 1
# 1.- Simula un proceso AR(1) de la forma x[t] = 0.5 * x[t-1] + w[t] para t = 1, 2, ..., 200 
#     y muestra gráficamente la serie de tiempo obtenida
x <- w <- rnorm(200)
for(t in 2:200)
{
  x[t] <- 0.5 * x[t-1] + w[t]
}
plot(x, type = "l", xlab = "", ylab = "")
title(main = "proceso ar(1) simulado",
      xlab = "tiempo",
      ylab = expression(x[t]))

# 2.- Obtén el correlograma y el correlograma parcial del proceso AR(1) simulado

acf(x, main = "")
title(main = "Correlograma", 
      sub = expression(x[t]==0.5*x[t-1]+w[t]))

pacf(x, main = "")
title(main = "Correlograma Parcial", 
      sub = expression(x[t]==0.5*x[t-1]+w[t]))

# 3.- Ajusta un modelo autorregresivo a la serie simulada utilizando la función ar, observa 
#     el orden del modelo y el parámetro estimado (los parámetros estimados)

x.ar <- ar(x, method = "mle")
x.ar$order
x.ar$ar


# Reto 2

x <- arima.sim(model = list(order = c(1, 1, 1), ar = 0.6, ma = 0.2), n = 1000)

fit <- arima(x, order = c(1, 1, 1))

coefficients(fit)

acf(resid(fit), main = "")

pred <- predict(fit, n.ahead = 3)
pred$pred






