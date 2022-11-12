<%-- 
    Document   : Mandar_diario
    Created on : 8 nov. 2022, 19:55:11
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
        <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));

        if (idPac < 1) {
            response.sendRedirect("index.html");
        }
        String titulo_diar = request.getParameter("titulo_D");
        String fecha = request.getParameter("Fecha");
        String cont_diario = request.getParameter("cont-dia");
        String emocion_diar =request.getParameter("emocion");

        Base bd = new Base();
        try{
                    bd.conectar();
                            String strQry = "insert into tabla_diario(cont_diar,emocion_diar,titulo_diar,fecha,id_pac) values ('" + cont_diario + "','" + emocion_diar + "','" + titulo_diar + "','" + fecha + "','" + idPac + "');";

                            out.print(strQry);

                            int resultadoInsert = bd.insertar(strQry);
                            response.sendRedirect("principal_p.jsp");
            }
        catch (Exception ex) { out.print("Los datos no se ingresaron correctamente, porfavor corriga el codigo "); }

        %>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
