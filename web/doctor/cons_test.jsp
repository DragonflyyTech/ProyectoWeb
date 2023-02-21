<%-- 
    Document   : cons_test
    Created on : 23 nov. 2022, 23:39:12
    Author     : bruno fragoso
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <!-- css personalizado-->
        <link href="css/cssdiario.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 "><h4></h4></span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <img src="https://cdn-icons-png.flaticon.com/128/1787/1787077.png" alt="Logo" width="30" height="24"
                                 class="d-inline-block align-text-top">
                            <a class="navbar-brand" href="#"><span id="">Psyche</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="principal_d.jsp">Inicio</a>
                        </li>
                    </ul>
                    <a class="btn btn-primary" href="cerrar_sesion.jsp">Cerrar sesion</a>
                </div>
            </div>
        </nav>
    </body>
</html>
