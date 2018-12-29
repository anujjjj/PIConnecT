

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


import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class Event
 */
@WebServlet(description = "displays the event information", urlPatterns = { "/Event" })
public class Event extends HttpServlet  {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int eventId =Integer.parseInt(request.getParameter("eventId"));	
		int interestID;
		String iid = request.getParameter("Interest_idInterest");
		System.out.println(iid);
		if(iid!=null) {
			 interestID=Integer.parseInt(request.getParameter("Interest_idInterest"));
		}
		else {
			interestID= -1;
		}
		
		Mysqlconnect mcon=new Mysqlconnect();
        String sqlroot=mcon.name;
        String sqlpassword=mcon.password;
		
        try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection c=null;
		c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", sqlroot, sqlpassword);
		PreparedStatement pst=null;
		PreparedStatement pst1=null;
		pst = c.prepareStatement("select * from Event where eventId=? ");
		pst1= c.prepareStatement("select info,eprice from Event_has_Interest where Event_eventId=? && Interest_idInterest=?");
		pst.setInt(1, eventId);	
		pst1.setInt(1, eventId);
		pst1.setInt(2, interestID);
		

		ResultSet rs = pst.executeQuery();
		
		
		if(rs.next()) {
			String  eventName= rs.getString("eventName");
			String  startDate= rs.getString("startDate");
			String  endDate= rs.getString("endDate");			
			String  ldatevol= rs.getString("ldatevol");			
			String  ldatereg= rs.getString("ldatereg");
			String  einfo = rs.getString("einfo");
			String  logo = rs.getString("logo");


			request.setAttribute("eventName", eventName);				
			request.setAttribute("eventId", eventId);
			request.setAttribute("ldatevol", ldatevol);
			request.setAttribute("ldatereg", ldatereg);
			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);
			request.setAttribute("einfo", einfo);
			request.setAttribute("logo", logo);

			pst.close();
		
		}	
		
		if(interestID!=-1) {
			ResultSet rs1 = pst1.executeQuery();
			if(rs1.next()) {
				String  info= rs1.getString("info");
				int eprice=rs1.getInt("eprice");
				request.setAttribute("info", info);	
				request.setAttribute("eprice", eprice);				
	
				
				pst1.close();
				
			}	
		}
		c.close();
		RequestDispatcher rd = request.getRequestDispatcher("jsp/event.jsp");
        rd.forward(request, response);	
		
		return;	
		}
		catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	

}