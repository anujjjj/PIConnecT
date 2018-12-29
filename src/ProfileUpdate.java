

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Servlet implementation class ProfileUpdate
 */
@WebServlet("/ProfileUpdate")
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		HttpSession session = request.getSession(true);	
		String username=(String)session.getAttribute("username");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		


		
		ResultSet rs = null;
		
		
		Mysqlconnect mcon=new Mysqlconnect();
        String sqlroot=mcon.name;
        String sqlpassword=mcon.password;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
	
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", sqlroot, sqlpassword); // gets a new connection
	
		
		
		PreparedStatement ps=null; 
		ps= c.prepareStatement(" update User set email=? ,phone=? where id=? ");
		ps.setString(1, email);
		ps.setString(2, phone);
		ps.setString(3, username);
		
		
		ps.executeUpdate();
      
          
           
                
		c.close();
		//RequestDispatcher rd = request.getRequestDispatcher("jsp/profile.jsp");
        //rd.forward(request, response);	
		response.sendRedirect("/test2/Profile?id=username");
		return;
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}


