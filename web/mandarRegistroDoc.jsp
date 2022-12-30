<%-- 
    Document   : mandarRegistro
    Created on : Nov 4, 2022, 9:30:32 AM
    Author     : alumno
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
        <div id="cosaa"> 
            <!-- aca falta poner todos los datos que se van a mandar desde la base de datos en la cosas de mete_datoss -->
            <div id="cosab" class="e">
                <h1>Tus Datos</h1>
                <%
                    String varnomb_usuer = request.getParameter("nomb_usuer");
                    String varpass = request.getParameter("pass");
                    String varalias = request.getParameter("alias");
                    String varbrith = request.getParameter("brith");
                    
                    if (!varnomb_usuer.equals("") && !varpass.equals("")&& !varalias.equals("") &&  !varbrith.equals("")) {
                        //se valida que tengan datos los campos
                        //guardamos en la base de datos
                        Base bd = new Base();
                        try {
                            bd.conectar();
                            String strQry = "insert into doctores(nom_doc, edad_doc,alias_doc,password_doc) value ('" + varnomb_usuer + "','" + varbrith + "','" + varalias + "','" + varpass + "');";
                            out.print(strQry);

                            int resultadoInsert = bd.insertar(strQry);
                            out.print("Checar resultado de la base " + resultadoInsert);
                            response.sendRedirect("index.html");
                %>
                <h1>El usuario ha sido registrado exitosamente</h1>
                <%
                        } catch (Exception ex) {
                            out.print("Los datos no se ingresaron correctamente, porfavor corriga el codigo ");
                        }
                    }

                %>
                <br>
                <p class="z">
                    <label>Nombre: <% out.println(varnomb_usuer); %></label><br>
                    <label>Alias: <% out.println(varalias); %></label><br>
                    <label>estado civil <% out.println(varbrith); %></label><br>
                    <label>pass <% out.println(varpass);%></label><br>

            </div>
        </div>      
    </body>
</html>
