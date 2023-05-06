package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Clases.Habitacion;

public class DaoHabitacacion extends Dao {
	
	public void guardarHabitacion(Habitacion habitacion) {
		Connection cnx = crearCnx();
		String sqlhabitacion = "INSERT INTO public.habitacion( num_habitacion, tipo_habitacion, capacidad, disponibilidad, precio)VALUES ( ?, ?, ?, ?, ?)";
		try
		{
			PreparedStatement st = cnx.prepareStatement(sqlhabitacion);
			st.setString(1, habitacion.getNum_habitacion());
			st.setString(2, habitacion.getTipo_habitacion());
			st.setInt(3, habitacion.getCapacidad());
			st.setBoolean(4, habitacion.isDisponibilidad());
			st.setDouble(5, habitacion.getPrecio());
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
	
	public List<Habitacion> listar() {
		List<Habitacion> listarHabitacacion = new ArrayList<>();
		
		Connection cnx = crearCnx();
		String sql = "select id_habitacion,num_habitacion,tipo_habitacion,capacidad,disponibilidad,precio from public.habitacion";
		try {
			PreparedStatement ps = cnx.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id_habitacion = rs.getInt("id_habitacion");
				String num_habitacion = rs.getString("num_habitacion");
				String tipo_habitacion = rs.getString("tipo_habitacion");
				int capacidad = rs.getInt("capacidad");
				boolean disponibilidad = rs.getBoolean("disponibilidad");
				double precio = rs.getDouble("precio");
			
				Habitacion habitacion = new Habitacion();
				habitacion.setId_habitacion(id_habitacion);
				habitacion.setNum_habitacion(num_habitacion);
				habitacion.setTipo_habitacion(tipo_habitacion);
				habitacion.setCapacidad(capacidad);
				habitacion.setDisponibilidad(disponibilidad);
				habitacion.setPrecio(precio);
				listarHabitacacion.add(habitacion);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			try {
				cnx.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listarHabitacacion;
	}
	
}
