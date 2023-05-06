package DAO;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Dao {
	
	public Connection crearCnx()
	{
		Connection cnx = null;
		try
		{
			InitialContext context = new InitialContext();
			DataSource datasource = (DataSource)context.lookup("java:/jdbc/dbhotel");
			cnx = datasource.getConnection();
		}catch(Exception x)
		{
			throw new RuntimeException(x);
		}
		return cnx;
	}
	public void cerrarCnx(Connection cnx)
	{
		try
		{
			cnx.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
}
