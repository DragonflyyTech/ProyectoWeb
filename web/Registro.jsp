<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500&display=swap" rel="stylesheet">
        
        <title>Registro</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css-in/css_datos.css">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            select{
                width: 200px;
                height: 30px;
                text-align: center;
                border-radius:5px ; 
                background-color: #ffffff7e;
                border: 1px solid #DAC6C5;
            }
            body{
                font-family: 'Nunito', sans-serif;
            }
            #navbar{
                background-color: white;
            }
        </style>

    </head>
    <body>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

        <nav class="navbar navbar-expand-lg bg-ligth " id="navbar">
            <div class="container-fluid">
                <img src="https://cdn-icons-png.flaticon.com/128/1787/1787077.png" alt="Logo" width="30" height="24"
                     class="d-inline-block align-text-top">
                <a class="navbar-brand" href="#">&nbsp;Psyche</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href='index.html'>Inicio</a>
                        </li> 
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><b>Sobre nosotros</b></a>
                        </li>


                        <!--<li class="nav-item">
                            <a class="nav-link disabled">Disabled</a>
                        </li>-->
                    </ul>
                </div>
            </div>
        </nav>
         <div class="contenedor centrado">
            <div id="formulario" class="centrado">

                <form name="datos" method="post" action="mandarRegistro.jsp" style="with:300px; align-items: center; align-content: center;">
                    <br>
                    <h1  align="center">Registrarse</h1>
                    <br>
                    <table id="tablita" border="0" class="centrado">
                        <tr>
         
                            <th><div><label>Nombre de Usuario</label>
                                <input id="nomb_usuer" type="text" name="nomb_usuer" maxlength="20"  class="inouts form-control" oninput="this.value =this.value.replace(/[^a-zA-Z0-9\s]/g, '')" required/></div></th>
                        <tr>
                            <th><div><label>Correo Electrónico</label>
                                <input id="email" type="email" name="email" maxlength="30"  class="inouts form-control "  required/></div></th>

                        </tr>
                        <tr>
                            <th><div><label ">Contraseña</label>
                                <input id="pass" type="password" name="pass"  maxlength="10"  class="inouts form-control " required/></div></th>

                        </tr>
                        <tr>
                            <th><div><label>Alias</label>
                                <input id="alias" type="text" name="alias" maxlength="20"  class="inouts form-control " oninput="this.value = this.value.replace(/[^a-zA-Z0-9\s]/g, '')" required/></div></th>

                        </tr>
                        <tr>
                            <th><div><label>Edad</label>
                                <input id="brith" type="number" name="brith"  class="inouts form-control" min="15" max="90" step="1" required/></div></th>

                        </tr>
                        <tr class="centrado">
                            <th><br>
                                <input id="subir" type="submit" name="subir" class="subir" style= " border-radius: 8px; width: 150px;"/>
                                <br>
                            </th>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

    </body>
</html>
