<%-- 
    Document   : Diario_pac
    Created on : 23 nov. 2022, 08:39:58
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
        <link href="cssdiario.css" rel="stylesheet">
        <title>Diario</title>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500&display=swap" rel="stylesheet">
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
        <div class="container">
            <div class="row"">
                <div class="col-sm-12 col-md-7 col-lg-7 col-xl-7 p-4"" >
                    <div style=" border-radius: 10px; width: 90%;" class="centrado"><h1>Información del diario</h1></div>
                    <div id="cont_dia" >
                        <%
                            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                            int idDoc = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
                            int idPac = (int)(miSessiondelUsuario.getAttribute("idPac") == null ? 0 : miSessiondelUsuario.getAttribute("idPac"));
                            String Nombre = String.valueOf(miSessiondelUsuario.getAttribute("Nombre"));

                            String Carita = "";
                            int f =0;
                            int t =0;
                            int e =0;
                            int n =0;
                            int c =0;
                            int nulls =0;

                            Base bd = new Base();
                            bd.conectar();
            
                            String consulta2 = "select * from tabla_diario where id_pac ="+idPac+";";
                            ResultSet resConsulta2 = bd.consulta(consulta2);
                            while(resConsulta2.next()){
                            String cont = resConsulta2.getString(2);
                            String tit = resConsulta2.getString(4);
                            String emo = resConsulta2.getString(3);
                            String date = resConsulta2.getString(5); 
                        %>  
                        <div id="diario" class="p-4">
                            <h1><%=tit%></h1>
                            <p><b>Fecha: <%=date%></b></p>
                            <h4>Emocion: <%=emo%></h4>
                            <h6><%=cont%></h6>
                        </div>            
                        <%
                            if(emo.equals("feliz")){
                                f++;
                            }else{
                            if(emo.equals("normal")){
                                n++;
                            }else{
                            if(emo.equals("triste")){
                                t++;
                            }else{
                            if(emo.equals("conflictuado")){
                                c++;
                            }else{
                            if(emo.equals("enojado")){
                                e++;
                            }else{
                                nulls++;
                            }
                            }
                            }
                            }
                            }
                            }
                        %>
                    </div>
                </div>
                <div class="col-sm-12 col-md-5 col-lg-5 col-xl-5 p-4 centrado" id="">
                    <div>
                        <h3>Grafica de las emociones segun las entradas de diario</h3>
                        <canvas id="myChart" width="520"></canvas>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <script>
                        const ctx = document.getElementById('myChart');
                        const Emociones = ['Feliz', 'Triste', 'Enojado', 'Conflictuado', 'Normal'];
                        const numem = [<%=f%>,<%=t%>,<%=e%>,<%=c%>,<%=n%>];

                        new Chart(ctx, {
                            type: 'doughnut',
                            data: {
                                labels: Emociones,
                                datasets: [{
                                        label: 'Emociones',
                                        data: numem,
                                        backgroundColor: [
                                            '#A49B9A',
                                            '#0D6EFD',
                                            '#221D1B',
                                            '#3C3E38',
                                            '#9AB7C1'
                                        ],
                                        hoverOffset: 4
                                    }]
                            }
                        });
                    </script>
                </div>

            </div>
        </div>
    </body>
</html>
