package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Clases.Habitacion;
import Clases.Huesped;
import Clases.Reserva;

public class DaoReserva extends Dao{

	public void guardarReserva (Reserva reserva) {
		Connection cnx = crearCnx();		
		String sqlreserva = "INSERT INTO public.reserva(fecha_entrada, fecha_salida, id_huesped, id_habitacion)VALUES ( ?, ?, ?, ?)";
		try {
			PreparedStatement st = cnx.prepareStatement(sqlreserva);
			st.setDate(1, (java.sql.Date) reserva.getFecha_entrada());
			st.setDate(2, (java.sql.Date) reserva.getFecha_salida());
			st.setInt(3, reserva.getHuesped().getId_huesped());
			st.setInt(4, reserva.getHabitacion().getId_habitacion());
			st.execute();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			try {
				cnx.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public List<Reserva> consultar() throws SQLException{
		Connection cnx = crearCnx();
		String sql = "SELECT huesped.nombre,huesped.apellido_paterno,huesped.apellido_materno,huesped.dni,reserva.fecha_entrada,reserva.fecha_salida,habitacion.id_habitacion	FROM public.reserva	JOIN huesped ON reserva.id_huesped = huesped.id_huesped JOIN habitacion	ON habitacion.id_habitacion = reserva.id_habitacion";
		List<Reserva> reservas = new ArrayList<>();
		
		try (PreparedStatement pstmt = cnx.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
            	String nombre = rs.getString("nombre");
            	String apellido_paterno = rs.getString("apellido_paterno");
            	String apellido_materno = rs.getString("apellido_materno");
            	String dni = rs.getString("dni");
            	Date fecha_entrada = rs.getDate("fecha_entrada");
            	Date fecha_salida = rs.getDate("fecha_salida");
            	int id_habitacion = rs.getInt("id_habitacion");
            	
            	Huesped huesped = new Huesped();
            	huesped.setNombre(nombre);
            	huesped.setApellido_paterno(apellido_paterno);
            	huesped.setApellido_materno(apellido_materno);
            	huesped.setDni(dni);
            	
            	Habitacion habitacion = new Habitacion();
            	habitacion.setId_habitacion(id_habitacion);
            	Reserva reserva = new Reserva();
            	
            	reserva.setFecha_entrada(fecha_entrada);
            	reserva.setFecha_salida(fecha_entrada);
            	reserva.setHuesped(huesped);
            	reserva.setHabitacion(habitacion);
            	reservas.add(reserva);
            	
            }
            
		return reservas;
		}
	}
}
