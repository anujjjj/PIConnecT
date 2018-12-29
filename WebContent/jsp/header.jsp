<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PIConnecT</title>

   <!-- jQuery -->
    <script src="/test2/vendor/jquery/jquery.min.js" ></script>

    <!-- Bootstrap Core JavaScript -->
    
    <script src="/test2/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/test2/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/test2/vendor/raphael/raphael.min.js"></script>
    <script src="/test2/vendor/morrisjs/morris.min.js"></script>
    <script src="/test2/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/test2/dist/js/sb-admin-2.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="/test2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/test2/vendor/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="/test2/dist/css/sb-admin-2.css" rel="stylesheet" type="text/css">

    <!-- Morris Charts CSS -->
    <link href="/test2/vendor/morrisjs/morris.css" rel="stylesheet" type="text/css">

    <!-- Custom Fonts -->
    <link href="/test2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
	
    

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/test2/jsp/dashboard.jsp">PIConnecT</a>
            </div>
            <!-- /.navbar-header -->
            <i><label style="width:80%; margin-right:0%; margin-top:1%; font-size:100%; text-align:right;">Welcome <%= firstName %></label></i>
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="/test2/Profile?id=user"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                
                        <li class="divider"></li>
                        <li><a href="/test2/jsp/logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

        </nav>

        
        <!--wrapper -->


    

    

</body>

</html>
