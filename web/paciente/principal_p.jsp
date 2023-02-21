<!DOCTYPE html>
<!-- -->
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Inicio</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/128/1787/1787077.png" type="image/gif" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <!-- css personalizado-->
        <link href="css/ppp.css" rel="stylesheet">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500&display=swap" rel="stylesheet">

    </head>

    <body>
        <%
        try{
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();

        if (idPac < 1) {
            response.sendRedirect("index.html");
        }

        String nombre = "";
        String correo = "";
        String id = "";
        int conexion = 0;

        Base bd = new Base();
        bd.conectar();
        String strQry = "select * from pacientes where id_pac = '" + idPac + "'";
        ResultSet rsDatosPer = bd.consulta(strQry);

        if (rsDatosPer.next()) {
            /*nombre = rsDatosPer.getString("alias_pac");*/
            correo = rsDatosPer.getString(3);
        }
    %>
        <!-- bootstrap js-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

        <!-- barra de navegacion -->
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 "><h4 style="font-weight: bold"><%=Nombre%></h4></span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="principal_p.jsp">Inicio</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Menú</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="Test.jsp">Test</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="diario.jsp">Diario</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="Chat.jsp">Chat</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item disabled" href="Calendario.jsp" >Citas</a></li>
                            </ul>
                        </li>
                        <!--  <li class="nav-item">
                          <a class="nav-link disabled">Disabled</a>
                        <span class="navbar-brand mb-0 "><%/*=correo*/%></span>
                        </li>-->
                    </ul>
                    <a class="btn btn-primary" href="cerrar_sesion.jsp">Cerrar sesion</a>
                </div>
            </div>
        </nav>
        <!-- cuerpo de la pagina-->
        <div style="width: 100%;">
            <div id="sis">
                <img class="img" src="https://images.unsplash.com/photo-1610889282378-76d4c8440b90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2llbG8lMjBibGFuY298ZW58MHx8MHx8&w=1000&q=80" alt="Car in desert">
                <div id="titulo" class="centrado"><a href="#forms_citas_cont" > <h1 style="font-weight: bold">Psyche</h1></a></div>
                <div id="degra"></div>
            </div>
            <div class="col-sm12 col-md-12 col-lg-12 col-xl-12" id="pagina_abajo"> 
                <div id="forms_citas_cont" class="centrado p-4">
                    <div id="forms_citas" class="container">

                    </div> 
                </div>
                <div id="menu_op" class="container" >
                    <div class="row">
                        <div class="col-sm12 col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="card" style="width:100%;">
                                <div class="card-body" style="box-shadow: 0px 0px 60px lightgray;">
                                    <h4 class="card-title" >Test</h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Realizar cuestionarios</h6>
                                    <p class="card-text">Desde cuestionarios para saber si cuenta con algun problema mental, hasta un prediagnostico.</p>
                                    <button class="custom-btn btn-5" onclick="location.href = 'Test.jsp'"><h4>Iniciar tests</h4></button>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm12 col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="card" style="width:100%;">
                                <div class="card-body" style="box-shadow: 0px 0px 60px lightgray;">
                                    <h4 class="card-title">Diario</h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Llevar una bitácora</h6>
                                    <p class="card-text">Puedes registrar todos tus dias y como te has sentido, para que su doctor le de seguimiento.</p>
                                    <button class="custom-btn btn-15" onclick="location.href = 'diario.jsp'"><h4>Escribir!</h4></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm12 col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="card" style="width:100%;">
                                <div class="card-body" style="box-shadow: 0px 0px 60px lightgray;">
                                    <h4 class="card-title">Chat</h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Iniciar chat</h6>
                                    <p class="card-text">Si te sientes con la nesecidad de hablar con tu doctor, puedes enviarle un mensaje.</p>
                                    <button class="custom-btn btn-14" onclick="location.href = 'Chat.jsp'"><h4>Chatear</h4></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm12 col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="card" style="width:100%;">
                                <div class="card-body" style="box-shadow: 0px 0px 60px lightgray;">
                                    <h4 class="card-title">Citas</h4>
                                    <h6 class="card-subtitle mb-2 text-muted">Agendar citas</h6>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <button  class="btn btn-primary disabled" onclick="location.href = 'Calendario.jsp'" disabled><span><h5>Agendar una cita</h5></span></button>
                                    <!-- class="custom-btn btn-3"  el boton de arriba va en h4 y la clase que debe llevar es la que esta aqui en este comentario :))-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 

        <button class="btn btn-primary" id="yep" type="button" data-bs-toggle="offcanvas" data-bs-target="#wakawaka" aria-controls="staticBackdrop">
        </button>

        <div class="offcanvas offcanvas-start" data-bs-backdrop="static" tabindex="-1" id="wakawaka" aria-labelledby="staticBackdropLabel">
            <div class="p-4">
                <div class="offcanvas-header">
                    <h4 class="offcanvas-title" id="staticBackdropLabel">Ups... parece que aun no cuentas con un doctor</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>

                <div class="offcanvas-body">
                    <div>
                        <p>A continuacion le mostraremos la lista de medicos disponibles</p>
                    </div>
                    <script>
                        var elemento = document.querySelector("#yep");
                        function sip() {
                            elemento.click();
                        }
                    </script>

                    <% 
        String strQry4 = "select * from doc_pac where id_pac = '"+idPac+"';";
        ResultSet conexiones = bd.consulta(strQry4);
        if (conexiones.next()) {
            conexion = conexiones.getInt(1);
        }else{
                    %>
                    <script>
                        sip();
                    </script>
                    <%
                                  
                    int num_pac = 0 ;
                    
                    String strQry2 = "select * from doctores";
                    ResultSet relaciones = bd.consulta(strQry2);
                    while (relaciones.next()){
                    
                    int id_doc = relaciones.getInt(1);
                    String nom = relaciones.getString(2);
                    int id_per = idPac;
                    
                    String strQry3 = "select * from doc_pac where id_doc = '"+id_doc+"';";
                    ResultSet doctores = bd.consulta(strQry3);
                    
                    while(doctores.next()){num_pac++;}
                    
                    if(num_pac <= 5){
                    %>
                    <div id="tarjeta_psicologo" class="centrado">
                        
                        <p><h3><%=nom%></h3></p>
                        <P>Cuenta con: <%=num_pac%> pacientes</p>
                        
                        <form name="datos" method="post" action="Agregar_doc.jsp" style="">
                            <input type="hidden" name="doc" id="doc" value="<%=id_doc%>">
                            <button type="submit" id="enviar" value="enviar" class="btn btn-primary"><H5>Elegir</H5></button>
                        </form>
                    </div>
                    <%
                        }else{
                         continue;
                        }
                    num_pac = 0;
                    }
            }
                    }catch (Exception ex) {%>

                    <h1><%out.print("se ha cerrado la sesion");%></h1>  
                    <a class="btn btn-secondary" href='../index.html'>regresar</a>
                    
                    <%
                        }
                    %>


                </div>
            </div>

        </div>
    </body>

</html>