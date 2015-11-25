<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>Login Page</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/style_responsive.css" rel="stylesheet" />
<link href="css/style_default.css" rel="stylesheet" id="style_color" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body id="login-body">
	<div class="login-header">
		<!-- BEGIN LOGO -->
		<div id="logo" class="center">
			<a class="brand" href="Index.jsp"> <img src="img/CRS.png"
				alt="logo" class="center" />
			</a>
		</div>
		<!-- END LOGO -->
	</div>

	<!-- BEGIN LOGIN -->
	<div id="login">
		<!-- BEGIN LOGIN FORM -->


		<form id="loginform" class="form-vertical no-padding no-margin"
			action="<%=request.getContextPath()%>/Filter" method="post">
			<input type="hidden" name="flag" value="login"> <input
				type="hidden" name="userType" value="admin">
			<div class="lock">
				<i class="icon-lock"></i>
			</div>
			<div class="control-wrap">
				<h4>User Login</h4>
				<div class="control-group">
					<div class="controls">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span><input
								id="input-username" name="username" type="text" required="true"
								placeholder="Username" />

						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-key"></i></span><input
								id="input-password" name="password" type="password"
								required="true" placeholder="Password" />
						</div>
						<div class="mtop10">
							<div class="block-hint pull-left small">
								<input type="checkbox" id=""> Remember Me
							</div>
							
						</div>

						<div class="clearfix space5"></div>
					</div>

				</div>
			</div>

			<input type="submit" id="login-btn" class="btn btn-block login-btn"
				value="Login" /> <a href="Student_Registration.jsp"><b>Sign
					Up</b></a>
		</form>
		<!-- END LOGIN FORM -->
		
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div id="login-copyright">2015 &copy; ClassRoomScheduling</div>
	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS -->
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.blockui.js"></script>
	<script src="js/scripts.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.initLogin();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
</html>