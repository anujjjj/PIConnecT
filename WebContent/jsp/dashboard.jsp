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
<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>




<style type="text/css">
        .tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    }

    /* Style the buttons inside the tab */
    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        transition: 0.3s;
        font-size: 17px;
    }

    /* Change background color of buttons on hover */
    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current tablink class */
    .tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        display: none;
        padding: 6px 12px;
        border: 1px solid #ccc;
        border-top: none;
    }
    </style>
</head>
    
<body>
	<% 
		response.setHeader("Cache-Control","no-cache");
	    response.setHeader("Cache-Control","no-store");
	    response.setDateHeader("Expires", 0);
	    response.setHeader("Pragma","no-cache");
		String user=(String)session.getAttribute("username");
		String firstName=(String)session.getAttribute("firstName");
	    if(user==null)
	    {        
	    	response.sendRedirect("login.jsp");
	    }
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="navbar.jsp"></jsp:include>
	                                   
	 
	 
	 <div id="wrapper" style="margin-top: 15px;"> 
	 <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/dbms"
         user = "root"  password = "123" />
 
     
 
     <!--   <table border = "1" width = "100%">
         <tr>
            <th>Event Name</th>

            <th>Event info</th>
         </tr>
              </table>
         -->
         
        
  

     <div id="page-wrapper" style="margin-top: 15px;">
            
            <!-- /.row -->
            <div class="tab">
              <button class="tablinks" onclick="openCity(event, 'Upcoming_events')" id="defaultOpen">Upcoming Events</button>
              <button class="tablinks" onclick="openCity(event, 'Your Interests Related Events')">Your Interests Related Events</button>
           <button class="tablinks" onclick="openCity(event, 'All_events') ">All Events</button>           </div>

            <div id="Upcoming_events" class="tabcontent">
              <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Upcoming Events
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <sql:query dataSource = "${snapshot}" var = "result2">
         SELECT einfo,eventId,eventName from Event where DateDiff(startDate,curdate()) between 0 and 120;
      </sql:query>
                                                    
                       
                            
                        <%for(int i=0;i<1;i++){ %> 
                          <c:forEach var = "row" items = "${result2.rows}">                                  
				 <div class="col-lg-4" style="width:100%">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <c:out value = "${row.eventName}"/>
                        </div>
                        <div class="panel-body">
                            <p>  <c:out value = "${row.einfo}"/></p>
                            
                        </div>
                        <div class="panel-footer">
                            <a href="/test2/Event?eventId=${row.eventId}" >Know More >>></a>
                        </div>
                    </div>
                </div>
                
                </c:forEach>
 
                                                   <%  }%>                           
                                                   
                                                   
                                                   
                                                   
                        </div>
                        <!-- /.panel-body -->
                    </div>
            </div>

            <div id="Your Interests Related Events" class="tabcontent">
              <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Your Interests Related Events
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <sql:query dataSource = "${snapshot}" var = "result1">
         select eventId,A.Interest_idInterest,eventName,einfo,info from Event_has_Interest as A join Student_has_Interest as B on B.Interest_idInterest  = A.Interest_idInterest  join Event as C on C.eventId = A.Event_eventId where Student_id = ?;
                           <sql:param value = "${sessionScope.username}" />
         
      </sql:query>
                         <%for(int i=0;i<1;i++){ %> 
                          <c:forEach var = "row" items = "${result1.rows}">                                  
				 <div class="col-lg-4" style="width:100%">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <c:out value = "${row.eventName}"/>
                        </div>
                        <div class="panel-body">
                            <p>  <c:out value = "${row.einfo}"/></p>
                            <p>  <c:out value = "${row.info}"/></p>
                        </div>
                        <div class="panel-footer">
                            <a href="/test2/Event?eventId=${row.eventId}&Interest_idInterest=${row.Interest_idInterest}">Know More >>></a>
                        </div>
                    </div>
                </div>
                
                </c:forEach>
 
                                                   <%  }%>
                        </div>
                        <!-- /.panel-body -->
                    </div>
            </div>

            <div id="All_events" class="tabcontent">
              <div class="panel panel-default">
                        <div class="panel-heading">
                         <i class="fa fa-clock-o fa-fw"></i> All Events
                        </div>
                        <!-- /.panel-heading -->
                  
                       <div class="panel-body">
                        <sql:query dataSource = "${snapshot}" var = "result">
         SELECT einfo,eventName,eventId from Event;
      </sql:query>
                        
                                                   
                      <%for(int i=0;i<1;i++){ %> 
                          <c:forEach var = "row" items = "${result.rows}">                                  
				 <div class="col-lg-4" style="width:100%">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                           <c:out value = "${row.eventName}"/>
                        </div>
                        <div class="panel-body">
                            <img alt="photo" src="/test2/photos/abhi.jpg" height=150px style="float:right; margin-right:10%;">
                            <p>  <c:out value = "${row.einfo}"/></p>
                        </div>
                        <div class="panel-footer">
                            <a href="/test2/Event?eventId=${row.eventId}" >Know More >>></a>
                        </div>
                    </div>
                </div>
                
                </c:forEach>
 
                                                   <%  }%>                 
                                                   
                                                   
                                                   
                            
						</div>
                        <!-- /.panel-body -->
                    </div>
                  
             </div>
            
			</div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    	<jsp:include page="footer.jsp"></jsp:include>
    

<script>

    function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
    
    
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();


</script>
     
</body>

</html>
