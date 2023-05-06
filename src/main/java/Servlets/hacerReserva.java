package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Clases.Habitacion;
import Clases.Huesped;
import Clases.Reserva;
import DAO.DaoHuesped;
import DAO.DaoReserva;

/**
 * Servlet implementation class hacerReserva
 */
@WebServlet("/hacerReserva")
public class hacerReserva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hacerReserva() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DATOS PARA INGRESAR HUESPED
		String nombre = request.getParameter("nombre");
		String apellido_paterno = request.getParameter("apellido_paterno");
		String apellido_materno = request.getParameter("apellido_materno");
		String direccion = request.getParameter("direccion");
		String dni = request.getParameter("dni");
		String telefono = request.getParameter("telefono");
		String email = request.getParameter("email");
		
		
		//DATO PARA INGRESAR LA HABITACION
		int num_habitacion = Integer.parseInt(request.getParameter("habitacion"));
		
		//DATOS INGRESADOS A RESERVA
		String fecha_entrada = request.getParameter("fecha_entrada");
		String fecha_salida  = request.getParameter("fecha_salida");
		
		//FORMATO PARA GUARDAR FECHA EN FORMATO AÑO/MES/DIA	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		java.sql.Date fechaSql_entrada = null;
		try {
			fechaSql_entrada = new java.sql.Date(dateFormat.parse(fecha_entrada).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date fechaSql_salida = null;
		try {
			fechaSql_salida = new java.sql.Date(dateFormat.parse(fecha_salida).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		//DATOS ALMACENADOS EN HABITACION
		Habitacion habitacion = new Habitacion();
		habitacion.setId_habitacion(num_habitacion);
		
		//DATOS ALMACENADOS EN EL HUESPED
		Huesped huesped = new Huesped();
		huesped.setNombre(nombre);	
		huesped.setApellido_paterno(apellido_paterno);
		huesped.setApellido_materno(apellido_materno);
		huesped.setDireccion(direccion);
		huesped.setDni(dni);
		huesped.setTelefono(telefono);
		huesped.setEmail(email);
		
		//GUARDAR EN LA BASE DE DATOS
		DaoHuesped daoHuesped = new DaoHuesped();
		daoHuesped.guardar(huesped);
		
		//INTENTAR TRAER EL ULTIMO VALOR
		int id_huesped = 0;
		try {
			id_huesped = daoHuesped.obtenerUltimoIdHuesped();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		huesped.setId_huesped(id_huesped);
		
		//DATOS ALMACENADOS EN RESERVA
		Reserva reserva = new Reserva();
		reserva.setFecha_entrada(fechaSql_entrada);
		reserva.setFecha_salida(fechaSql_salida);
		reserva.setHuesped(huesped);
		reserva.setHabitacion(habitacion);
		
		
		
		//Ingresar datos de Reserva
		DaoReserva dao = new DaoReserva();
		dao.guardarReserva(reserva);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
