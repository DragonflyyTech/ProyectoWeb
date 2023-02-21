<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>JSP Page</title>
        <link href="Chat.css" rel="stylesheet">
<%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();
        
        String lado ="";
        String color ="";
        Base bd = new Base();
        bd.conectar();
        String consulta2 = "select * from tabla_mensaje, doc_pac where tabla_mensaje.id_relacionDP = doc_pac.id_relacionDP and doc_pac.id_pac='" + idPac + "'";
        ResultSet resConsulta2 = bd.consulta(consulta2);
        while(resConsulta2.next()){
            String Contmsj = resConsulta2.getString(2);
            String mandador = resConsulta2.getString(3);
            if (mandador.equals(Nombre)){
                lado="right";
                color="#0D6EFD";
            }else{
                lado="left";
                color="black";
            }
        %>
                <div id="chat" class="p-2">
                    <div id="cont-chat" class="p-2" style="float:<%=lado%>; outline: 1px solid <%=color%>;">
                        <span style="float:<%=lado%>"><h5><%=Contmsj%></h5></span>
                        <span style="float:right;"> </span>
                    </div>
                </div>
                
<%}%>