<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>Chat</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/128/1787/1787077.png" type="image/gif" />
        <link href="css/Chat.css" rel="stylesheet">
        <script type="text/javascript">
            function ajax() {
                var req = new XMLHttpRequest();

                req.onreadystatechange = function () {
                    if (req.readyState === 4 && req.status === 200) {
                        document.getElementById("contenedormensajes").innerHTML = req.responseText;
                        scrolldown();
                    }
                }
                req.open('GET', 'ContChat.jsp');
                req.send();
                
            }
            setInterval(function(){ajax();}, 500);
        </script>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
         
         <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500&display=swap" rel="stylesheet">
    </head>
    <body onload="ajax();">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
        <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idDoc = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        
        int idPac = Integer.parseInt(request.getParameter("idPac"));
        
        if (idDoc < 1) {
            response.sendRedirect("index.html");
        }
        
        String Nombre_Pac="";
        int relacion_docpac = 0;
        String lado ="";
        String Nombre="";
        
        Base bd = new Base();
        bd.conectar();
        
        String strQry = "select * from doctores where id_doc = '" + idDoc + "'";
        ResultSet rsDatosPer = bd.consulta(strQry);

        if (rsDatosPer.next()) {
            Nombre = rsDatosPer.getString(2);
        }
        
        String consulta = "select * from doc_pac, pacientes where doc_pac.id_pac='"+ idPac +"' and pacientes.id_pac =doc_pac.id_pac;";
        ResultSet resConsulta = bd.consulta(consulta);
        
        if(resConsulta.next()){
            Nombre_Pac = resConsulta.getString("nom_pac");
            relacion_docpac= resConsulta.getInt(1);
        }
        
        
        %>
        <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
      <span class="navbar-brand mb-0 "><h4></h4></span>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
              <img src="https://cdn-icons-png.flaticon.com/128/1787/1787077.png" alt="Logo" width="30" height="24"
                     class="d-inline-block align-text-top">
                <a class="navbar-brand" href="#"><span id="">Psyche</span></a>
          </li>
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="principal_d.jsp">Inicio</a>
        </li>
        <!--<li class="nav-item dropdown">
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
        </li>-->
        </ul>
        <a class="btn btn-primary" href="cerrar_sesion.jsp">Cerrar sesion</a>
    </div>
  </div>
</nav>
        <div class="container centrado">
            <div id="caja_chat">
                <div id="titulo" class="centrado"><h2><%=Nombre_Pac%></h2>
                  <!--<button type="button" onclick="scrolldown();" class="btn btn-primary"><H5>bajar</H5></button>-->
                 
                </div>
                <div id="contenedormensajes" class="cacahuates p-1">
                </div>
                <form name="mensaje" method="post" action="Mandarmsj.jsp?idPac=<%=idPac%>">
                    <div id="mnsje" class="p-3">
                        <textarea name="contmnsj" id="contmnsj" class="form-control" maxlength="255" placeholder="Escribe tu mensaje"></textarea>
                        <button type="submit" id="enviar" value="enviar" class="btn btn-primary" style="background-color: #DAC6C5; border-color: #DAC6C5; height: 40px;">Enviar</button>
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
                        
                        const Chatbox = document.querySelector("#contenedormensajes");
            
                        function scrolldown(){
                            const a = Chatbox.scrollHeight;
                            Chatbox.scrollTop = a;
                        }
                    </script>
                </form>
            </div>
        </div>
    </body>
</html>
