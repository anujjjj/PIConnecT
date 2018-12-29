
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.*;



/**
 * Servlet implementation class SignUp
 */
@WebServlet("/jsp/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String eno=request.getParameter("eno");
		String dob=request.getParameter("dob");
		String adyear=request.getParameter("adyear");
		String branch=request.getParameter("branch");
		String lname=request.getParameter("lname"); 
		String[] vals = request.getParameterValues("checkbox");
		String val;
		String CandidateId; 
		ResultSet rs = null;
		ResultSet rs1 = null;
		
		Mysqlconnect mcon=new Mysqlconnect();
        String sqlroot=mcon.name;
        String sqlpassword=mcon.password;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
	
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", sqlroot, sqlpassword); // gets a new connection
		
		String pw_hash = BCrypt.hashpw(pw, BCrypt.gensalt()); 
		
		String sql="insert into User(id,email,password,firstName,lastName,phone,dob,branch,adyear)" + "values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		ps.setString(4, un);
		ps.setString(3, pw_hash);
		ps.setString(2, email);
		ps.setString(6, phone);
		ps.setString(1, eno);
		ps.setString(5, lname);
		ps.setString(7, dob);
		ps.setString(8, branch);
		ps.setString(9, adyear);
		
		int rowAffected = ps.executeUpdate();
		
		PreparedStatement ps1 = c.prepareStatement("Insert into Student values(?)");
	    ps1.setString(1, eno);
	    ps1.executeUpdate();
		
	    
	    PreparedStatement pStmt = c.prepareStatement("Insert into Student_has_Interest values (?,?)");
		for (int i=0;i<vals.length;i++) {
			val=vals[i];
		
		  pStmt.setString(1, eno);
		  pStmt.setString(2, val);
		// System.out.println(val);
		 pStmt.executeUpdate();
		 
		}
		
		;
        //pStmt.close();
		
		
        if(rowAffected == 1)
        {
            // get candidate id
            rs = ps.getGeneratedKeys();
            if(rs.next())
                CandidateId = rs.getString(1);
            	c.close();
  	
            	RequestDispatcher rd = request.getRequestDispatcher("/jsp/signup_success.jsp");
                rd.forward(request, response); 
                c.close();
            	//response.sendRedirect("signup_success.jsp");
        }
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}