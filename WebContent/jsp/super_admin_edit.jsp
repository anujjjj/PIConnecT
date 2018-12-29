
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box
}

body {
	font-family: "Lato", sans-serif;
}

/* Style the tab */
.tab {
	float: left;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	width: 15%;
	height: 300px;
}

/* Style the buttons inside the tab */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 16px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0px 12px;
	border: 1px solid #ccc;
	width: 85%;
	border-left: none;
	height: 300px;
}

#hidden {
	display: none;
	height: auto;
	/* background: red; */
}

:checked+#hidden {
	display: block;
}
</style>



</head>

<body>



	<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="navbar.jsp"></jsp:include>
    
    <div id="page-wrapper">

		<div class="row">

			<div class="col-lg-12">
				<h1 class="page-header">Add Admins</h1>
			</div>
		</div>
        
        <div class="row">
                        <label for="my_checkbox1">
						<h4 style="padding-left:15px;"><span toggle="#my_checkbox1" class="fa fa-plus-circle field-icon toggle-my_checkbox1"> Edit Admins for the event</span></h4>
					    </label>

					<input type="checkbox" id="my_checkbox1" style="display:none">
					<div id="hidden">
						<div  class="tabcontent" style="overflow-y:scroll;">
	
                          <div class="panel-body">
                            <form action="/test2/InsertAdmin" method="post">
                            	 <table width="100%" class="table table-striped table-bordered table-hover" id="vol_table">
                                
                                <tbody>

   				 <%
				         
				 		int eventId = Integer.parseInt(request.getParameter("eventId"));
						System.out.println("ev");
						System.out.println(eventId);
						session.setAttribute("eventId", eventId);
				 	
					try {
							Class.forName("com.mysql.jdbc.Driver");
						 // loads driver
						Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection
						
					
					PreparedStatement ps = c.prepareStatement("select * from Event_has_Interest where Event_eventId=?");
						ps.setInt(1, eventId);	
								


						
						ResultSet rs = ps.executeQuery();

								
					while(rs.next()) { 
						int  idInterest= rs.getInt("Interest_idInterest");
						PreparedStatement ps1 = c.prepareStatement("select interestsName from Interest where idInterest=? ");
						ps1.setInt(1, idInterest);	
						
						session.setAttribute(" idInterest",idInterest);	
										

						ResultSet rs1 = ps1.executeQuery();
						
						PreparedStatement ps2 = c.prepareStatement("select id from Admin where eventId=? && idInterest=? ");
						ps2.setInt(1, eventId);
						ps2.setInt(2, idInterest);	

						ResultSet rs2 = ps2.executeQuery();
						

						
						    while(rs1.next()){
								String interestsName= rs1.getString("interestsName");
								
								
						

					%>
                                    <tr>
                                        <td name="interestName"> Admin for <%=interestsName %> :</td>
                                        
                                        <td><input type="text"name="id" value=""></td>
                                    </tr>
							
					<%
						}}
							
						}	
				         
				         catch (ClassNotFoundException | SQLException e) 
				         {
								// TODO Auto-generated catch block				
									e.printStackTrace();
						 }	

					%>
								</tbody>
                            </table>
                                   
                            		<center><input type="submit" value="Add Admin"></center>
                           		 
                            </form>
                            
                            
                          </div>
                        </div>
					</div>
            </div>
            
            

	</div>
	
	
	
	
	
			

		<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>



		<script type="text/javascript">
        $(".toggle-my_checkbox1").click(function(){$(this).toggleClass("fa-plus-circle fa-minus-circle");});
        

    </script>
</body>
</html>


