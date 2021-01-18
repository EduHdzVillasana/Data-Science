# Reto 1
# 1.- Leer el archivo "netflix_titles.csv" desde GitHub
netflix.titles <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")

# 2.- Obtener la dimensión y el tipo de objeto que se obtiene
dim(netflix.titles); class(netflix.titles)

# 3.- Obtener los títulos que se estrenaron después del 2015. 
# Almacenar este df en una variable llamada net.2015

str(netflix.titles)
cols <- which(netflix.titles$release_year>2015)
net.2015 <- netflix.titles[cols,]

# 4.- Escribir los resultados en un archivo .csv llamado res.netflix.csv

write.csv(net.2015,file = "res.netflix.csv")
