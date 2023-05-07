<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%
    String idEvento = request.getParameter("idEvento");
    String evento = request.getParameter("evento");
    String f_inicio = request.getParameter("fecha_inicio");
    String f_fin = request.getParameter("fecha_fin");
    String color_evento = request.getParameter("color_evento");
    
    SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
    
    String fecha_inicio= sdf2.format(sdf1.parse(f_inicio));
    String fecha_fin= sdf2.format(sdf1.parse(f_fin));

    Base bd = new Base();
    bd.conectar();
    String strQry = "update eventos set evento='"+evento+"', fecha_inicio='"+fecha_inicio+"',fecha_fin= '"+fecha_fin+"',color_evento='"+color_evento+"' where id_ev='"+idEvento+"';";
    int resultadoInsert = bd.insertar(strQry);
    out.print("Checar resultado de la base " + resultadoInsert);
    response.sendRedirect("index.jsp?e=1");

%>