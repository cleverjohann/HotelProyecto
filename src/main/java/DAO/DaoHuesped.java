package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Clases.Huesped;

public class DaoHuesped extends Dao {
	
	public void guardar (Huesped huesped)
	{
		Connection cnx = crearCnx();
		String sqlhuesped = "INSERT INTO public.huesped(nombre, apellido_paterno, apellido_materno, direccion, dni, telefono, email)VALUES ( ?, ?, ?, ?, ?, ?, ?)";
		try
		{
			PreparedStatement st = cnx.prepareStatement(sqlhuesped);
			st.setString(1, huesped.getNombre());
			st.setString(2, huesped.getApellido_paterno());
			st.setString(3, huesped.getApellido_materno());
			st.setString(4, huesped.getDireccion());
			st.setString(5, huesped.getDni());
			st.setString(6, huesped.getTelefono());
			st.setString(7, huesped.getEmail());
			st.execute();
			
		}catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			try {
				cnx.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	public List<Huesped> obtenerHuespedes() throws SQLException {
		Connection cnx = crearCnx();
        String sql = "SELECT * FROM public.huesped";
        List<Huesped> huespedes = new ArrayList<>();

        try (PreparedStatement pstmt = cnx.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id_huesped = rs.getInt("id_huesped");
                String nombre = rs.getString("nombre");
                String apellido_paterno = rs.getString("apellido_paterno");
                String apellido_materno = rs.getString("apellido_materno");
                String direccion = rs.getString("direccion");
                String dni = rs.getString("dni");
                String telefono = rs.getString("telefono");
                String email = rs.getString("email");
                
                Huesped huesped = new Huesped();
                huesped.setId_huesped(id_huesped);
                huesped.setNombre(nombre);
                huesped.setApellido_paterno(apellido_paterno);
                huesped.setApellido_materno(apellido_materno);
                huesped.setDireccion(direccion);
                huesped.setDni(dni);
                huesped.setTelefono(telefono);
                huesped.setEmail(email);
                huespedes.add(huesped);
            }
        }

        return huespedes;
    }
	public int obtenerUltimoIdHuesped() throws SQLException {
		Connection cnx = crearCnx();
	    String sql = "SELECT MAX (id_huesped) as id_huesped FROM public.huesped";
	    int ultimoId = 0;

	    try (PreparedStatement pstmt = cnx.prepareStatement(sql)) {
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            ultimoId = rs.getInt("id_huesped");
	        }
	    }catch(SQLException e)
	    {
	    	e.printStackTrace();
	    }

	    return ultimoId;
	}
}
