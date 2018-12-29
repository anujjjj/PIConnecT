
<!DOCTYPE html>

<%@page import="javax.servlet.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html lang="en">



<body>
	
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
	
         url = "jdbc:mysql://localhost:3306/dbms"
         user = "root" password = "123" />
 
      <sql:query dataSource = "${snapshot}" var = "result4">
         SELECT * from Interest;
      </sql:query>
      
       
                         
      

       <div class="navbar-default sidebar" role="navigation" style="margin-top:12px;">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="/test2/jsp/dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        
                        
                        
                        
                        
                         <%for(int i=0;i<1;i++){ %> 
                          <c:forEach var = "row" items = "${result4.rows}">  
                        <li>
                            <a href="#"><i class="${row.logo}"></i>  <c:out value = " ${row.interestsName}"/><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            
                            <sql:query dataSource = "${snapshot}" var = "result1">
         						SELECT Event_eventId from Event_has_Interest where Interest_idInterest=${row.idInterest};
       						</sql:query>
       						
       						
                            
                            <%for(int j=0;j<1;j++){ %> 
                            <c:forEach var = "row1" items = "${result1.rows}">
                           
                           
                                <sql:query dataSource = "${snapshot}" var = "result2">
         						SELECT eventName from Event where eventId=${row1.Event_eventId};
       							</sql:query>
                                <c:forEach var = "row2" items = "${result2.rows}">
                                <li>
                                    <a href="/test2/Event?eventId=${row1.Event_eventId}&Interest_idInterest=${row.idInterest}"> <c:out value = "${row2.eventName}"/></a>
                                </li>
                                
                                
                                </c:forEach>
                                </c:forEach>
 
                                                   <%  }%>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        
                        </c:forEach>
 
                                                   <%  }%>
                        <br/>
                        <center>
                        <li>
                           <a href="/test2/jsp/admin.jsp"><button class="admin_button"  ><i class="fa fa-dashboard fa-fw"></i> Admin</button>
                            </a>                      
                        </li>
                        <br/>
                        <li>
                           <a href="/test2/jsp/super_admin.jsp"><button class="admin_button"  ><i class="fa fa-dashboard fa-fw"></i> Super Admin</button>
                            </a>                      
                        </li>
                        </center>
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
     


  
   


     
</body>

</html>