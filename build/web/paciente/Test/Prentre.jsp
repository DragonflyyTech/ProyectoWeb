<%-- 
    Document   : newjsp
    Created on : 23 nov. 2022, 23:18:16
    Author     : bruno fragoso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/128/1787/1787077.png" type="image/gif" />
        <title>Pre-entrevista</title>
        <link href="test.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500&display=swap" rel="stylesheet">
        
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

        <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();
        %>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 "><h4><%=Nombre%></h4></span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../principal_p.jsp#pagina_abajo">Inicio</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Acciones</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../Test.jsp">Test</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="../diario.jsp">Diario</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="../Chat.jsp">Chat</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="../Calendario.jsp">Citas</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div id="tit"><br>
                <h1 class="centrado">Pre-entrevista clinica</h1>
                <div class="form-text centrado">Para que el psicologo tenga antecendentes al momento de empezar el seguimiento se debe reaizar esta entrevisata</div>
               
            </div>
            <div id="fondo" class="p-4">
                <form name="pre_enrevista" method="post" action="mandPrentre.jsp">
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label"><p class="letra">¿Cuál es la razon por la que quieres contactar con un psicólogo? ¿Cuál es el motivo por el cual quieres llevar un seguimiento?</p></label>
                        <textarea class="form-control" id="razon" name="razon" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label"><p class="letra">¿Cómo describirías tus problemas? ¿Tienes problemas con tus relaciones? ¿Problemas de sueño? ¿Problemas sexuales? ¿Alguna fobia o dependencia? ¿Cuáles son los comportamientos que te causan problemas?</p></label>
                        <textarea class="form-control" id="conducta" name="conducta" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label"><p class="letra">¿Cómo te afectan estos problemas en la vida diaria? ¿De qué forma afectan a las personas que te rodean?</p></label>
                        <textarea class="form-control" id="relevancia" name="relevancia" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label"><p class="letra">¿Qué tan seguido te ocurre esto? ¿Cuánto tiempo duro el último episodio que tuviste? ¿Cada cuando ocurre? ¿Algo en específico lo detona?</p></label>
                        <textarea class="form-control" id="frecuencia" name="frecuencia" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label"><p class="letra">¿Desde cuándo comenzó a ser un problema? ¿Cuándo iniciaron estos comportamientos? ¿Cuánto tiempo has lidiado con esto?</p></label>
                        <textarea class="form-control" id="origen" name="origen" rows="3"></textarea>
                    </div>
                    <div class='centrado'>
                        <button type="submit" class="btn btn-primary btn-lg " style="background-color: #DAC6C5;
    border-color: #DAC6C5;">Enviar</button>
                    </div>
                    
                </form>
            </div>
        </div>

    </body>
</html>
