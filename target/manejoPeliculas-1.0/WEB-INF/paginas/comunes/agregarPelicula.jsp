<%
    String mensajeBoton = "Registrar pelicula";
    String modalStatic = "";
    boolean hayUnaPeliculaConsultada = false;
    if (request.getAttribute("pelicula") != null && request.getAttribute("delete") != null) {
        mensajeBoton = "Actualizar pelicula";
        modalStatic = "data-backdrop=\"static\" data-keyboard=\"false\" tabindex=\"-1\"";
        hayUnaPeliculaConsultada = true;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        
        <script src="https://kit.fontawesome.com/dca352768f.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" <%= modalStatic%> id="agregarPelicula" tabindex="-1" aria-labelledby="agregarPelicula" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-info text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar pelicula</h5>
                        <button type="button" id="closeModal" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/Pelicula" method="POST">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="nombrePelicula" class="form-label">Nombre <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="nombrePelicula" name="nombrePelicula" value="${pelicula.nombrePelicula}">
                                <%
                                    if (request.getAttribute("pelicula") != null) {
                                %>
                                <input type="hidden" name="opcion" value="3">
                                <input type="hidden" name="idPelicula" value="${pelicula.idPelicula}">
                                <%
                                } else {
                                %>
                                <input type="hidden" name="opcion" value="2">
                                <%
                                    }
                                %>
                            </div>
                            <div class="mb-3">
                                <label for="yearPelicula" class="form-label">Año lanzamiento <span class="text-danger">*</span></label>
                                <input type="date" class="form-control" id="yearPelicula" name="yearPelicula" value="${pelicula.yearPelicula}">
                            </div>
                            <div class="mb-3">
                                <label for="directorPelicula" class="form-label">Director <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="directorPelicula" name="directorPelicula" value="${pelicula.directorPeliculas}">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="close" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary"><%= mensajeBoton%></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%
        if (hayUnaPeliculaConsultada) {
    %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    <script>
        window.$('#agregarPelicula').modal('show');
        $(document).on('click', '#closeModal', function () {
            location.href = "index.jsp";
        });
        $(document).on('click', '#close', function () {
            location.href = "index.jsp";
        });
    </script>      
    <%
        }
    %>
</body>
</html>