<%-- 
    Document   : Doctores
    Created on : 23 mar. 2023, 21:20:37
    Author     : bruno fragoso
    no pues que pendejo yo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <!-- css personalizado-->
        <link href="css/ppp.css" rel="stylesheet">
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
        int idDoc = 0;
        
        Base bd = new Base();
        bd.conectar(); 
        
        String strQry = "select * from pacientes where id_pac = '" + idPac + "'";
        ResultSet rsDatosPer = bd.consulta(strQry);

        if (rsDatosPer.next()) {
            correo = rsDatosPer.getString(3);
        }%>
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
                        <li class="nav-item">
                        </li>
                    </ul>
                    <div id="mayones">
                        <a class="btn btn-primary" href="cerrar_sesion.jsp">
                            Cerrar sesion
                        </a>
                    </div>
                </div>
            </div>
        </nav>
        <%
        
        String strQry4 = "select * from doc_pac where id_pac = '"+idPac+"';";
        ResultSet conexiones = bd.consulta(strQry4);
        if (conexiones.next()) {
            conexion = conexiones.getInt(1);
        }
        %>

        <div class="container">

            <%
                                      
                        int num_pac = 0;
                    
                        String strQry2 = "select * from doctores";
                        ResultSet relaciones = bd.consulta(strQry2);
                    
                        while (relaciones.next()){
                    
                            int id_doc = relaciones.getInt(1);
                            String nom = relaciones.getString(2);
                            String esp = relaciones.getString(7);
                        
                            int id_per = idPac;
                        
                            String strQry3 = "select * from doc_pac where id_doc = '"+id_doc+"';";
                            ResultSet doctores = bd.consulta(strQry3);

                            while(doctores.next()){num_pac++;}

                            if(num_pac <= 10){
            %>
            <div id="tarjeta_psicologo" class="">
                <div id="tps1">
                    <p><h2><%=nom%></h2></p>
                    <div>
                        <h3>
                            <P>Cuenta con: <%=num_pac%> pacientes</p>
                            <P>Especialidad teorica: <%=esp%> </p>  
                        </h3>
                    </div>
                </div>
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
            }%>

        </div>





        <%
    
    }catch (Exception ex) {%>

        <h1><%out.print("se ha cerrado la sesion");%></h1>  
        <a class="btn btn-secondary" href='../index.html'>regresar</a>

        <%
            }
        %>



    </body>
</html>
