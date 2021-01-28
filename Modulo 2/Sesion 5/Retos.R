# Retos Sesion 5
# **** Reto 1 ****
#   Desarrollo: Se cree que entre las variables x y y del archivo csv adjunto, podría haber una relación 
#   más o menos lineal. Para tener más evidencia sobre esto lleve a cabo lo siguiente:

# 1.- Realice el gráfico de dispersión de los datos
df <- read.csv("datoslineal.csv")
attach(df)
plot(x,y)

# 2.- Ajuste un modelo de regresión lineal simple a los datos, muestre un resumen del modelo ajustado y 
#     trace la recta de regresión estimada junto con el gráfico de dispersión
m1 <- lm(y~x)
summary(m1)

plot(x, y, pch = 16)
abline(lsfit(x,y)) # Trazamos la recta de regresión estimada

# 3.- Obtenga algunas gráficas de diagnóstico y diga si es razonable suponer para los errores aleatoriedad, 
#     normalidad y varianza constante.
anova(m1)
par(mfrow = c(2, 2))
plot(m1)

# **** Reto 2 ****
#    Desarrollo: En el archivo de datos csv adjunto se encuentran observaciones correspondientes a dos clases
#   diferentes indicadas por la variable y. Únicamente hay dos variables predictoras o características. 
#   A continuación realice los siguientes requerimientos:

# 1.- Carga los paquetes ggplot2 y e1071; observe algunas características del data frame con las funciones tail 
#     y dim. Obtenga el gráfico de dispersión de los datos diferenciando las dos clases.

# 2.- Genera de manera aleatoria un vector de índices para filtrar un conjunto de entrenamiento a partir del 
#     conjunto de datos dado. Con ayuda de las funciones tune y svm ajuste máquinas de vectores de soporte 
#     con un kernel radial a los datos de entrenamiento, para valores del parámetro cost igual a 
#     0.1, 1, 10, 100, 1000 y valores del parámetro gamma igual a 0.5, 1, 2, 3, 4. Obtenga un resumen de los resultados.

# 3.- Con el modelo que tuvo el mejor desempeño en el paso anterior realiza clasificación con la función predict 
#     y el conjunto de datos de prueba. Muestre la matriz de confusión.


# **** Reto 3 ****

# 1.- Observe algunas características del data frame Default del paquete ISLR, con funciones tales como head, tail, dim y str.

# 2.- Usando ggplot del paquete ggplot2, realice el gráfico de dispersión con la variable balance en el eje x, la variable 
#     income en el eje y, distinga las distintas categorías en la variable default usando el argumento colour. Lo anterior 
#     para estudiantes y no estudiantes usando facet_wrap.

# 3.- Genere un vector de índices llamado train, tomando de manera aleatoria 5000 números de los primeros 10,000 números naturales,
#     esto servirá para filtrar el conjunto de entrenamiento y el conjunto de prueba del data frame Default. Realice el gráfico de 
#     dispersión análogo al punto 2, pero para los conjuntos de entrenamiento y de prueba.

# 4.- Ahora utilice la función tune junto con la función svm para seleccionar el mejor modelo de un conjunto de modelos,
#     los modelos considerados serán aquellos obtenidos al variar los valores de los parámetros cost y gamma (use un kernel radial).

# 5.- Con el mejor modelo seleccionado y utilizando el conjunto de prueba, obtenga una matriz de confusión, para observar
#     el número de aciertos y errores cometidos por el modelo. Obtenga la proporción total de aciertos y la matriz que 
#     muestre las proporciones de aciertos y errores cometidos pero por categorías.

# 6.- Ajuste nuevamente el mejor modelo, pero ahora con el argumento decision.values = TRUE. Obtenga los valores predichos 
#     para el conjunto de prueba utilizando el mejor modelo, las funciones predict, attributes y el argumento 
#     decision.values = TRUE dentro de predict.

# 7.- Realice clasificación de las observaciones del conjunto de prueba utilizando los valores predichos por el modelo y un umbral 
#     de decisión igual a cero. Obtenga la matriz de confusión y proporciones como anteriormente hicimos.

# 8.- Repita el paso 7 pero con un umbral de decisión diferente, de tal manera que se reduzca la proporción del error más grave 
#     para la compañía de tarjetas de crédito.