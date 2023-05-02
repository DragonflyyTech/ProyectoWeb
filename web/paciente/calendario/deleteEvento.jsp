<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%
    String id = request.getParameter("id");

    Base bd = new Base();
    bd.conectar();
    String strQry = "delete from eventos where id_ev='"+id+"' ;";
    int resultadoInsert = bd.insertar(strQry);
    out.print("Checar resultado de la base " + resultadoInsert);
    response.sendRedirect("principal_p.jsp");
%>