<%@page import="DAO.DaoHabitacacion"%>
<%@page import="Clases.Habitacion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aqui se ingresa Habitacion</title>
</head>
<body>
<%
	//DATOS INGRESADOS PARA HABITACION
	String num_habitacion = request.getParameter("num_habitacion");
	String tipo_habitacion = request.getParameter("tipo_habitacion");
	int capacidad = Integer.parseInt(request.getParameter("capacidad"));
	boolean disponibilidad = Boolean.parseBoolean(request.getParameter("disponibilidad")); 
	double precio = Double.parseDouble(request.getParameter("precio"));
	
	//ALMACENAMOS DATOS EN HABITACION
	Habitacion habitacion = new Habitacion();
	habitacion.setNum_habitacion(num_habitacion);
	habitacion.setTipo_habitacion(tipo_habitacion);
	habitacion.setCapacidad(capacidad);
	habitacion.setDisponibilidad(disponibilidad);
	habitacion.setPrecio(precio);
	
	DaoHabitacacion daoHabitacion = new DaoHabitacacion();
	daoHabitacion.guardarHabitacion(habitacion);
	out.print("Aqui se ingresa la habitacion :"+num_habitacion);
%>
</body>
</html>