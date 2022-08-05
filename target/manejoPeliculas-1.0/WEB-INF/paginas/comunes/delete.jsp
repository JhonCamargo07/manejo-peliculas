<%
    if (request.getAttribute("pelicula") != null) {
%>
<div class="modal fade" id="mensajeDelete">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h3 class="modal-title fw-bold lead">Eliminar pelicula</h5>
                    <button type="button" class="text-white bg-transparent border-0" id="closeModal" data-bs-dismiss="modal" aria-label="Close"><i class="fas fa-times"></i></button>
            </div>
            <form action="${pageContext.request.contextPath}/Pelicula" method="POST">
                <div class="modal-body">
                    <p>Año: ${pelicula.yearPelicula}</p>
                    <p>Nombre: ${pelicula.nombrePelicula}</p>
                    <p>Director: ${pelicula.directorPeliculas}</p>
                    <p>¿Seguro de que quiere borrar esta pelicula?</p>
                </div>

                <div class="modal-footer">
                    <input type="hidden" name="idPelicula" value="${pelicula.idPelicula}">
                    <input type="hidden" name="opcion" value="4">
                    <button type="button" class="btn btn-primary" id="close" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Sí, eliminar pelicula</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    window.$('#mensajeDelete').modal('show');
    $(document).on('click', '#close', function () {
        $('#mensajeDelete').modal('hide');
        $('#mensajeDelete').css('display', 'none');
        $('.modal-backdrop').css('display', 'none');
    });
    $(document).on('click', '#closeModal', function () {
        $('#mensajeDelete').modal('hide');
        $('#mensajeDelete').css('display', 'none');
        $('.modal-backdrop').css('display', 'none');
    });
</script>
<%
     }
%>