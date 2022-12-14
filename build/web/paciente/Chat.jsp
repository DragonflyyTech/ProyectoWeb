<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>JSP Page</title>
        <link href="css/Chat.css" rel="stylesheet">
        <script type="text/javascript">
            function ajax() {
                var req = new XMLHttpRequest();

                req.onreadystatechange = function () {
                    if (req.readyState === 4 && req.status === 200) {
                        document.getElementById("contenedormensajes").innerHTML = req.responseText;
                    }
                }
                req.open('GET', 'ContChat.jsp');
                req.send();
            }
            setInterval(function(){ajax();}, 500);

        </script>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    </head>
    <body onload="ajax();">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
        <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();
        
        if (idPac < 1) {
            response.sendRedirect("index.html");
        }
        String Nombre_Doc="";
        int relacion_docpac = 0;
        String lado ="";
        
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
        
        %>
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
        </li>
      
      <span class="navbar-brand mb-0 "></span>-->
        </ul>
    </div>
  </div>
</nav>
        <div class="container centrado">
            <div id="caja_chat">
                <div id="titulo" class="centrado"><h2><%=Nombre_Doc%></h2></div>
                <div id="contenedormensajes" >
                </div>
                <form name="mensaje" method="post" action="Mandarmsj.jsp">
                    <div id="mnsje" class="p-3">
                        <textarea name="contmnsj" id="contmnsj" class="form-control" maxlength="255" placeholder="Escribe tu mensaje"></textarea>
                        <button type="submit" id="enviar" value="enviar" class="btn btn-primary"><H5>Enviar</H5></button>
                        <input type="hidden" name="Nombre" id="Nombre">
                        <input type="hidden" name="id_relacionDP" id="id_relacionDP">
                        <input type="hidden" name="fecha" id="fecha">
                    </div>
                    <script>
                        var fecha = new Date();
                        var Fecha = (fecha.getDate() + "/" + (fecha.getMonth() + 1) + "/" + fecha.getFullYear());
                        function dafecha() {
                        document.getElementById('Nombre').value = "<%=Nombre%>";
                        document.getElementById('id_relacionDP').value ="<%=relacion_docpac%>" ;
                        document.getElementById('fecha').value = Fecha.toString();
                        };
                        dafecha();
                    </script>
                </form>
            </div>
        </div>
    </body>
</html>
