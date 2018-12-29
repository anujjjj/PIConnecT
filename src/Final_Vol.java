

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;

/**
 * Servlet implementation class Final_Vol
 */
@WebServlet("/Final_Vol")
public class Final_Vol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Final_Vol() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession(true);	
		int eventId=(int)session.getAttribute("eventId");
		int idInterest=(int)session.getAttribute("idInterest");
		
		
		Mysqlconnect mcon=new Mysqlconnect();
        String sqlroot=mcon.name;
        String sqlpassword=mcon.password;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
	
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", sqlroot, sqlpassword);
		
		
		PreparedStatement ps = c.prepareStatement(
		"select u.id from Student_has_Event_has_Interest as s inner join User as u on s.Student_id=u.id where s.Event_has_Interest_Event_eventId=? and s.Event_has_Interest_Interest_idInterest=? and s.managedparticipate = 0 and s.reqacceptdecline=2");
		ps.setInt(1, eventId);
		ps.setInt(2, idInterest);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			String id = rs.getString("id");
			PreparedStatement pStmt = c.prepareStatement("update Student_has_Event_has_Interest set reqacceptdecline=? where Event_has_Interest_Event_eventId=? and Event_has_Interest_Interest_idInterest=? and Student_id=?");
			int answer = Integer.parseInt( request.getParameter(id));
			pStmt.setString(4, id);
			pStmt.setInt(1, answer);
			pStmt.setInt(2, eventId);
			pStmt.setInt(3, idInterest);
			
			 pStmt.executeUpdate();
		}
		
		
	//	RequestDispatcher rd = request.getRequestDispatcher("jsp/admin_event.jsp");
     //   rd.forward(request, response); 
		response.sendRedirect("jsp/admin_event.jsp?eventId="+eventId+"&idInterest="+idInterest);
        c.close();
        
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		
		
	

}}
