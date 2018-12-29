<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import=" javax.servlet.http.HttpSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>PIConnecT</title>

	<style type="text/css">
	</style>

</head>

<body>

	<%
	HttpSession Session = request.getSession(true);	
 	String uid=(String)Session.getAttribute("username"); 
 	String iid = (String)request.getParameter("Interest_idInterest");
 	int interestid=-1;
 	int eprice=-1;
 	if(iid!=null) {
 		interestid = Integer.parseInt(request.getParameter("Interest_idInterest"));
 		eprice =(int)request.getAttribute("eprice");
 	}
 	int eventId =Integer.parseInt(request.getParameter("eventId")); 
	String eventName = (String)request.getAttribute("eventName");
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");
	String ldatevol = (String)request.getAttribute("ldatevol");
	String ldatereg = (String)request.getAttribute("ldatereg");
	String info = (String)request.getAttribute("info");
	String einfo = (String)request.getAttribute("einfo");
	String logo = (String)request.getAttribute("logo");
 	 

System.out.println(eprice);

	%>


	<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="navbar.jsp"></jsp:include>
	<div id="wrapper">
	

		
		<%! 
					public int Insert(String uid, int eventid,int interestid , int p, int r) {			
						
						
						try {
							Class.forName("com.mysql.jdbc.Driver");
						 // loads driver
						
						Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection
						System.out.println(p);
						
						PreparedStatement ps1 = c.prepareStatement("insert into Student_has_Event_has_Interest values(?,?,?,?,?) ");
						ps1.setString(1, uid);
						ps1.setInt(2, eventid);
						ps1.setInt(3, interestid);
						ps1.setInt(4, p);
						ps1.setInt(5, r);
						
					int rs1 = ps1.executeUpdate();
					System.out.println(rs1);
						if(rs1>0) {
							 System.out.println("DOne");
							 c.close();
							 return 1;
						}
						
						else {
							System.out.println("error");
							return 0;
						}
						}
						catch (ClassNotFoundException | SQLException e) {
							
							// TODO Auto-generated catch block				
							e.printStackTrace();
						}	
				%>

		<%!
						return 1;
					}
				%>
		<%! 
					public int Insert1(String uid,int eventid,int interestid , int p, int r) {			
						
						
						try {
							Class.forName("com.mysql.jdbc.Driver");
						 // loads driver
						
						Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection
						System.out.println(p);
						
						PreparedStatement ps1 = c.prepareStatement("insert into Student_has_Event_has_Interest values(?,?,?,?,?) ");
						ps1.setString(1, uid);
						ps1.setInt(2, eventid);
						ps1.setInt(3, interestid);
						ps1.setInt(4, 1);
						ps1.setInt(5, r);
						
					int rs1 = ps1.executeUpdate();
					System.out.println(rs1);
						if(rs1>0) {
							 System.out.println("DOne");
							 c.close();
							 return 1;
						}
						
						else {
							System.out.println("error");
							return 0;
						}
						}
						catch (ClassNotFoundException | SQLException e) {
							
							// TODO Auto-generated catch block				
							e.printStackTrace();
						}	
				%>

		<%!
						return 1;
					}
				%>
		<div id="page-wrapper" style="margin-top: 15px;">

			<div class="jumbotron" style="background-color:#eeeeee;">

				<div>
					<center>
						<h1>
							<%= eventName%>
						</h1>
					</center>
					<img src="<%=logo %>" alt="photo" height=250px style="float:right; margin-right:10%;">
					<p style="margin-left:10%">Start date:
						<%= startDate %>
					</p>
					<p style="margin-left:10%">End date:
						<%= endDate %>
					</p>
					<p style="margin-left:10%">Last date for volunteer:
						<%= ldatevol %>
					</p>
					<p style="margin-left:10%">Last date for registration:
						<%= ldatereg %>
					</p>
					<% if(info==null) { %>
					<p style="margin-left:10%">Info:
						<%=einfo %>
					</p><br>
					<% } 
                      else {
                                %>
					<p style="margin-left:10%">Info:
						<%=info %>
						
					</p>
					<p style="margin-left:10%">Entry Fee:
						<%=eprice %>
						
					</p><br>
					<%} %>


					<center>
					<%if(iid!=null) { %>
								<%request.setAttribute("interest", interestid); %>
							 	
      							  <a style="width:180px; margin:10px;" id="Manage"  class="btn btn-primary btn-lg" href="/test2/Manage?eventId=${eventId}&interestId=<%=interestid %>&manpar=0&ldate=<%=ldatevol %>"    role="button">MANAGE</a>
	                           		<a style="width:180px; margin:10px;" id="Participate"  class="btn btn-primary btn-lg" href="/test2/Manage?eventId=${eventId}&interestId=<%=interestid %>&manpar=1&ldate=<%=ldatereg %>"  role="button">PARTICIPATE</a>
					<%} %>		
					</center>
				</div>
				<%String error=(String)session.getAttribute("error"); %>
							 	<%
							 		if(error!=null) {
							 			
							 	%>
							 	<script>
							 		confirm(<%=error %>);
							 	</script>
							 	<center><p><%=error %></p></center>
							 	<%	
							 	session.removeAttribute("error");
							 		}
							 	%>
			</div>
		</div>
	
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>

</html>