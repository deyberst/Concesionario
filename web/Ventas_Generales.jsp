<%-- 
    Document   : Ventas_Generales
    Created on : 29/08/2018, 10:47:11 PM
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
        
        
        
        <!-- Extra JavaScript/CSS added manually in "Settings" tab -->
        <!-- Include jQuery -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

        <script>
            $(document).ready(function(){
                var date_input=$('input[name="fechaVenta"]'); //our date input has the name "date"
                var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
                date_input.datepicker({
                    format: 'dd/mm/yyyy',
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                })
            })
        </script>

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
                        <li class="nav-item">
                            <a class="nav-link" href="Vehiculos.jsp">Vehiculos</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="Ventas_Generales.jsp">Ventas Generales</a>
                            <span class="sr-only">(current)</span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container"> <!-- para hacerlo responsive -->
            <br>
            <form action="VentaServlet" method="post">
                <div class="form-group row">
                    <label for="idVenta" class="control-label col-md-2">Identificación De La Venta</label>
                    <div class="col-md-10">
                        <input class="form-control" id="idVenta" type="text" placeholder="identificacion de Venta" name="idVenta" required="">
                        <div class="invalid-tooltip">
                            Porfavor llene el campo
                        </div>
                    </div> 
                </div>

                <div class="form-group row">  
                    <label for="tipoDoc" class="control-label col-md-2">Tipo De Documento</label>

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
                    <label for="matricula" class="control-label col-md-2"> matricula</label>
                    <div class="col-md-10">
                        <input class="form-control" id="matricula" type="text" placeholder="Matricula" name="matricula">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="fechaVenta" class="control-label col-md-2"> Fecha De La Venta</label>
                    <div class="col-md-10">
                        <input class="form-control" id="fechaVenta" name="fechaVenta" placeholder="DD/MM/YYYY" type="text"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="precio" class="control-label col-md-2"> Precio</label>
                    <div class="col-md-10">
                        <input class="form-control" id="precio" name="precio" placeholder="Precio" type="text"/>
                    </div>
                </div>

                  <div class="form-gruop row">
                    <br>
                        <input class="btn icon-btn btn-success col-md-2" type="submit" name="action" value="Insertar">
                        <div class="col-md-1"></div> 
                </div>  
            </form>
        </div>
        
          <!-- Formulario para mostrar los clientes -->
        <div class="container">
            <br>
                     
            <form action="VentaServlet" method="post">
                <div class="form-group row">            
                    <input class="btn icon-btn btn-success col-md-2" type="submit" name="action" value="Enlistar Clientes">
                </div> 
                
                <div>
                    <hr/>
               <c:forEach var="c" items="${ventas}">
                    |${c.idVenta}| ${c.tipoDoc}| |${c.numCliente}|  |${c.matricula} |${c.fechaventa}| |${c.precio}
                    <a onclick="return confirm('Esta Seguro?')" href="VentaServlet?action=delete&idVenta=${c.idVenta}">Borrar</a>
                    <hr/>
                </c:forEach> 
                </div>
                    
                   
            </form>           
            
        </div>      

    </body> <!--Termina EL Body-->

</html>
