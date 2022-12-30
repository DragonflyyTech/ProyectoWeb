<%-- 
    Document   : mandPrentre
    Created on : 23 nov. 2022, 23:18:54
    Author     : bruno fragoso
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.Base"%>
<%@page import="java.sql.ResultSet"%>
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

        if (idPac < 1) {
            response.sendRedirect("index.html");
        }
        
        String razon = request.getParameter("razon");
        String conducta = request.getParameter("conducta");
        String relevancia = request.getParameter("relevancia");
        String frecuencia = request.getParameter("frecuencia");
        String origen = request.getParameter("origen");

        Base bd = new Base();
        try{
                    bd.conectar();
                            String strQry = "insert into tabla_prentrevista(razon,conducta,relevancia,frecuencia,origen,id_pac) values ('" + razon + "','" + conducta + "','" + relevancia + "','" + frecuencia + "','"+origen+"','" + idPac + "');";
                            out.print(strQry);
                            int resultadoInsert = bd.insertar(strQry);
                            response.sendRedirect("../Test.jsp");
            }
        catch (Exception ex) { out.print("Los datos no se ingresaron correctamente, porfavor corriga el codigo "); }

        %>
    </body>
</html>
