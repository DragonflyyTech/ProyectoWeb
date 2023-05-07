<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>

<%
    String idEvento = request.getParameter("idEvento");
    String start = request.getParameter("start");
    String end = request.getParameter("end"); 
    
    SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
    
    String fecha_inicio= sdf2.format(sdf1.parse(start));
    String fecha_fin= sdf2.format(sdf1.parse(end));

    Base bd = new Base();
    bd.conectar();
    String strQry = "update eventos set  fecha_inicio='"+fecha_inicio+"',fecha_fin= '"+fecha_fin+"' where id_ev='"+idEvento+"';";
    int resultadoInsert = bd.insertar(strQry);
    out.print("Checar resultado de la base " + resultadoInsert);
    response.sendRedirect("index.jsp");

%>