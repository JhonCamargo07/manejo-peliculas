package controller;

import datos.PeliculaDatos;
import domain.Pelicula;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author Camargo
 */
@WebServlet(name = "PeliculaController", urlPatterns = {"/Pelicula"})
public class PeliculaController extends HttpServlet {

    private PeliculaDatos peliculaDao = new PeliculaDatos();
    private Pelicula pelicula = new Pelicula();
    private ServletContext aplication = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.listar(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idPelicula = request.getParameter("idPelicula");
        String nombrePelicula = request.getParameter("nombrePelicula");
        String yearPelicula = request.getParameter("yearPelicula");
        String directorPelicula = request.getParameter("directorPelicula");
        String accion = request.getParameter("accion");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        switch (opcion) {
            case 1: // Consultar
                this.consultar(request, response, Integer.parseInt(idPelicula), accion);
                break;
            case 2: // Insertar
                pelicula.setNombrePelicula(nombrePelicula);
                pelicula.setDirectorPeliculas(directorPelicula);
                pelicula.setYearPelicula(yearPelicula);
                this.insertar(request, response);
                break;
            case 3: // Actualizar
                pelicula.setNombrePelicula(nombrePelicula);
                pelicula.setDirectorPeliculas(directorPelicula);
                pelicula.setYearPelicula(yearPelicula);
                pelicula.setIdPelicula(Integer.parseInt(idPelicula));
                this.actualizar(request, response);
                break;
            case 4: // Eliminar
                pelicula.setIdPelicula(Integer.parseInt(idPelicula));
                this.eliminar(request, response);
                break;
            default:
                this.listar(request, response);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Pelicula> peliculas = peliculaDao.select();

        aplication = request.getServletContext();

        aplication.setAttribute("peliculas", peliculas);
        response.sendRedirect("peliculas.jsp");
    }

    private void generarMensaje(HttpServletRequest request, HttpServletResponse response, String titulo, String descripcion) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("titulo", titulo);
        sesion.setAttribute("descripcion", descripcion);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (peliculaDao.insert(pelicula)) {
            this.generarMensaje(request, response, "Pelicula insertada", "La pelicula se insertó correctamente");
        } else {
            this.generarMensaje(request, response, "Error al insertar la pelicula", "Nuestro sitio experimenta fallos, por favor intente más tarde");
        }
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (peliculaDao.update(pelicula)) {
            this.generarMensaje(request, response, "Pelicula actualizada", "La pelicula se actualizó correctamente");
        } else {
            this.generarMensaje(request, response, "Error al actualizar la pelicula", "Nuestro sitio experimenta fallos, por favor intente más tarde");
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (peliculaDao.delete(pelicula)) {
            this.generarMensaje(request, response, "Pelicula eliminada", "La pelicula se eliminó correctamente");
        } else {
            this.generarMensaje(request, response, "Error al eliminar la pelicula", "Nuestro sitio experimenta fallos, por favor intente más tarde");
        }
    }

    private void consultar(HttpServletRequest request, HttpServletResponse response, int id, String accion) throws IOException, ServletException {
        Pelicula pelicula = peliculaDao.selectById(id);

        request.setAttribute("pelicula", pelicula);
        if (accion.equals("delete")) {
            request.getRequestDispatcher("peliculas.jsp").forward(request, response);
        } else {
            request.setAttribute("delete", false);
            request.getRequestDispatcher("WEB-INF/paginas/comunes/agregarPelicula.jsp").forward(request, response);
        }
    }
}
