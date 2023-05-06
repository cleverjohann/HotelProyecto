package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
  
  private static final String DB_URL = "jdbc:postgresql://localhost:5432/login";
  private static final String DB_USER = "postgres";
  private static final String DB_PASSWORD = "postgres";

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
      String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
      PreparedStatement statement = connection.prepareStatement(sql);
      statement.setString(1, username);
      statement.setString(2, password);
      ResultSet result = statement.executeQuery();
      
      if (result.next()) {
        // Si las credenciales son válidas, establecer la sesión del usuario
        HttpSession session = request.getSession();
        session.setAttribute("user", username);
        
        // Redirigir al usuario a una página de bienvenida
        response.sendRedirect("welcome.jsp");
      } else {
    	  request.setAttribute("errorMessage", "Invalid username or password");
    	  request.getRequestDispatcher("login.jsp").forward(request, response);
    	  }
    } catch (SQLException e) {
    	  e.printStackTrace();
    	}
  }
}
