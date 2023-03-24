<%-- 
    Document   : act_dat
    Created on : 24 mar. 2023, 02:19:48
    Author     : bruno fragoso
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();

        if (idPac < 1) {
            response.sendRedirect("index.html");
        }
        
        String nombre = request.getParameter("nombre");
        String edad = request.getParameter("edad");
        String alias = request.getParameter("alias");
        String correo = request.getParameter("correo");
        
                    miSessiondelUsuario.setAttribute("NombrePac", alias);
                    miSessiondelUsuario.setAttribute("UsuarioPac", nombre);
        
        
        Base bd = new Base();           
        bd.conectar();
        String strQry = "update pacientes set nom_pac='"+nombre+"', correo_pac='"+correo+"', alias_pac='"+alias+"',edad_pac='"+edad+"' where id_pac='"+ idPac +"';";
        int resultadoInsert = bd.insertar(strQry);
        
        
        response.sendRedirect("principal_p.jsp");
        
        %>
    </body>
</html>
