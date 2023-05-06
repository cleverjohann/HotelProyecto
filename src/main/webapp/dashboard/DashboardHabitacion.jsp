<%@page import="Clases.Habitacion"%>
<%@page import="DAO.DaoHabitacacion"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Habitaciones</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/dashboard.css">
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <%@ include file="../Common/sidebars.jsp" %>
    
	<!-- PARTE SUPERIOR DEL DASBOARD MODIFICAR TITULO-->
	
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar" class="align-text-bottom"></span>
            This week
          </button>
        </div>
      </div>

      <!-- MODIFICAR INTERIOR DE LA TABLA -->

      <h2>Habitaciones</h2>
      <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modalHabitacion">Agregar
  		</button>
      <div class="table-responsive table-bordered table ">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Num.Habitacion</th>
              <th scope="col">Tipo</th>
              <th scope="col">Capacidad</th>
              <th scope="col">Estado</th>
              <th scope="col">Precio</th>
            </tr>
          </thead>
          <tbody>
          <%
			
          
        	DaoHabitacacion daoHabitacion = new DaoHabitacacion();
        	List<Habitacion> listaHabitacion = daoHabitacion.listar();
        	           
          for(Habitacion habitacion : listaHabitacion){%>
          <tr>
        		<td><%= habitacion.getId_habitacion() %></td>
        		<td><%= habitacion.getNum_habitacion() %></td>
        		<td><%= habitacion.getTipo_habitacion() %></td>
        		<td><%= habitacion.getCapacidad() %></td>
        		<td><%= habitacion.isDisponibilidad() %></td>
        		<td><%= habitacion.getPrecio() %></td>
        		<td><button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modalEditarHabitacion">Editar</button> </td>
    		</tr>
    		<% } %>
          </tbody>
        </table>
      </div>
<!-- Modal AGREGAR-->
<div class="modal fade" id="modalHabitacion" tabindex="-1" aria-labelledby="modalHabitacionLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Ingrese Datos Personales</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
    	<!-- INGRESO DEL FORMULARIO HABTIACION -->  
    	
	<form method="post" action="Habitacion\IngresarHabitacion.jsp">
          <div class="form-floating mb-3">
            <input type="text" name="num_habitacion" class="form-control rounded-3" id="floatingInput" placeholder="Nombre" required>
            <label for="floatingInput">Numero Habitacion</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="tipo_habitacion" class="form-control rounded-3" id="floatingPassword" placeholder="Apellido Paterno" required>
            <label for="floatingInput">Tipo de habitacion</label>
          </div>
          <div class="form-floating mb-3">
            <input type="number" name="capacidad" class="form-control rounded-3" id="floatingInput" placeholder="Apellido Materno" required>
            <label for="floatingInput">Capacidad</label>
          </div>
          <div class="form-floating mb-3">
            <select name="disponibilidad" id="disponibilidad" class="form-select">
              <option value="false">Indispuesto</option>
              <option value="true" selected>Disponible</option>
            </select>
            <label for="floatingInput">Estado</label>
          </div>
          <div class="form-floating mb-3">
            <input type="number" name="precio" class="form-control rounded-3" id="floatingInput" placeholder="precio"  required>
            <label for="floatingInput">Precio</label>
          </div>      
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit" value="Guardar">Guardar</button>
        </form>               
      </div>
    </div>
  </div>
</div>
<!-- FIN MODAL --> 
<!-- Modal EDITAR-->
<div class="modal fade" id="#modalEditarHabitacion" tabindex="-1" aria-labelledby="modalEditarHabitacionLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Ingrese Datos Personales</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
    	<!-- INGRESO DEL FORMULARIO EDITAR HABTIACION -->  
    	
	<form method="post" action="Habitacion\IngresarHabitacion.jsp">
          <div class="form-floating mb-3">
            <input type="text" name="num_habitacion" var="habitacion" value="${habitacion }" class="form-control rounded-3" id="floatingInput" placeholder="Nombre" required>
            <label for="floatingInput">Numero Habitacion</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="tipo_habitacion" class="form-control rounded-3" id="floatingPassword" placeholder="Apellido Paterno" required>
            <label for="floatingInput">Tipo de habitacion</label>
          </div>
          <div class="form-floating mb-3">
            <input type="number" name="capacidad" class="form-control rounded-3" id="floatingInput" placeholder="Apellido Materno" required>
            <label for="floatingInput">Capacidad</label>
          </div>
          <div class="form-floating mb-3">
            <select name="disponibilidad" id="disponibilidad" class="form-select">
              <option value="false">Indispuesto</option>
              <option value="true" selected>Disponible</option>
            </select>
            <label for="floatingInput">Estado</label>
          </div>
          <div class="form-floating mb-3">
            <input type="number" name="precio" class="form-control rounded-3" id="floatingInput" placeholder="precio"  required>
            <label for="floatingInput">Precio</label>
          </div>      
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit" value="Guardar">Guardar</button>
        </form>               
      </div>
    </div>
  </div>
</div>
<!-- FIN MODAL --> 
     
    </main>
  </div>
</div>
<script src="js/dashboard.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</body>
</html>