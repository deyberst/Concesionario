<%-- 
    Document   : Clientes
    Created on : 29/08/2018, 10:35:31 PM
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
                        <li class="nav-item active">
                            <a class="nav-link" href="Clientes.jsp">Clientes</a>
                            <span class="sr-only">(current)</span>
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

        <!-- Imagen superior -->

        <header class="py-5 bg-image-full" style="background-image: url('resources/fondo_01.jpg');">
            <div style="height: 200px;"></div>
        </header>

        <!-- Formulario para ingresar a los cliente-->
        <div class="container"> <!-- para hacerlo responsive -->
            <br>
            <form action="ClienteServlet" method="post">
                <div class="form-group row">
                    <label for="nombre" class="control-label col-md-2">Nombre:</label>
                    <div class="col-md-10">
                        <input class="form-control" id="nombre" type="text" placeholder="Nombre" name="nombre" required="">
                        <div class="invalid-tooltip">
                            Porfavor llene el campo
                        </div>
                    </div> 
                </div>

                <div class="form-group row">  
                    <label for="tipoDoc" class="control-label col-md-2">Tipo De Documento:</label>

                    <div class="col-md-10">
                        <select id="tipoDoc" class="form-control" name="tipoDoc">
                            <option selected>Seleccione su tipo de documento</option>
                            <option>Cc </option>
                            <option>Te</option>
                            <option>Pst</option>

                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="numero" class="control-label col-md-2"> Numero:</label>
                    <div class="col-md-10">
                        <input class="form-control" id="numero" type="text" placeholder="Numero de documento" name="numero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="telefono" class="control-label col-md-2"> Telefono:</label>
                    <div class="col-md-10">
                        <input class="form-control" id="telefono" type="text" placeholder=" Telefono" name="telefono">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="direccion" class="control-label col-md-2"> Dirección:</label>
                    <div class="col-md-10">
                        <input class="form-control" id="direccion" type="text" placeholder=" Direccion" name="direccion">
                    </div>
                </div>

                <div class="form-gruop row">
                    <br>
                        <input class="btn icon-btn btn-success col-md-2" type="submit" name="action" value="Insertar">
                </div> 
            </form>
  
        </div>
        
        <!-- Formulario para mostrar los clientes -->
        <div class="container">
            <br>
                     
            <form action="ClienteServlet" method="post">
                <div class="form-group row">            
                    <input class="btn icon-btn btn-success col-md-2" type="submit" name="action" value="Enlistar Clientes">
                </div> 
                
                <div>
                    <hr/>
                    <c:forEach var="c" items="${clientes}">
                        |${c.clientePK.tipoDoc}| |${c.clientePK.numero}| |${c.nombre} |${c.direccion} |${c.telefono}|
                        <a onclick="return confirm('Esta Seguro?')" href="ClienteServlet?action=delete&tipoDoc=${c.clientePK.tipoDoc}&numero=${c.clientePK.numero}">Borrar</a>
                    <hr/>
                    </c:forEach>   
                </div>
                    
                   
            </form>           
            
        </div>

    </body> <!--Termina EL Body-->
</html>
