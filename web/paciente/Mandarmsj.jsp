<%-- 
    Document   : Mandarmsj
    Created on : 10 nov. 2022, 21:20:48
    Author     : bruno fragoso
--%>
<%@page import="conexion.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        String cont_mensaje = request.getParameter("contmnsj");
        String nombre = request.getParameter("Nombre");
        String fecha_msj = request.getParameter("fecha");
        String id_relacionDP = request.getParameter("id_relacionDP");           
        
        if (cont_mensaje.equals("")){
        response.sendRedirect("Chat.jsp");
            }else{
                Base bd = new Base();
                bd.conectar();
                String consulta = "insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('"+cont_mensaje+"','"+nombre+"','"+fecha_msj+"','"+id_relacionDP+"');";
                bd.insertar(consulta);
                bd.cierraConexion();
                response.sendRedirect("Chat.jsp");
            }
        %>
    </body>
</html>
