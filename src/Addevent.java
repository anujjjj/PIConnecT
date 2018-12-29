

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
/**
 * Servlet implementation class Addevent
 */
@WebServlet("/Addevent")
public class Addevent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addevent() {
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
		String ename=request.getParameter("ename");
		String sdate=request.getParameter("sdate");
		String edate=request.getParameter("edate");
		String einfo=request.getParameter("einfo");

		HttpSession session = request.getSession(true);
int flag=0;
		
		try {
			SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd");			
			Date date=formatter1.parse(sdate);			
			LocalDate now = LocalDate.now();	
			Date now1 = formatter1.parse(edate);
			formatter1.format(now1);
			formatter1.format(date);
			long millis=System.currentTimeMillis();  
			java.sql.Date date1=new java.sql.Date(millis);  
			System.out.println(now1.before(date));
			System.out.println("asd");
			
			if(now1.before(date)) {
				session.setAttribute("error", "The last date should be after the start date");
				System.out.println("Surpassed");
				flag=1;
			}
		}
		catch(Exception e){
			//System.out.println("asd2");
			session.setAttribute("error", "The last date should be after the start date");
			//response.sendRedirect("/test2/Event?eventId="+eventId+"&Interest_idInterest="+interestId);
		}
		
		if(flag==1) {
			session.setAttribute("error", "The last date of the event should be after the start date");
			response.sendRedirect("/test2/jsp/add_delete_event.jsp");
		}
		
		else {
		String[] vals = request.getParameterValues("checkbox");
		String val;

		Mysqlconnect mcon=new Mysqlconnect();
        String sqlroot=mcon.name;
        String sqlpassword=mcon.password;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
	
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", sqlroot, sqlpassword); // gets a new connection
	
	
		PreparedStatement ps = c.prepareStatement("insert into  Event (eventName,startDate,endDate,einfo) values (?,?,?,?)");

		ps.setString(1,ename);
		ps.setString(2,sdate);
		ps.setString(3,edate);
		ps.setString(4,einfo);
        ps.executeUpdate();
		
        PreparedStatement ps2 = c.prepareStatement(" select eventId from Event order by eventId desc limit 1");
		ResultSet rs = ps2.executeQuery();
		if(rs.next()) {
			int evid= rs.getInt("eventId");

		
		for (int i=0;i<vals.length;i++) 
		{
			val=vals[i];
			
		  PreparedStatement ps1 = c.prepareStatement("insert into  Event_has_Interest (Event_eventId,Interest_idInterest) values (?,?)"); 
		  ps1.setInt(1, evid);
		  ps1.setString(2,val);
		  ps1.executeUpdate();
		}
System.out.println(evid);
System.out.println("ewewewew");

		}
		
	
			 c.close();
			 response.sendRedirect("/test2/jsp/super_admin.jsp");

		
            	
        
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	}

	

}
