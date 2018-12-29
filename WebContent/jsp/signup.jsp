<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>PIConnecT</title>
    <style>
       body
       { 
         background-image:url('../photos/login_bg.jpg');
       }
       td
       {
        width: 5%;
        align-items: center;
       }
       tr
       {
        text-align: center;
       }
        
        
        
        .field-icon {
            float: right;
            margin-right: 2%;
            margin-left: -25px;
            margin-top: -25px;
            position: relative;
            z-index: 2;
        }

    </style>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="../dist/css/datepicker_min.css" rel="stylesheet">
    <link href="../dist/css/datepicker.css" rel="stylesheet">
    <script src="../dist/js/googleapi.js"></script>
    <script src="../dist/js/datebootstrap.js"></script>  
	<script src="../dist/js/datepicker.js"></script>
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

   <center><label class="title" style="margin-top: 0px;">PIConnecT</label></center>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default" style="margin-top: 0px;">
                    <div class="panel-heading">
                        <h3 class="panel-title">SIGNUP</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="SignUp" method="post">
                            <fieldset>
                                <legend style="font-size: 17px;">Personal Details</legend>
                                <div class="form-group">
                                    <input class="form-control" placeholder="First Name" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Last Name" name="lname" type="text" value="">
                                </div>
                                <div class="form-group">
								
									<input class="date-own form-control" type="text" placeholder="Date Of Birth" name="dob" autofocus required>  
									<script>
										$('.date-own').datepicker({
											minViewMode: 3,
											format: 'yyyy-mm-dd'
										});
									</script>
                                </div>
                                 <div class="form-group">  
									<input class="date-own form-control" type="text" placeholder="Admission Year" name="adyear" autofocus required>  
									<script>
										$('.date-own').datepicker({
											minViewMode: 2,
											format: 'yyyy'
										});
									</script>
							
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Enrollment-no" name="eno" type="text" autofocus>
                                </div>
                                <div class="form-group">
								   <label> Branch:</label>
									<input name="branch" type="radio" value="CS" style="margin-left:5%;margin-right:2%">CS
									<input name="branch" type="radio" value="IT" style="margin-left:5%;margin-right:2%">IT
									<input name="branch" type="radio" value="ENTC" style="margin-left:5%;margin-right:2%">ENTC
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Phone-no" name="phone" type="text" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                </div>
                                
                                <div class="form-group has-feedback">
                                    <input id="password-field" type="password" class="form-control" name="password" placeholder="Password">
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                
                                
                                <div class="form-group has-feedback">
                                    <input type="password" class="form-control" name="re-password" placeholder="Re-Type Password" id="txtConfirmPassword" onChange="isPasswordMatch();">
                                    <!--<span toggle="#password-field" class="fa fa-check toggle-password"></span>-->
                                </div>
                                <div id="divCheckPassword"></div>
                            </fieldset>

                            <fieldset>
                                <legend style="font-size: 17px; margin: 0%;">Select your Interests</legend>
                             
                            <table style="margin-top: 5%; margin-left: 4%;">
                                <tr>
                                    <td><input type="checkbox" name="checkbox" value="1"> </td><td style="text-align: left;">Dance</td>

                                    <td><input type="checkbox" name="checkbox" value="2"> </td><td style="text-align: left;">Drama</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="checkbox" value="3"> </td><td style="text-align: left;">Music</td>
                                    <td><input type="checkbox" name="checkbox" value="7"> </td><td style="text-align: left;">Sports</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="checkbox" value="5"> </td><td style="text-align: left;">Photography</td>
                                    <td><input type="checkbox" name="checkbox" value="4"> </td><td style="text-align: left;">Painting</td>
                                </tr>
                            </table>
                            
                            <table style="margin-bottom: 5%;margin-left: 4.3%;">
                                <tr><td><input type="checkbox" name="checkbox" value="6"> </td><td style="width: 25%; text-align: left;">Sets & Decoration</td></tr>
                            </table>
                            



                            </fieldset>
                            <button id="submit-btn" class="btn btn-lg btn-info btn-block">SIGN UP</button>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
        
        
    </div>
    
    


    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    
    <script type="text/javascript">
        
        $(".toggle-password").click(function() {
          $(this).toggleClass("fa-eye fa-eye-slash");
          var input = $($(this).attr("toggle"));
          if (input.attr("type") == "password") {
            input.attr("type", "text");
          } else {
            input.attr("type", "password");
          }
        });
        
        
        $('#submit-btn').prop('disabled' , true);
        
            function isPasswordMatch() {
            var password = $("#password-field").val();
            var confirmPassword = $("#txtConfirmPassword").val();

            if (password != confirmPassword) {
                $("#divCheckPassword").html("Passwords do not match!");
                $('#submit-btn').prop('disabled' , true);
            }else{
                $("#divCheckPassword").html("Passwords match.");
                $('#submit-btn').prop('disabled' , false);
            }
        }

        $(document).ready(function () {
            $("#txtConfirmPassword").keyup(isPasswordMatch);
        });
        
        
        
//         $('#hulk').prop('disabled' , true);
//        $('#txtConfirmPassword').on('keyup', function () {
//            var password = $("#txtNewPassword").val();
//            var confirmPassword = $("#txtConfirmPassword").val();
//
//            if (password != confirmPassword) {
//                $("#divCheckPassword").html("Passwords do not match!");
//            } else {
//                $("#divCheckPassword").html("Passwords match.");
//                $('#hulk').prop('disabled' , false);
//            }
//        });
        
    </script>

</body>

</html>
