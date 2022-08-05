package datos;

import domain.Pelicula;
import java.util.List;

/**
 *
 * @author Camargo
 */
public interface IPelicula {

    boolean insert(Pelicula pelicula);

    boolean update(Pelicula pelicula);

    boolean delete(Pelicula pelicula);

    List<Pelicula> select();
}
