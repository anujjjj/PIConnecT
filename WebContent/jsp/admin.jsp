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
         select m.eventId,d.idInterest, m.eventName,d.interestsName from Admin s inner join Event m on s.eventId = m.eventId inner join Interest d on  d.idInterest = s.idInterest where s.id=?

                  <sql:param value = "${sessionScope.username}" />
         
      </sql:query>   
                          
                        
                          
        <div id="page-wrapper">
            <div class="row">
            
                <div class="col-lg-12">
                    <h1 class="page-header">Admin</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div> 
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
                                    <h3> <c:out value = "${row.eventName}"/></h3>
                          				 <c:out value = "${row.interestsName}"/>
									
									</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <a href="/test2/jsp/admin_event.jsp?eventId=${row.eventId}&idInterest=${row.idInterest}"><span class="pull-left">View Details</span></a>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
            
                       
            
                 
                          
 
            
                
                
            </div>
            <!-- /.row -->
                                          </c:forEach>
            
        </div>
        <!-- /#page-wrapper -->


     <div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
	
</body>

</html>
