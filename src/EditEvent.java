

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class EditEvent
 */
@WebServlet("/EditEvent")
public class EditEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEvent() {
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
	
		String sdate=request.getParameter("sdate");
		String edate=request.getParameter("edate");
		String lvol=request.getParameter("lvol");
		String lreg=request.getParameter("lreg");
		String einfo=request.getParameter("einfo");
		String info=request.getParameter("info");

		HttpSession session = request.getSession(true);	
		int eventId=(int)session.getAttribute("eventId");
		int idInterest=(int)session.getAttribute("idInterest");

		System.out.println(eventId);

		Mysqlconnect mcon=new Mysqlconnect();
        String sqlroot=mcon.name;
        String sqlpassword=mcon.password;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
	
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", sqlroot, sqlpassword); // gets a new connection
	
	
		PreparedStatement ps = c.prepareStatement("update Event set startDate=?, endDate=?, ldatevol=? ,ldatereg=? ,einfo=? where eventId=?");

		ps.setString(1, sdate);
		ps.setString(2,edate);
		ps.setString(3,lvol);
		ps.setString(4,lreg);
		ps.setString(5,einfo);
		ps.setInt(6,eventId);

		
		int rowAffected = ps.executeUpdate();
       
		PreparedStatement ps1 = c.prepareStatement("update Event_has_Interest set info=? where Interest_idInterest=?");
	    ps1.setString(1, info);
	    ps1.setInt(2, idInterest);

	    int rs1=ps1.executeUpdate();
		
	    if(rs1>0) {
			 c.close();
			 session.setAttribute("error", "The Event Details  are updated");
			 response.sendRedirect("/test2/jsp/admin_event.jsp?eventId="+eventId+"&idInterest="+idInterest+"");

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
