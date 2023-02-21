<%-- 
    Document   : val_usr_login
    Created on : 19 oct. 2022, 23:37:22
    Author     : bruno fragoso
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%
            String usr = request.getParameter("TxtUsr");
            String pswd = request.getParameter("TxtPsw");
            String msj="";

            if (usr == null) {
                usr = "0";
            } else {
                if (usr.equals("")) {
                    usr = "0";
                }
            }

            if (pswd == null) {
                pswd = "0";
            } else {
                if (pswd.equals("")) {
                    pswd = "0";
                }
            }

            if (!usr.equals("0") && !pswd.equals("0")) {

                Base bd = new Base();
                bd.conectar();
                
                String strQry = "select * from pacientes where nom_pac= '" + usr + "' and password_pac='" + pswd + "'";
                ResultSet rsValidarUsr = bd.consulta(strQry);

                if (rsValidarUsr.next()) {
                    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                    int idPersona = rsValidarUsr.getInt("id_pac");
                    String nombre = rsValidarUsr.getString("nom_pac");
                    String alias = rsValidarUsr.getString("alias_pac");
                    miSessiondelUsuario.setAttribute("NombrePac", alias);
                    miSessiondelUsuario.setAttribute("UsuarioPac", nombre);
                    miSessiondelUsuario.setAttribute("idPer", idPersona);
                    response.sendRedirect("paciente/principal_p.jsp");

                } 
                else {
                  String strQry2 = "select * from doctores where nom_doc= '" + usr + "' and password_doc='" + pswd + "'";
                  ResultSet rsValidardoc = bd.consulta(strQry2);
                  
                    if(rsValidardoc.next()){
                        
                        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                        int idPersona = rsValidardoc.getInt("id_doc");
                        String nombre = rsValidardoc.getString("nom_doc");
                        miSessiondelUsuario.setAttribute("UsuarioPac", nombre);
                        miSessiondelUsuario.setAttribute("idPer", idPersona);
                        response.sendRedirect("doctor/principal_d.jsp");
                        
                    }
                    else{
                    
                    msj="Este nombre de usuario, o la contraseña, no han sido registrados, favor de buscar ";
                    }
                    
                }
            } else {
                msj="Porfavor rellene los campos que dejo vacio.";
            }

        %>
    </head>
    <body>
        <script>
            var patadepollo = confirm("<%=msj%>");
            if (patadepollo == true) {
                location.href = 'index.html';
            } else {
                location.href = 'index.html';
            }

        </script>
    </body>
</html>
