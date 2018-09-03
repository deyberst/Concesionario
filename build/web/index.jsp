<%-- 
    Document   : index
    Created on : 29/08/2018, 09:39:43 PM
    Author     : Juan Camilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head> <!--Empieza El Head-->

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Manejo De Informacion de Un Concesionario">
        <title>Concesionario De Vehiculos</title <!--Titulo Pagina Web-->
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/full-width-pics.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style type="text/css">
            .carousel{
                background: #2f4357;
                margin-top: 20px;
            }
            .carousel .item{
                min-height: 300px;
            }
            .carousel .item img{
                margin: 0 auto; 
            }
            .bs-example{
                margin: 10px;
            }
        </style>


    </head>  <!--Termina EL Head-->

    <body> <!--Empieza EL Head-->

        <!-- Barra De Navegacion -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand active" href="index.jsp">CONCESIONARIO</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Clientes.jsp">Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Vehiculos.jsp">Vehiculos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Ventas_Generales.jsp">Ventas Generales</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Barra De Navegacion -->


        <header>
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="resources/car_01.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="resources/car_02.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="resources/car_03.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </header>


        <section class="py-5">

            <div class="container">
                <h2>HISTORIA</h2>
                <p align="justify">Este concesionario, se fundó el 4 de diciembre de 2000, con el objeto de adquisición, distribución, enajenación, exportación, importación y reparación de vehículos automotores, repuestos, partes accesorios, herramientas, lubricantes, y cualquier otra actividad relacionada con automotores, motocicletas, bicicletas y todo equipo de transporte.

                    En octubre de 2004, nos otorgan la concesión para la comercialización de carros, convirtiéndose en el primer concesionario de la region, pioneros en ofrecer al mercado antioqueño el poder de la ingeniería internacional.</p>
            </div>


            <div class="container">
                <h2>MISIÓN</h2>
                <p align="justify">Brindar soluciones de transporte con vehículos de óptima calidad,  confiables y confortables, con tecnología e innovación, garantizando un servicio óptimo al cliente; buscando para los accionistas de la compañía una rentabilidad razonable y el mayor bienestar para todos sus empleados, contribuyendo de esta manera al desarrollo del país, de la comunidad y buscando proteger al medio ambiente.</p>
            </div>

            <div class="container">
                <h2>VISIÓN</h2>
                <p align="justify">
                    Queremos ser siempre reconocidos, por nuestros clientes como el concesionario con los mayores estándares de calidad, en la prestación de los servicios que ofrecemos.
                </p>
            </div>


        </section>

        <section class="py-5 bg-image-full" style="background-image: url('resources/fondo_02.jpg');">
            <div style="height: 200px;"></div>
        </section>

        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Arquitectura De Software 2018</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body> <!--Termina EL Body-->

</html>
