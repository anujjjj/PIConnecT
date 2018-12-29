
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
				<h1 class="page-header">Tables</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<div class="row">

			<label for="my_checkbox1">

				<h4 style="padding-left: 15px;">
					<span toggle="#my_checkbox1"
						class="fa fa-plus-circle field-icon toggle-my_checkbox">
						Volunteers</span>
				</h4>
			</label> <input type="checkbox" id="my_checkbox1" style="display: none">
			<div id="hidden">
				<div class="tabcontent" style="overflow-y: scroll;">


					<div class="panel-body">
						<form role="form" action=" /test2/Final_Vol">
						<table 
							class="table table-striped table-bordered table-hover"
							id="vol_table">
							<thead>
								<tr>
								    <th style="width:15%">Enrollment no</th>
									<th style="width:15%">First Name</th>
									<th style="width:15%">Last Name</th>
									<th style="width:20%">Email id</th>
									<th style="width:15%">Phone no</th>
									<th style="width:20%">Accept | Pending | Reject</th>
								</tr>
							</thead>
							<tbody>
								<tr class="odd gradeX">




									<%
										int eventId = Integer.parseInt(request.getParameter("eventId"));
										int idInterest = Integer.parseInt(request.getParameter("idInterest"));

										try {
											Class.forName("com.mysql.jdbc.Driver");
											// loads driver
											Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection

											PreparedStatement ps = c.prepareStatement(
													"select u.id,u.firstName,u.lastName,u.email,u.phone,s.Event_has_Interest_Event_eventId,s.Event_has_Interest_Interest_idInterest from Student_has_Event_has_Interest as s inner join User as u on s.Student_id=u.id where s.Event_has_Interest_Event_eventId=? and s.Event_has_Interest_Interest_idInterest=? and s.managedparticipate = 0 and s.reqacceptdecline=2");
											ps.setInt(1, eventId);
											ps.setInt(2, idInterest);

											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
												String id = rs.getString("id");
												String firstName = rs.getString("firstName");
												String lastName = rs.getString("lastName");
												String email = rs.getString("email");
												String phone = rs.getString("phone");
									%>
									<td><input style="margin:0px; border:0px;width:100%" type="text" value="<%=id%>" name="eno" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=firstName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=lastName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=email%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=phone%>" disabled></td>


									<td><input name="<%=id%>" type="radio"style="margin-left: 12%" value="1">
								    <input name="<%=id%>" type="radio" style="margin-left: 13%" value="2" checked> 
								    <input name="<%=id%>" type="radio" style="margin-left: 14%" value="0"></td>
								</tr>


								<%
									}

									}

									catch (ClassNotFoundException | SQLException e) {

										// TODO Auto-generated catch block				
										e.printStackTrace();
									}
								%>



							</tbody>
						</table>
						<!-- /.table-responsive -->
						<center>
							<input type="submit" value="Submit">
						</center>
						</form>
					</div>

				</div>
			</div>
		</div>




		<div class="row">


			<label for="my_checkbox2">

				<h4 style="padding-left: 15px;">
					<span toggle="#my_checkbox2"
						class="fa fa-plus-circle field-icon toggle-my_checkbox">
						Participants</span>
				</h4>
			</label> <input type="checkbox" id="my_checkbox2" style="display: none">
			<div id="hidden">
				<div class="tabcontent" style="overflow-y: scroll;">


					<div class="panel-body">
					<form role="form" action=" /test2/Final_Par">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="vol_table">
							<thead>
								<tr>
									<th style="width:15%">Enrollment no</th>
									<th style="width:15%">First Name</th>
									<th style="width:15%">Last Name</th>
									<th style="width:20%">Email id</th>
									<th style="width:15%">Phone no</th>
									<th style="width:20%">Accept | Pending | Reject</th>
								</tr>
							</thead>
							<tbody>
								<tr class="odd gradeX">




									<%
										try {
											Class.forName("com.mysql.jdbc.Driver");
											// loads driver
											Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection

											PreparedStatement ps = c.prepareStatement(
													" select u.id,u.firstName,u.lastName,u.email,u.phone,s.Event_has_Interest_Event_eventId,s.Event_has_Interest_Interest_idInterest from Student_has_Event_has_Interest as s inner join User as u on s.Student_id=u.id where s.Event_has_Interest_Event_eventId=? and s.Event_has_Interest_Interest_idInterest=? and s.managedparticipate = 1 and s.reqacceptdecline=2");
											ps.setInt(1, eventId);
											ps.setInt(2, idInterest);

											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
												String id = rs.getString("id");
												String firstName = rs.getString("firstName");
												String lastName = rs.getString("lastName");
												String email = rs.getString("email");
												String phone = rs.getString("phone");
									%>
									<td><input style="margin:0px; border:0px;width:100%" type="text" value="<%=id%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=firstName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=lastName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=email%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=phone%>" disabled></td>



									<td><input name="<%=id%>" type="radio"style="margin-left: 12%" value="1">
								    <input name="<%=id%>" type="radio" style="margin-left: 13%" value="2" checked> 
								    <input name="<%=id%>" type="radio" style="margin-left: 14%" value="0"></td>
								</tr>


								<%
									}

									}

									catch (ClassNotFoundException | SQLException e) {

										// TODO Auto-generated catch block				
										e.printStackTrace();
									}
								%>



							</tbody>
						</table>
						<!-- /.table-responsive -->
						<center>
							<input type="submit" value="Submit">
						</center>
                     </form>
					</div>

				</div>
			</div>
		</div>
		<div class="row">


			<label for="my_checkbox3">

				<h4 style="padding-left: 15px;">
					<span toggle="#my_checkbox3"
						class="fa fa-plus-circle field-icon toggle-my_checkbox">
						Final Volunteers List</span>
				</h4>
			</label> <input type="checkbox" id="my_checkbox3" style="display: none">
			<div id="hidden">
				<div class="tabcontent" style="overflow-y: scroll;">


					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="vol_table">
							<thead>
								<tr>
								    <th style="width:15%">Enrollment no</th>
									<th style="width:15%">First Name</th>
									<th style="width:15%">Last Name</th>
									<th style="width:20%">Email id</th>
									<th style="width:15%">Phone no</th>
									
								</tr>
							</thead>
							<tbody>
								<tr class="odd gradeX">




									<%
										try {
											Class.forName("com.mysql.jdbc.Driver");
											// loads driver
											Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection

											PreparedStatement ps = c.prepareStatement(
													"select u.id,u.firstName,u.lastName,u.email,u.phone,s.Event_has_Interest_Event_eventId,s.Event_has_Interest_Interest_idInterest from Student_has_Event_has_Interest as s inner join User as u on s.Student_id=u.id where s.Event_has_Interest_Event_eventId=? and s.Event_has_Interest_Interest_idInterest=? and s.managedparticipate = 0 and s.reqacceptdecline=1");
											ps.setInt(1, eventId);
											ps.setInt(2, idInterest);

											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
												String id = rs.getString("id");
												String firstName = rs.getString("firstName");
												String lastName = rs.getString("lastName");
												String email = rs.getString("email");
												String phone = rs.getString("phone");
									%>
									<td><input style="margin:0px; border:0px;width:100%" type="text" value="<%=id%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=firstName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=lastName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=email%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=phone%>" disabled></td>



								</tr>


								<%
									}

									}

									catch (ClassNotFoundException | SQLException e) {

										// TODO Auto-generated catch block				
										e.printStackTrace();
									}
								%>



							</tbody>
						</table>
						<!-- /.table-responsive -->
						<center>
							<input type="submit" value="Submit">
						</center>

					</div>

				</div>
			</div>
		</div>

		<div class="row">

			<label for="my_checkbox4">

				<h4 style="padding-left: 15px;">
					<span toggle="#my_checkbox4"
						class="fa fa-plus-circle field-icon toggle-my_checkbox">
						Final Participants List</span>
				</h4>
			</label> <input type="checkbox" id="my_checkbox4" style="display: none">
			<div id="hidden">
				<div class="tabcontent" style="overflow-y: scroll;">


					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="vol_table">
							<thead>
								<tr>
									<th style="width:15%">Enrollment no</th>
									<th style="width:15%">First Name</th>
									<th style="width:15%">Last Name</th>
									<th style="width:20%">Email id</th>
									<th style="width:15%">Phone no</th>
									
								</tr>
							</thead>
							<tbody>
								<tr class="odd gradeX">




									<%
										try {
											Class.forName("com.mysql.jdbc.Driver");
											// loads driver
											Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection

											PreparedStatement ps = c.prepareStatement(
													"select u.id,u.firstName,u.lastName,u.email,u.phone,s.Event_has_Interest_Event_eventId,s.Event_has_Interest_Interest_idInterest from Student_has_Event_has_Interest as s inner join User as u on s.Student_id=u.id where s.Event_has_Interest_Event_eventId=? and s.Event_has_Interest_Interest_idInterest=? and s.managedparticipate = 1 and s.reqacceptdecline=1");
											ps.setInt(1, eventId);
											ps.setInt(2, idInterest);

											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
												String id = rs.getString("id");
												String firstName = rs.getString("firstName");
												String lastName = rs.getString("lastName");
												String email = rs.getString("email");
												String phone = rs.getString("phone");
									%>
									<td><input style="margin:0px; border:0px;width:100%" type="text" value="<%=id%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=firstName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=lastName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=email%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=phone%>" disabled></td>



								</tr>


								<%
									}

									}

									catch (ClassNotFoundException | SQLException e) {

										// TODO Auto-generated catch block				
										e.printStackTrace();
									}
								%>



							</tbody>
						</table>
						<!-- /.table-responsive -->
						<center>
							<input type="submit" value="Submit">
						</center>

					</div>

				</div>
			</div>
		</div>

		<div class="row">
			<label for="my_checkbox5">
				<h4 style="padding-left: 15px;">
					<span toggle="#my_checkbox5"
						class="fa fa-plus-circle field-icon toggle-my_checkbox5">
						Edit event details</span>
				</h4>
			</label> <input type="checkbox" id="my_checkbox5" style="display: none">
			<div id="hidden">
				<div class="tabcontent" style="overflow-y: scroll;">
					<%
						session.setAttribute("eventId", eventId);
						session.setAttribute("idInterest", idInterest);
					%>
					<div class="panel-body">
						<form role="form" action="/test2/EditEvent" method="post">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="vol_table">
								<tbody>
									<tr>
										<%
											try {

												Class.forName("com.mysql.jdbc.Driver");
												// loads driver
												Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection

												PreparedStatement ps = c.prepareStatement(
														"select  e.startdate,e.endDate,e.ldatevol,e.ldatereg,e.einfo,i.info from Event as e join Event_has_Interest as i on e.eventId=i.Event_eventId where eventId=? and Interest_idInterest=?");
												ps.setInt(1, eventId);
												ps.setInt(2, idInterest);

												ResultSet rs = ps.executeQuery();

												if (rs.next()) {
													String startDate = rs.getString("startDate");
													String endDate = rs.getString("endDate");
													String ldatevol = rs.getString("ldatevol");
													String ldatereg = rs.getString("ldatereg");
													String einfo = rs.getString("einfo");
													String info = rs.getString("info");
										%>

										<td>Event start date</td>
										<td><input type="date" name="sdate"
											value="<%=startDate%>"></td>
									</tr>
									<tr>
										<td>Event end date</td>
										<td><input type="date" name="edate" value="<%=endDate%>"></td>
									</tr>
									<tr>
										<td>Last date for Participating</td>
										<td><input type="date" name="lreg" value="<%=ldatereg%>"></td>
									</tr>
									<tr>
										<td>Last date for Volunteering</td>
										<td><input type="date" name="lvol" value="<%=ldatevol%>">
										</td>
									</tr>
									<tr>
										<td>Event Information</td>
										<td><textarea rows="4" cols="50" name="einfo"><%=einfo%>
												</textarea></td>
									</tr>
									<tr>
										<td>Interest Information</td>
										<td><textarea rows="4" cols="50" name="info"><%=info%>
												</textarea></td>

									</tr>
									<%
										}

										}

										catch (ClassNotFoundException | SQLException e) {

											// TODO Auto-generated catch block				
											e.printStackTrace();
										}
									%>

									

								</tbody>
								
							</table>
							
							<center>
										<input type="submit" value="Edit Details">
							</center>

						</form>
						<%
							String error1 = (String) session.getAttribute("error");
							System.out.println(error1);
						%>
						<%
							if (error1 != null) {
						%>
						<script>
							confirm(
						<%=error1%>
							);
						</script>
						<center>
							<p><%=error1%></p>
						</center>
						<%
							session.removeAttribute("error");
							}
						%>



					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(".toggle-my_checkbox1").click(function() {
			$(this).toggleClass("fa-plus-circle fa-minus-circle");
		});
		$(".toggle-my_checkbox2").click(function() {
			$(this).toggleClass("fa-plus-circle fa-minus-circle");
		});
		$(".toggle-my_checkbox3").click(function() {
			$(this).toggleClass("fa-plus-circle fa-minus-circle");
		});
		$(".toggle-my_checkbox4").click(function() {
			$(this).toggleClass("fa-plus-circle fa-minus-circle");
		});
		$(".toggle-my_checkbox5").click(function() {
			$(this).toggleClass("fa-plus-circle fa-minus-circle");
		});
	</script>


</body>
</html>


