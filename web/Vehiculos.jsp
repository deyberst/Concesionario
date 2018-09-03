<%-- 
    Document   : Vehiculos
    Created on : 29/08/2018, 10:43:50 PM
    Author     : Juan Camilo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    </head>  <!--Termina EL Head-->

    <body> <!--Empieza EL Head-->

        <!-- Barra De Navegacion -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">CONCESIONARIO</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Clientes.jsp">Clientes</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="Vehiculos.jsp">Vehiculos</a>
                            <span class="sr-only">(current)</span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Ventas_Generales.jsp">Ventas Generales</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <header class="py-5 bg-image-full" style="background-image: url('resources/fondo_01.jpg');">
            <div style="height: 200px;"></div>
        </header>

        <!--Formulario para ingresear el vehiculo -->
        <div class="container"> <!-- para hacerlo responsive -->
            <br>
            <form action="VehiculoServlet" method="post">
                <div class="form-group row">
                    <label for="matricula" class="control-label col-md-2"> Matrícula:</label>
                    <div class="col-md-10">
                        <input class="form-control" id="matricula" type="text" placeholder="matricula" name="matricula" required="">               
                        <div class="invalid-tooltip">
                            Por favor llene el campo
                        </div>
                    </div> 
                </div>

                <div class="form-group row">
                    <label for="tipo" class="control-label col-md-2"> Tipo Vehículo:</label>
                    <div class="col-md-10">

                        <select id="listaTipo" class="form-control"  name="tipo">
                            <option>Deportivo</option>
                            <option>Coupé</option>
                            <option>Descapotable</option>
                            <option>Sedán</option>
                            <option>Familiar</option>
                            <option>Furgoneta</option>
                        </select>
                    </div>
                    <div class="col-md-2"></div>
                    <small id="mensaje" class="text-muted col-md-5">
                        Seleccione el tipo del vehículo
                    </small>
                </div>

                <div class="form-group row">
                    <label for="marca" class="control-label col-md-2"> Marca:</label>
                    <div class="col-md-10">                      
                        <select id="marca" class="form-control" name="marca">
                            <option>Mazda</option
                            <option>Nissan</option>
                            <option>Chevrolet</option>
                            <option>Toyota</option>
                            <option>Ford</option>
                            <option>BMW</option>
                            <option>Mercedez Benz</option>
                        </select>
                    </div>
                    <div class="col-md-2"></div>
                    <small id="mensaje" class="text-muted col-md-5">
                        Seleccione la marca del vehículo
                    </small>
                </div>

                <div class="form-group row">
                    <label for="cilindraje" class="control-label col-md-2"> Cilindraje:</label>
                    <div class="col-md-10">
                        <input class="form-control" id="cilindraje" type="text" placeholder=" cilindraje" name="cilindraje">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="color" class="control-label col-md-2"> Color:</label>
                    <div class="col-md-10">
                        <input class="form-control" id="color" type="text" placeholder="color" name="color">
                    </div>
                </div>

                                <div class="form-group row">
                    <label for="color" class="control-label col-md-2"> Elija la imagen:</label>
                    <div class="col-md-10">
                        <input type="file" name="foto" size="50">
                    </div>
                </div>
                <div class="form-gruop row">
                    <br>
                        <input class="btn icon-btn btn-success col-md-2" type="submit" name="action" value="Insertar">
                        <div class="col-md-1"></div> 
                </div>           
            </form>
            <br>
        </div>

        <!-- Formulario para buscar un vehiculo -->
        <div class="container">
        <form action="VehiculoServlet" method="post">                
                <div class="form-group row">
                    <input class="btn icon-btn btn-success col-md-2" type="submit" name="action" value="Buscar">
                    <div class="col-md-10">
                        <input class="form-control" id="matricula" type="text" placeholder="matricula" name="matricula">               
                    </div> 
                </div>                
                <c:forEach var="v" items="${vehiculo}">
                    <c:if test="${not empty vehiculo}">
                        |${v.matricula}| |${v.marca}| |${v.tipoCarro} |${v.cilindraje} |${v.color}|
                        <a onclick="return confirm('Esta Seguro?')" href="VehiculoServlet?action=delete&matricula=${c.matricula}">Borrar</a>
                        <hr/>
                    </c:if>
                </c:forEach>
            </form> 
        </div>
        
        <!-- Formulario para mostrar el listado de vehiculos -->
        <div class="container">
            <form action="VehiculoServlet" method="post">
                <div class="form-group row">
                    <input class="btn icon-btn btn-success col-md-2" type="submit" name="action" value="Enlistar Vehículos"> 
                    <hr/>                
                    <c:forEach var="v" items="${vehiculos}">
                        |${v.matricula}| |${v.marca}| |${v.tipoCarro} |${v.cilindraje} |${v.color}|
                        <a onclick="return confirm('Esta Seguro?')" href="VehiculoServlet?action=delete&matricula=${c.matricula}">Borrar</a>
                    <hr/>
                    </c:forEach>
                </div>
            </form>  
        </div>
                    
    </body> <!--Termina EL Body-->

</html>
