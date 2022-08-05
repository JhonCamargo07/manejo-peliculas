package domain;

import java.sql.Date;


/**
 *
 * @author Camargo
 */
public class Pelicula {

    private int idPelicula;
    private String nombrePelicula;
    private String yearPelicula;
    private String directorPeliculas;

    public Pelicula() {
    }

    public Pelicula(String nombrePelicula) {
        this.nombrePelicula = nombrePelicula;
    }

    public Pelicula(String nombrePelicula, String yearPelicula, String directorPeliculas) {
        this.nombrePelicula = nombrePelicula;
        this.yearPelicula = yearPelicula;
        this.directorPeliculas = directorPeliculas;
    }

    public Pelicula(int idPelicula, String nombrePelicula, String yearPelicula, String directorPeliculas) {
        this.idPelicula = idPelicula;
        this.nombrePelicula = nombrePelicula;
        this.yearPelicula = yearPelicula;
        this.directorPeliculas = directorPeliculas;
    }

    public int getIdPelicula() {
        return idPelicula;
    }

    public void setIdPelicula(int idPelicula) {
        this.idPelicula = idPelicula;
    }

    public String getNombrePelicula() {
        return nombrePelicula;
    }

    public void setNombrePelicula(String nombrePelicula) {
        this.nombrePelicula = nombrePelicula;
    }

    public String getYearPelicula() {
        return yearPelicula;
    }

    public void setYearPelicula(String yearPelicula) {
        this.yearPelicula = yearPelicula;
    }

    public String getDirectorPeliculas() {
        return directorPeliculas;
    }

    public void setDirectorPeliculas(String directorPeliculas) {
        this.directorPeliculas = directorPeliculas;
    }

    @Override
    public String toString() {
        return "Pelicula{" + "idPelicula=" + idPelicula + ", nombrePelicula=" + nombrePelicula + ", yearPelicula=" + yearPelicula + ", directorPeliculas=" + directorPeliculas + '}';
    }

}
