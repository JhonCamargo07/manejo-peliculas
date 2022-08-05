<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="domain.Pelicula"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="es_CO" />
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/dca352768f.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
        <div class="container">
            <h1>Peliculas</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" class="text-center">#</th>
                        <th scope="col" class="text-center">Nombre</th>
                        <th scope="col" class="text-center">Director</th>
                        <th scope="col" class="text-center">Año</th>
                        <th scope="col" class="text-center">Editar</th>
                        <th scope="col" class="text-center">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pelicula" items="${peliculas}" varStatus="status">
                        <tr>
                            <td>${pelicula.idPelicula}</td>
                            <td>${pelicula.nombrePelicula}</td>
                            <td>${pelicula.directorPeliculas}</td>
                            <td>${pelicula.yearPelicula}</td>
                            <form action="${pageContext.request.contextPath}/Pelicula" method="POST">
                                <input type="hidden" name="idPelicula" value="${pelicula.idPelicula}">
                                <input type="hidden" name="opcion" value="1">
                                <input type="hidden" name="accion" value="select">
                                <td class="text-center text-danger"><button class="border-0 bg-transparent" type="submit"><i class="fas fa-edit text-info"></i></button></td>
                            </form>
                            <form action="${pageContext.request.contextPath}/Pelicula" method="POST">
                                <input type="hidden" name="idPelicula" value="${pelicula.idPelicula}">
                                <input type="hidden" name="opcion" value="1">
                                <input type="hidden" name="accion" value="delete">
                                <td class="text-center text-danger"><button class="border-0 bg-transparent" type="submit"><i class="fas fa-trash text-danger"></i></button></td>
                            </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </body>
</html>
<jsp:include page="/WEB-INF/paginas/comunes/alerta.jsp" />
<jsp:include page="/WEB-INF/paginas/comunes/agregarPelicula.jsp" />
<jsp:include page="/WEB-INF/paginas/comunes/delete.jsp" />