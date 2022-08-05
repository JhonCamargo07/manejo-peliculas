CREATE DATABASE peliculas;
USE peliculas;

CREATE TABLE `pelicula` (
  `id_pelicula` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nombre_pelicula` varchar(100) NOT NULL,
  `year_pelicula` date NOT NULL,
  `director_pelicula` varchar(100) NOT NULL
)
