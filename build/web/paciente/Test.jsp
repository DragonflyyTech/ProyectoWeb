<%-- 
    Document   : diario
    Created on : 5 nov. 2022, 18:47:05
    Author     : bruno fragoso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Test</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/128/1787/1787077.png" type="image/gif" />
        <link href="testito.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
        <%
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("NombrePac").toString();%>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 "><h4><%=Nombre%></h4></span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="principal_p.jsp#pagina_abajo">Inicio</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Acciones</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="Test">Test</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="diario.jsp">Diario</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="Chat.jsp">Chat</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="Calendario.jsp">Citas</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div id="tit"><br>
                <h1 class="centrado" style='font-size: 4em;'>Test's</h1>
                <div class="form-text centrado" style="text-align: center">¡Hola! Bienvenido a la sección de Test's, aqui podras realizar una serie de cuestionarios que ayudaran a tu especialista asignado a poder ayudarte, te recomendamos hacerlos cuanto antes y si es tu primera vez en Psyche realiza la Pre-entrevista</div>
               
            </div>
        <div class="container" id="fond">
            <div >
                
                <div id="opciones">
                    <div class="btn_op centrado" style="background-color:#EBE8E1 ;">
                        <div class="card text-center" >
                            <div class="card-body">
                               
                                <p class="card-text"></p>
                                <a class="btn btn-primary btn-lg" id="pre-ent" href="Test/Prentre.jsp"> Pre-entrevista </a>
                            </div>
                            <div class="card-footer text-muted">
                                Pequeña entrevista antes de la primera sesión
                            </div>
                        </div>

                    </div>
                    <div class="btn_op centrado" style="background-color:#EBE8E1 ;">
                        <div class="card text-center">
                            <div class="card-body">
                                <p class="card-text"></p>
                                <button class="btn btn-primary btn-lg" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom" 
                                        style="background-color: #DAC6C5; border-color: #DAC6C5;">Depresion</button>
                            </div>
                            <div class="card-footer text-muted">
                                Test semi-certero para detectar posible depresion
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasBottomLabel">Lo sentimos...</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body small">
                    <p class="mb-0">Aun estamos trabajando para agregar mas test, sentimos la demora.</p>
                    <p class="mb-0">¡Pronto estaran disponibles!</p>
                </div>
            </div>
        </div>
            </div>
    </body>
</html>
