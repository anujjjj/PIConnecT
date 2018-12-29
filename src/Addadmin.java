
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Addadmin
 */
@WebServlet("/Addadmin")
public class Addadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addadmin() {
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
		String id=request.getParameter("id");
		

		HttpSession session = request.getSession(true);	
		int eventId=(int)session.getAttribute("eventId");
		int  idInterest=(int)session.getAttribute(" idInterest");

		System.out.println(eventId);

		Mysqlconnect mcon=new Mysqlconnect();
        String sqlroot=mcon.name;
        String sqlpassword=mcon.password;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
	
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", sqlroot, sqlpassword); // gets a new connection
	
	
		PreparedStatement ps = c.prepareStatement("update Admin set id=? where eventId=? and idInterest=?");

		ps.setString(1, id);
		ps.setInt(2,eventId);
		ps.setInt(3, idInterest);
		

		
		int ra = ps.executeUpdate();
       
		
	    if(ra>0) {
			 c.close();
			 session.setAttribute("error", "The Event Details  are updated");
			 response.sendRedirect("/test2/jsp/super_admin_edit.jsp?eventId="+eventId+"");
		}
		
		else {
			
			System.out.println("error");
			
		}
	   
		 
	String eventId1=Integer.toString(eventId);
	String idInterest1=Integer.toString(idInterest);

		
		
  	   session.removeAttribute(eventId1);
  	   session.removeAttribute(idInterest1);


            	
            	//response.sendRedirect("signup_success.jsp");
        
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
