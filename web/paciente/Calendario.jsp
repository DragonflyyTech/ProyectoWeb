<%-- 
    Document   : Calendario
    Created on : Nov 9, 2022, 10:39:43 AM
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="csscalendario.css" rel="stylesheet">
        <link href="ppp.css" rel="stylesheet">
        <link href="csscalendario.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
       <script src="cal_old/cod_cal.js" defer></script>
    </head>
    <body>
        <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();
        /*
        Base bd = new Base();
        bd.conectar();
        String consulta = "select * from doc_pac, doctores where id_pac='" + idPac + "'";
        ResultSet resConsulta = bd.consulta(consulta);
        if(resConsulta.next()){
            Nombre_Doc = resConsulta.getString("nom_doc");
            relacion_docpac= resConsulta.getInt(1);
        }
        resConsulta.close();
        bd.cierraConexion();
*/

        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
        
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 "><h4><%=Nombre%></h4></span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="principal_p.jsp#pagina_abajo" style="margin-left: 20px;">Inicio</a>
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
                    </ul>
                </div>
            </div>
        </nav>
        <div  class="row">
            <div class="col-sm12 col-md-4 col-lg-4 col-xl-4"> 
                <div id="forms_citas_cont" class="centrado p-4">
                    <div id="forms_citas" class="container">
                        <form>

                        </form>
                    </div> 
                </div>
            </div>
            <div class="col-sm12 col-md-8 col-lg-8 col-xl-8 centrado"> 
                <div id="calendario_fondo">  
                        <div class="calendario">
                            <!--<div id="calendar"></div>
                            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>  -->     
                        </div>
                </div>
            </div>
        </div>


    </body>
</html>
