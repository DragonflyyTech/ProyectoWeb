<!DOCTYPE html>
<!-- -->
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();

        if (idPac < 1) {
            response.sendRedirect("index.html");
        }

        String nombre = "";
        String correo = "";
        String id = "";

        Base bd = new Base();
        bd.conectar();
        String strQry = "select * from pacientes where id_pac = '" + idPac + "'";
        ResultSet rsDatosPer = bd.consulta(strQry);

        if (rsDatosPer.next()) {
            /*nombre = rsDatosPer.getString("alias_pac");*/
            correo = rsDatosPer.getString(3);
        }

    %>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <!-- css personalizado-->
        <link href="ppp.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

    </head>

    <body>
        <!-- bootstrap js-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

        <!-- barra de navegacion -->
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 "><h4><%=Nombre%></h4></span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="principal_p.jsp">Inicio</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Acciones</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Test</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="diario.jsp">Diario</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="Chat.jsp">Chat</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="Calendario.jsp">Citas</a></li>
                            </ul>
                        </li>
                        <!--  <li class="nav-item">
                          <a class="nav-link disabled">Disabled</a>
                        </li>-->
                    </ul>
                    <span class="navbar-brand mb-0 "><%=correo%></span>
                </div>
            </div>
        </nav>
        <!-- cuerpo de la pagina-->
        <div style="width: 100%;">
            <div id="sis">
                <img class="img" src="https://w.wallhaven.cc/full/8o/wallhaven-8odvgo.jpg" alt="Car in desert">
            </div>
            <div class="col-sm12 col-md-12 col-lg-12 col-xl-12"> 
                <div id="forms_citas_cont" class="centrado p-4">
                    <div id="forms_citas" class="container">

                    </div> 
                </div>
                <div id="menu_op" class="container" >
                    <div class="row">
                        <div class="col-sm12 col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="card" style="width:100%;">
                                <div class="card-body">
                                    <h4 class="card-title">Test</h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Realizar cuestionarios</h6>
                                    <p class="card-text">Desde cuestionarios para saber si cuenta con algun problema mental, hasta un prediagnostico.</p>
                                    <button class="custom-btn btn-5" onclick="location.href = ''"><h4>Iniciar tests</h4></button>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm12 col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="card" style="width:100%;">
                                <div class="card-body">
                                    <h4 class="card-title">Diario</h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Llevar una bitácora</h6>
                                    <p class="card-text">Puedes registrar todos tus dias y como te has sentido, para que su doctor le de seguimiento.</p>
                                    <button class="custom-btn btn-15" onclick="location.href = 'diario.jsp'"><h4>Escribir!</h4></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm12 col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="card" style="width:100%;">
                                <div class="card-body">
                                    <h4 class="card-title">Chat</h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Iniciar chat</h6>
                                    <p class="card-text">Si te sientes con la nesecidad de hablar con tu doctor, puedes enviarle un mensaje.</p>
                                    <button class="custom-btn btn-14" onclick="location.href = 'Chat.jsp'"><h4>Chatear</h4></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm12 col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="card" style="width:100%;">
                                <div class="card-body">
                                    <h4 class="card-title">Citas</h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Agendar citas</h6>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <button class="custom-btn btn-3" onclick="location.href = 'Calendario.jsp'" ><span><h4>Agendar una cita</h4></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>

</html>