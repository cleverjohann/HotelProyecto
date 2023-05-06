<%@page import="Clases.Reserva"%>
<%@page import="DAO.DaoReserva"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard Reservas</title>
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

      <h2>Reservas</h2>
      <div class="table-responsive table-bordered table ">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">Nombre</th>
              <th scope="col">Apellido Paterno</th>
              <th scope="col">Apellido Materno</th>
              <th scope="col">DNI</th>
              <th scope="col">Fecha Entrada</th>
              <th scope="col">Fecha Salida</th>
              <th scope="col">ID Habitacion</th>
            </tr>
          </thead>
          <tbody>
          <%
			
          
        	DaoReserva daoReserva = new DaoReserva();
        	List<Reserva> listaReservas = daoReserva.consultar();
        	           
          for(Reserva reserva : listaReservas){%>
          <tr>
        		<td><%= reserva.getHuesped().getNombre() %></td>
        		<td><%= reserva.getHuesped().getApellido_paterno() %></td>
        		<td><%= reserva.getHuesped().getApellido_materno() %></td>
        		<td><%= reserva.getHuesped().getDni() %></td>
        		<td><%= reserva.getFecha_entrada() %></td>
        		<td><%= reserva.getFecha_salida() %></td>
        		<td><%= reserva.getHabitacion().getId_habitacion() %></td>
    		</tr>
    		<% } %>
    		
    	
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>
<script src="js/dashboard.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</body>
</html>