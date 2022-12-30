<%-- 
    Document   : cerrar_sesion
    Created on : 15 nov. 2022, 23:58:34
    Author     : bruno fragoso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        try{
        miSessiondelUsuario.invalidate();
        response.sendRedirect("../index.html");
            }catch (Exception ex){
            out.print("la sesion no se ha cerrado correctamente");
            }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
