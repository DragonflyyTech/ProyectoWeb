<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if(request.getParameter("e") != null) {%>
<div class="alert alert-success alert-dismissible fade show text-center" role="alert">
    <strong>Felicitaciones!</strong> El evento fue registrado correctamente.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}%>
<%if(request.getParameter("ea") != null) {%>
<div class="alert alert-success alert-dismissible fade show text-center" role="alert">
    <strong>Felicitaciones!</strong> El evento fue actualizado correctamente.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}%>

<div class="alert alert-danger alert-dismissible fade show text-center" role="alert" style="display: none;">
    <strong>Felicitaciones!</strong> El evento fue borrado correctamente.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>