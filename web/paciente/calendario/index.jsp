<%-- 
    Document   : index
    Created on : 1 may. 2023, 21:34:34
    Author     : bruno fragoso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Mi Calendario:: Ing. Urian Viera</title>
        <link rel="stylesheet" type="text/css" href="css/fullcalendar.min.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/home.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link href="css/ppp.css" rel="stylesheet">
    </head>
    <body>
        <%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();

        if (idPac < 1) {
            response.sendRedirect("index.html");
        }

        String alias = "";
        String correo = "";
        String edad = "";
        
        Base bd = new Base();
        bd.conectar();
        
        String strQry1 = "select * from pacientes where id_pac = '" + idPac + "'";
        ResultSet rsDatosPer = bd.consulta(strQry1);

        if (rsDatosPer.next()) {
            correo = rsDatosPer.getString(3);
            alias = rsDatosPer.getString(2);
            edad = rsDatosPer.getString(5);
        }
        
        String strQry2 = "select * from eventos";
        ResultSet rsEv = bd.consulta(strQry2);

        %>

       
        
         <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 "><h4 style="font-weight: bold"><%=Nombre%></h4></span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../principal_p.jsp">Inicio</a>
                        </li>
                        
                        <li class="nav-item">
                        </li>
                    </ul>
                    <div id="mayones">
                        <a class="btn btn-primary" href="../cerrar_sesion.jsp">
                            Cerrar sesion
                        </a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="mt-5"></div>

        <div class="container">
            <div class="row">
                <div class="col msjs">
                    <%@ include file="msjs.jsp" %>
                </div>
            </div>

        </div>
        <div id="calendar"></div>


        <%@ include file="modalNuevoEvento.jsp" %>
        <%@ include file="modalUpdateEvento.jsp" %>

        <script src ="js/jquery-3.0.0.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/moment.min.js"></script>	
        <script type="text/javascript" src="js/fullcalendar.min.js"></script>
        <script src='locales/es.js'></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#calendar").fullCalendar({
                    header: {
                        left: "prev,next today",
                        center: "title",
                        right: "month,agendaWeek,agendaDay"
                    },
                    locale: 'es',
                    defaultView: "month",
                    navLinks: true,
                    editable: true,
                    eventLimit: true,
                    selectable: true,
                    selectHelper: false,
//Nuevo Evento
                    select: function (start, end) {
                        $("#exampleModal").modal();
                        $("input[name=fecha_inicio]").val(start.format('DD-MM-YYYY'));
                        var valorFechaFin = end.format("DD-MM-YYYY");
                        var F_final = moment(valorFechaFin, "DD-MM-YYYY").subtract(1, 'days').format('DD-MM-YYYY'); //Le resto 1 dia
                        $('input[name=fecha_fin]').val(F_final);
                    },
                    events: [
            <%while(rsEv.next()){  %>
                        {
                            _id: '<%=rsEv.getString(1)%>',
                            title: '<%=rsEv.getString(2)%>',
                            start: '<%=rsEv.getString(4)%>',
                            end: '<%=rsEv.getString(5)%>',
                            color: '<%=rsEv.getString(3)%>'
                        },
            <% } %>
                    ],

                    //Eliminar Evento
                    eventRender: function (event, element) {
                        element
                                .find(".fc-content")
                                .prepend("<span id='btnCerrar'; class='closeon material-icons'>&#xe5cd;</span>");
                        //Eliminar evento
                        element.find(".closeon").on("click", function () {

                            var pregunta = confirm("Deseas Borrar este Evento?");
                            if (pregunta) {

                                $("#calendar").fullCalendar("removeEvents", event._id);
                                $.ajax({
                                    type: "POST",
                                    url: 'deleteEvento.jsp',
                                    data: {id: event._id},
                                    success: function (datos)
                                    {
                                        $(".alert-danger").show();
                                        setTimeout(function () {
                                            $(".alert-danger").slideUp(500);
                                        }, 3000);
                                    }
                                });
                            }
                        });
                    },

                    //Moviendo Evento Drag - Drop
                    eventDrop: function (event, delta) {
                        var idEvento = event._id;
                        var start = (event.start.format('DD-MM-YYYY'));
                        var end = (event.end.format("DD-MM-YYYY"));
                        $.ajax({
                            url: 'drag_drop_evento.jsp',
                            data: 'start=' + start + '&end=' + end + '&idEvento=' + idEvento,
                            type: "POST",
                            success: function (response) {
                                // $("#respuesta").html(response);
                            }
                        });
                    },

                    //Modificar Evento del Calendario 
                    eventClick: function (event) {
                        var idEvento = event._id;
                        $('input[name=idEvento]').val(idEvento);
                        $('input[name=evento]').val(event.title);
                        $('input[name=fecha_inicio]').val(event.start.format('DD-MM-YYYY'));
                        $('input[name=fecha_fin]').val(event.end.format("DD-MM-YYYY"));

                        $("#modalUpdateEvento").modal();
                    },

                });

                //Oculta mensajes de Notificacion
                setTimeout(function () {
                    $(".alert").slideUp(300);
                }, 3000);


            });

        </script>

    </body>
</html>
