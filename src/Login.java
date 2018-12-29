

//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import org.mindrot.jbcrypt.*;


/**
 * Servlet implementation class Login
 */
@WebServlet("/jsp/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
		String pw_hash="";
		String firstName;
 		
		// Connect to mysql and verify username password
		
		Mysqlconnect mcon=new Mysqlconnect();
        String sqlroot=mcon.name;
        String sqlpassword=mcon.password;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", sqlroot, sqlpassword); // gets a new connection
		
		
		PreparedStatement ps1 = c.prepareStatement("select id,password,firstName from User where id=? ");
		ps1.setString(1, un);		
		
		ResultSet rs1 = ps1.executeQuery();
		if(rs1.next()) {
			 pw_hash = rs1.getString("password");
			 firstName =rs1.getString("firstName");
		}
		
		else {
			request.setAttribute("errorMessage", "User not found");
	        RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
	        rd.forward(request, response); 
	        c.close();
			return;
		}
		 
		
		PreparedStatement ps = c.prepareStatement("select id,password from User where id=? and password=?");
		ps.setString(1, un);
		ps.setString(2, pw_hash);
 
		ResultSet rs = ps.executeQuery();		
		
		while (rs.next()) {
//			response.sendRedirect("success.html");
//			response.getWriter().append("Logged In").append(request.getContextPath());
			
			if(BCrypt.checkpw(pw, pw_hash)) {
			HttpSession session = request.getSession(true);	    
			session.setAttribute("firstName",firstName); 
			session.setAttribute("username",un);
			response.sendRedirect("dashboard.jsp");		
			c.close();
			return;
			}
			
		}
		
		//response.sendRedirect("error.html");
		HttpSession session = request.getSession(true);	
		session.invalidate();
        request.setAttribute("errorMessage", "Invalid password");
        RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
        rd.forward(request, response); 
        c.close();
		return;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block				
			e.printStackTrace();
		}	    
	        
	}

}