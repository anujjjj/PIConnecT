	<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html lang="en">

<head>


   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<link data-require="jqueryui@*" data-semver="1.10.0" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.0/css/smoothness/jquery-ui-1.10.0.custom.min.css" />

<script data-require="jqueryui@*" data-semver="1.10.0" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.0/jquery-ui.js"></script>

    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

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
						<h4 style="padding-left:15px;"><span toggle="#my_checkbox1" class="fa fa-plus-circle field-icon toggle-my_checkbox1"> Add Event</span></h4>
					    </label>
					    

					<input type="checkbox" id="my_checkbox1" style="display:none">
					<div id="hidden">
						<div  class="tabcontent" style="overflow-y:scroll;">


                          <div class="panel-body">
                             <form role="form" action="/test2/Addevent" method="post">
			                            	 <table width="100%" class="table table-striped table-bordered table-hover" id="vol_table">
			                                <tbody>
	                                       <tr>
	                                       <td >Event Name</td>
			                                    <td><input type="text" name="ename" value=""> </td>
			                                 </tr>
		                               
		                                     <tr>
	                                       <td >Start Date</td>
			                                    <td><input type="text" name="sdate" value=""> </td>
			                                 </tr> <tr>
	                                       <td >End Date</td>
			                                   <td> <input  type="text" name="edate" autofocus required></td>  
												
			                                 </tr>
			                                 
		                                    
		                                    <tr>
	                                       			<td>Interests</td>
			                                        <td>
			                                        	<input type="checkbox" name="checkbox" value="1" style="margin-left: 2%;">Dance
			                                        	<input type="checkbox" name="checkbox" value="2" style="margin-left: 2%;">Drama
			                                        	<input type="checkbox" name="checkbox" value="3" style="margin-left: 2%;">Music
			                                        	<input type="checkbox" name="checkbox" value="7" style="margin-left: 2%;">Sports
			                                        	<input type="checkbox" name="checkbox" value="4" style="margin-left: 2%;">Painting
			                                        	<input type="checkbox" name="checkbox" value="5" style="margin-left: 2%;">Photography
			                                        	<input type="checkbox" name="checkbox" value="6" style="margin-left: 2%;">Set & decoration
			                                        </td>
			                                 </tr>
		                                    
		                                    <tr>
	                                       <td >Event Information</td>
			                                   <td><textarea rows="4" cols="50" name="einfo"></textarea></td>
			                                 </tr>
		                                    
			                                 
			                                 
			                                
		                                    
			                                                  
		                                    
	                                 </tbody>
			                            </table>
			                            
			                            
			                            
			                            <center><input type="submit" value="Add Event"></center>
			   
			                            </form>
                            	
                            
                          </div>
                        </div>
					</div>
					<%String error=(String)session.getAttribute("error"); %>
							 	<%
							 		if(error!=null) {
							 			
							 	%>
							 	
							 	<center><p><%=error %></p></center>
							 	<%	
							 	System.out.println(error);
							 	session.removeAttribute("error");
							 		}
							 	%>
            </div>
            
            
            
           <!--  <div class="row">
                        <label for="my_checkbox2">
						<h4 style="padding-left:15px;"><span toggle="#my_checkbox2" class="fa fa-plus-circle field-icon toggle-my_checkbox2"> Delete Event</span></h4>
					    </label>
					    

					<input type="checkbox" id="my_checkbox2" style="display:none">
					<div id="hidden">
						<div  class="tabcontent" style="overflow-y:scroll;">


                          <div class="panel-body">
                             <form role="form" action="EditEvent" method="post">
			                            	 <table width="100%" class="table table-striped table-bordered table-hover" id="vol_table">
			                                <tbody>
	                                       
		                                    <tr>
		                                     <td>Event id</td>
	                                        <td><input type="text"  value=""></td>
		                                    </tr>
		                                    
		                                    
			                                                  
		                                    
	                                 </tbody>
			                            </table>
			                            <center><input type="submit" value="Delete Event"></center>
			   
			                            </form>
                            
                            
                          </div>
                        </div>
					</div>
            </div>
             -->
   </div>
             
 <div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
	


<script type="text/javascript">
        $(".toggle-my_checkbox1").click(function(){$(this).toggleClass("fa-plus-circle fa-minus-circle");});
        $(".toggle-my_checkbox2").click(function(){$(this).toggleClass("fa-plus-circle fa-minus-circle");});
     
    </script>


</body>
</html> 


