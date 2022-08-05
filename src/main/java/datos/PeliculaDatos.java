package datos;

import domain.Pelicula;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.*;
import util.Conexion;

/**
 *
 * @author Camargo
 */
public class PeliculaDatos extends Conexion implements IPelicula {

    private String sql = "";
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private boolean operacionExitosa = false;

    @Override
    public boolean insert(Pelicula pelicula) {
        sql = "INSERT INTO pelicula (nombre_pelicula, year_pelicula, director_pelicula) VALUES (?,?,?)";

        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, pelicula.getNombrePelicula());
            stmt.setString(2, pelicula.getYearPelicula());
            stmt.setString(3, pelicula.getDirectorPeliculas());
            stmt.executeUpdate();

            operacionExitosa = true;

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Ocurrió un error: " + ex.toString());
            Logger.getLogger(PeliculaDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return operacionExitosa;
    }

    @Override
    public boolean update(Pelicula pelicula) {
        sql = "UPDATE pelicula SET nombre_pelicula = ?, year_pelicula = ?, director_pelicula = ? WHERE id_pelicula = ?";

        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, pelicula.getNombrePelicula());
            stmt.setString(2, pelicula.getYearPelicula());
            stmt.setString(3, pelicula.getDirectorPeliculas());
            stmt.setInt(4, pelicula.getIdPelicula());
            stmt.executeUpdate();

            operacionExitosa = true;

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Ocurrió un error: " + ex.toString());
            Logger.getLogger(PeliculaDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return operacionExitosa;
    }

    @Override
    public boolean delete(Pelicula pelicula) {
        sql = "DELETE FROM pelicula WHERE id_pelicula = ?";

        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, pelicula.getIdPelicula());
            stmt.executeUpdate();

            operacionExitosa = true;

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Ocurrió un error: " + ex.toString());
            Logger.getLogger(PeliculaDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return operacionExitosa;
    }

    @Override
    public List<Pelicula> select() {
        List<Pelicula> peliculas = new ArrayList();
        Pelicula pelicula = null;
        sql = "SELECT * FROM pelicula ORDER BY id_pelicula";
        
        try{
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while (rs.next()){
                pelicula = new Pelicula(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                peliculas.add(pelicula);
            }
            
        } catch(SQLException ex){
            operacionExitosa = false;
            System.out.println("Ocurrió un error: " + ex.toString());
            Logger.getLogger(PeliculaDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return peliculas;
    }
    
    public Pelicula selectById(int id) {
        Pelicula pelicula = null;
        sql = "SELECT * FROM pelicula WHERE id_pelicula = ? ORDER BY id_pelicula";
        
        try{
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            
            if (rs.next()){
                pelicula = new Pelicula(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
            
        } catch(SQLException ex){
            operacionExitosa = false;
            System.out.println("Ocurrió un error: " + ex.toString());
            Logger.getLogger(PeliculaDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return pelicula;
    }

}
