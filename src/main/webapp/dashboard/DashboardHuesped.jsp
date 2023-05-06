<%@page import="Clases.Huesped"%>
<%@page import="DAO.DaoHuesped"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Huespedes</title>
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

      <h2>Huespedes</h2>
      <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modalHabitacion">Agregar
  		</button>
      <div class="table-responsive table-bordered table ">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Nombres</th>
              <th scope="col">Apelliodo Paterno</th>
              <th scope="col">Apellido Materno</th>
              <th scope="col">Direccion</th>
              <th scope="col">dni</th>
              <th scope="col">telefono</th>
              <th scope="col">email</th>
            </tr>
          </thead>
          <tbody>
          <%
        	DaoHuesped daoHuesped = new DaoHuesped();
        	List<Huesped> listaHuesped = daoHuesped.obtenerHuespedes();
        	           
          for(Huesped huespedes : listaHuesped){%>
          <tr>
        		<td><%= huespedes.getId_huesped() %></td>
        		<td><%= huespedes.getNombre() %></td>
        		<td><%= huespedes.getApellido_paterno() %></td>
        		<td><%= huespedes.getApellido_materno() %></td>
        		<td><%= huespedes.getDireccion() %></td>
        		<td><%= huespedes.getDni() %></td>
        		<td><%= huespedes.getTelefono() %></td>
        		<td><%= huespedes.getEmail() %></td>
    		</tr>
    		<% } %>
          </tbody>
        </table>
      </div>
<!-- Modal -->
<div class="modal fade" id="modalHabitacion" tabindex="-1" aria-labelledby="modalHabitacionLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Ingrese Datos Personales</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
    	<!-- INGRESO DEL FORMULARIO RESERVA -->  
    	
	<form method="post" action="hacerReserva.jsp">
          <div class="form-floating mb-3">
            <input type="text" name="nombre" class="form-control rounded-3" id="floatingInput" placeholder="Nombre" required>
            <label for="floatingInput">Nombre</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="apellido_paterno" class="form-control rounded-3" id="floatingPassword" placeholder="Apellido Paterno" required>
            <label for="floatingInput">Apellido Paterno</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="apellido_materno" class="form-control rounded-3" id="floatingInput" placeholder="Apellido Materno" required>
            <label for="floatingInput">Apellido Materno</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="direccion" class="form-control rounded-3" id="floatingPassword" placeholder="Direccion" required>
            <label for="floatingInput">Direccion</label>
          </div>
          <div class="form-floating mb-3">
            <input type="number" name="dni" class="form-control rounded-3" id="floatingInput" placeholder="DNI" maxlength="8"
            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required>
            <label for="floatingInput">DNI</label>
          </div>
          <div class="form-floating mb-3">
            <input type="number" name="telefono" class="form-control rounded-3" id="floatingPassword" placeholder="Telefono" maxlength="9"
            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required>
            <label for="floatingInput">Telefono</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email" name="email" class="form-control rounded-3" id="floatingPassword" placeholder="Email" required>
            <label for="floatingInput">Email</label>
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