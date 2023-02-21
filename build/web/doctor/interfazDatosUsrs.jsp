<%-- 
    Document   : interfazDatosUsrs
    Created on : 17 nov. 2022, 12:26:19
    Author     : bruno fragoso
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/128/1787/1787077.png" type="image/gif" />
        <link href="inicio_pac.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idDoc = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        int idPac = Integer.parseInt(request.getParameter("idPac"));
        String nombPac = request.getParameter("nombPac");
        String Nombre = String.valueOf(miSessiondelUsuario.getAttribute("Nombre"));
        miSessiondelUsuario.setAttribute("idPac", idPac);
        
        %>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 "><h4>&nbsp;<%=Nombre%></h4></span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="principal_d.jsp">Inicio</a>
                        </li>
                    </ul>
                    <a class="btn btn-primary" href="cerrar_sesion.jsp">Cerrar sesion</a>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row" style="margin-top: 3em; margin-bottom: 3em;">
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3" id="izq">
                    <div id="gride" class="p-4 centrado">
                        <div class="centrado" id="tit_nom">
                            <h1><%=nombPac%></h1>
                        </div>
                        <div class="centrado cont_btn">
                            <a class="btn btn-primary" href="Chat.jsp?idPac=<%=idPac%>" role="button" style=" width: 210px;"><h3>Chatear</h3></a>
                        </div>
                        <div class="centrado cont_btn">
                            <a class="btn btn-primary" href="Diario_pac.jsp#?idPac=<%=idPac%>" role="button" style="  width: 210px;"><h3>Leer diario</h3></a>
                        </div>
                        <div class="centrado cont_btn">
                            <a class="btn btn-primary" href="#?idPac=<%=idPac%>" role="button" style=" width: 210px;"><h3>Revisar tests</h3></a>
                        </div>
                        <div class="centrado cont_btn">
                            <a class="btn btn-primary" href="#?idPac=<%=idPac%>" role="button" style=" width: 210px;"><h3>Citas</h3></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9 p-4 centrado" id="der">

                    <div id="precon">
                        <h1 align="center" style="margin-top: 1em;">Pre entrevista</h1>
                        <div class="p-4" id="preent">
                            <%
                            String razon = "";
                            String conducta = "";
                            String relevancia = "";
                            String frecuencia = "";
                            String origen = "";
                            
                            Base bd = new Base();
                            bd.conectar();
                            String cons = "select * from tabla_prentrevista where id_pac='"+ idPac +"';";
                            ResultSet resConsulta = bd.consulta(cons);
                            if(resConsulta.next()){
                                razon = resConsulta.getString(2);
                                conducta = resConsulta.getString(3);
                                relevancia = resConsulta.getString(4);
                                frecuencia = resConsulta.getString(5);
                                origen = resConsulta.getString(6);
                            }
                            %>
                            <h4>La razon de la consulta es:</h4>
                            <h6><%=razon%></h6>
                            <h4>La conducta que presenta es:</h4>
                            <h6><%=conducta%></h6>
                            <h4>Le afecta en:</h4>
                            <h6><%=relevancia%></h6>
                            <h4>La frecuencia con la que le pasa:</h4>
                            <h6><%=frecuencia%></h6>
                            <h4>Esto comenzo desde:</h4>
                            <h6><%=origen%></h6>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
