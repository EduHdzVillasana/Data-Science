CREATE DATABASE IF NOT EXISTS bedu_test_2;
-- DROP DATABASE ID EXISTS bedu_test_2;

USE bedu_test_2;

CREATE TABLE IF NOT EXISTS usuario(
	id INT PRIMARY KEY,
    genero CHAR(1),
    edad INT,
    ocupacion INT,
    cp VARCHAR(20)
);

-- RETO 1
-- Crear la tabla movies (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos).

CREATE TABLE IF NOT EXISTS pelicula(
	id INT PRIMARY KEY,
    titulo VARCHAR(100),
    generos VARCHAR(100)
);

-- Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)

CREATE TABLE IF NOT EXISTS rating(
	id_usuario INT,
    id_pelicula INT,
    rating INT,
    fecha INT,
    PRIMARY KEY (id_usuario, id_pelicula),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_pelicula) REFERENCES pelicula(id)
);


-- SE IMPORTÓ user.csv

SELECT * FROM usuario;
SELECT * FROM pelicula;
SELECT * FROM rating;

