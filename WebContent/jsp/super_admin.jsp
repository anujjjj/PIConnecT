<!DOCTYPE html>
<%@page import="javax.servlet.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%@ page import=" javax.servlet.http.HttpSession"%>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PIConnecT</title>

<style type="text/css">
</style>

</head>
    
<body>

   
<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="navbar.jsp"></jsp:include>


<% 	String id=(String)session.getAttribute("username");%>

   <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/dbms"
         user = "root"  password = "123" />
 <sql:query dataSource = "${snapshot}" var = "result">
         select * from SuperAdmin cross join Event where id=?
         <sql:param value = "${sessionScope.username}" />
 </sql:query> 
 
 <sql:query dataSource = "${snapshot}" var = "result1">
         select * from SuperAdmin where id=?
         <sql:param value = "${sessionScope.username}" />
 </sql:query>  
                          
                         
                        
                          
        <div id="page-wrapper">
            <div class="row">
            
                <div class="col-lg-12">
                    <h1 class="page-header">Super Admin</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div> 
            
            <c:forEach var = "row" items = "${result1.rows}">
			<div class="row"> 
                

                                      <c:forEach var = "row" items = "${result.rows}">    

                
            
                <div class="col-lg-3 col-md-6">
                  
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div> 
                                    <h4><c:out value = "${row.eventName}"/></h4>
                          				
									</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <a href="/test2/jsp/super_admin_edit.jsp?eventId=${row.eventId}"><span class="pull-left">View Details</span></a>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                  </div>
            <!-- /.row -->
                   </c:forEach>
                   
                      
                   
                   <div class="col-lg-3 col-md-6">
                  
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-plus"></i>
                                    <i class="fa fa-minus"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div> 
                                    <h4><c:out value = "Add  Event"/></h4>
                          				
									</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <a href="/test2/jsp/add_delete_event.jsp"><span class="pull-left">View Details</span></a>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                  </div>
                   
                   
                   <div class="col-lg-3 col-md-6">
                  
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-plus"></i>
                                    <i class="fa fa-minus"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div> 
                                    <h4><c:out value = "Delete User"/></h4>
                          				
									</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <a href="/test2/jsp/deleteUser.jsp"><span class="pull-left">View Details</span></a>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                  </div>
            
        </div>
        
        <div class="row">

			<label for="my_checkbox1">

				<h4 style="padding-left: 15px;">
					<span toggle="#my_checkbox1"
						class="fa fa-plus-circle field-icon toggle-my_checkbox1">
						ALL EVENT DETAILS</span>
				</h4>
			</label> <input type="checkbox" id="my_checkbox1" style="display: none">
			<div id="hidden">
				<div class="tabcontent" style="overflow-y: scroll;">


					<div class="panel-body">
						<form role="form" action=" /test2/Pdf" method="post">
						<table 
							class="table table-striped table-bordered table-hover"
							id="vol_table">
							<thead>
								<tr>
								    <th style="width:15%">Event Name</th>
									
									<th style="width:15%">Start Date</th>
									<th style="width:20%">End Date</th>
									<th style="width:15%">Last Volunteering date</th>
									<th style="width:20%">Last Participating date</th>
								</tr>
							</thead>
							<tbody>
								<tr class="odd gradeX">




									<%
										

										try {
											Class.forName("com.mysql.jdbc.Driver");
											// loads driver
											Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection

											PreparedStatement ps = c.prepareStatement("select * from SuperAdmin cross join Event where id=?");
											ps.setString(1,id);

											

											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
												String eventName = rs.getString("eventName");
												String startDate = rs.getString("startDate");
												String endDate = rs.getString("endDate");
												String ldatevol = rs.getString("ldatevol");
												String ldatereg = rs.getString("ldatereg");
									%>
									<td><input style="margin:0px; border:0px;width:100%" type="text" value="<%=eventName%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=startDate%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=endDate%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=ldatevol%>" disabled></td>
									<td><input style="margin:0px; border:0px;width:100%"type="text" value="<%=ldatereg%>" disabled></td>


									
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
							<input type="submit" value="Print">
						</center>
						</form>
						
						
						</form>
					</div>

				</div>
			</div>
		</div>
        <!-- /#page-wrapper -->


                   </c:forEach>
    
    <script type="text/javascript">
		$(".toggle-my_checkbox1").click(function() {
			$(this).toggleClass("fa-plus-circle fa-minus-circle");
		});
		
	</script>
	
</body>

</html>
