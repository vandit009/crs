<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration</title>

<meta charset="utf-8" />

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/style_responsive.css" rel="stylesheet" />
<link href="css/style_default.css" rel="stylesheet" id="style_color" />

<link href="assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="assets/uniform/css/uniform.default.css" />
<link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet" />
<link href="assets/jqvmap/jqvmap/jqvmap.css" media="screen"
	rel="stylesheet" type="text/css" />

<script>
	function check() {
		var snum = document.getElementById("studentnumber");
		var program = document.getElementById("program");
		var fn = document.getElementById("fn");
		var ln = document.getElementById("ln");
		var email = document.getElementById("email");
		var uname = document.getElementById("uname");
		var pwd = document.getElementById("pwd");
		var cnfpwd = document.getElementById("cnfpwd");

		var prg = document.getElementById("prg");
		var ssnum = document.getElementById("sfn");
		var sfn = document.getElementById("sfn");
		var sln = document.getElementById("sln");
		var suname = document.getElementById("suname");
		var spwd = document.getElementById("spwd");
		var scnfpwd = document.getElementById("scnfpwd");

		if (prg.value == "") {
			prg.style.display = "";
			prg.style.border = "1px solid red";
		}

		if (snum.value == "") {
			ssnum.style.display = "";
			snum.style.border = "1px solid red";
		}
		if (fn.value == "") {
			sfn.style.display = "";
			fn.style.border = "1px solid red";
		}

		if (ln.value == "") {
			sln.style.display = "";
			ln.style.border = "1px solid red";
		}

		if (email.value == "") {
			email.style.border = "1px solid red";
		}

		if (uname.value == "") {
			suname.style.display = "";
			uname.style.border = "1px solid red";
		}

		if (pwd.value == "") {
			spwd.style.display = "";
			pwd.style.border = "1px solid red";
		}

		if (cnfpwd.value == "") {
			scnfpwd.style.display = "";
			cnfpwd.style.border = "1px solid red";
		}
	}

	function hide() {

		if (fn.value != "") {
			sfn.style.display = "none";
			fn.style.border = "1px solid blue";
		}

		if (ln.value != "") {
			sln.style.display = "none";
			ln.style.border = "1px solid blue";
		}
		if (city.value != "") {
			sln.style.display = "none";
			ln.style.border = "1px solid blue";
		}

		if (mno.value != "") {
			smno.style.display = "none";
			mno.style.border = "1px solid blue";
		}

		if (email.value != "") {

			email.style.border = "1px solid blue";
		}

		if (uname.value != "") {
			suname.style.display = "none";
			uname.style.border = "1px solid blue";
		}

		if (pwd.value != "") {
			spwd.style.display = "none";
			pwd.style.border = "1px solid blue";
		}

		if (cnfpwd.value != "") {
			scnfpwd.style.display = "none";
			cnfpwd.style.border = "1px solid blue";
		}
	}
</script>
</head>
<body>
	<!-- BEGIN HEADER -->
	<div id="header" class="navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<div class="container-fluid">
				<!-- BEGIN LOGO -->
					<a class="brand" href="Index.jsp"> <img src="img/CRS.png"
					alt="ClassRoomScheduling" />
				</a>

				<!-- END LOGO -->
			</div>
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<!-- BEGIN SIDEBAR MENU -->
	<div id="sidebar" class="nav-collapse collapse"></div>
	<!-- END SIDEBAR MENU -->


	<!-- BEGIN PAGE -->
	<div id="main-content">
		<!-- BEGIN PAGE CONTAINER-->
		<div class="container-fluid">
			<!-- BEGIN PAGE HEADER-->
			<div class="row-fluid">
				<div class="span12">

					<!-- BEGIN PAGE TITLE & BREADCRUMB-->

					<ul class="breadcrumb">


						<li class="pull-right search-wrap"></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row-fluid">
				<div class="span12">
					<div class="widget">
						<div class="widget-title">
							<h4>
								<i class="icon-globe"></i>STUDENT REGISTRATION
							</h4>

						</div>

						<div class="widget-body">

							<!-- BEGIN FORM-->
							<form
								action="<%=request.getContextPath()%>/StudentRegistrationServlet"
								method="post" class="form-horizontal">
								<div class="well" style="padding-bottom: 20px; margin: 0;">
									<input type="hidden" name="flag1" value="insert" /> <input
										type="hidden" name="userType" value="student" />

									<div class="control-group">
										<label class="control-label">Student Number:</label>
										<div class="controls">
											<input type="text" name="studentnumber" id="studentnumber"
												required="true" onkeyup="hide()"
												placeholder="Student Number" class="input-large" /> <span
												class="help-inline" id="ssnum" style="display: none">Enter
												your student number</span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Program:</label>
										<div class="controls">
											<input type="text" name="program" id="program"
												required="true" onkeyup="hide()" placeholder="Program Name"
												class="input-large" /> <span class="help-inline" id="prg"
												style="display: none">Enter your Program Name</span>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">First Name:</label>
										<div class="controls">
											<input type="text" name="fn" id="fn" required="true"
												onkeyup="hide()" placeholder="First Name"
												class="input-large" /> <span class="help-inline" id="sfn"
												style="display: none">Enter your first name</span>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">Last Name:</label>
										<div class="controls">
											<input type="text" name="ln" id="ln" required="true"
												onkeyup="hide()" placeholder="Last Name" class="input-large" />
											<span class="help-inline" id="sln" style="display: none">Enter
												your last name</span>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">Email Address:</label>
										<div class="controls">
											<div class="input-prepend">
												<span class="add-on">@</span><input class=" " type="text"
													name="email" required="true" id="email"
													placeholder="Email Address" />
											</div>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">Username:</label>
										<div class="controls">
											<input type="text" name="username" id="uname" required="true"
												onkeyup="hide()" placeholder="Username" class="input-large" />
											<span class="help-inline" id="suname" style="display: none">Enter
												your Username</span>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">Password:</label>
										<div class="controls">
											<input type="password" name="password" id="pwd" required="true"
												onkeyup="hide()" placeholder="Password" class="input-large" />
											<span class="help-inline" id="spwd" style="display: none">Enter
												your Password</span>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">Confirm Password:</label>
										<div class="controls">
											<input type="password" name="conpassword" id="cnfpwd"
												required="true" onkeyup="hide()"
												placeholder="Confirm Password" class="input-large" /> <span
												class="help-inline" id="scnfpwd" style="display: none">Renter
												your Password</span>
										</div>
									</div>

									<div class="form-actions">
										<button type="submit" onclick="check()"
											class="btn btn-success">Submit</button>
										<a href="Index.jsp" class="btn">Cancel</a>
									</div>
								</div>
							</form>
							<!-- END FORM-->

						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<%@include file="Footer.jsp"%>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS -->
	<!-- Load javascripts at bottom, this will reduce page load time -->
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="assets/jquery-slimscroll/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.blockui.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<!-- ie8 fixes -->
	<!--[if lt IE 9]>
	<script src="js/excanvas.js"></script>
	<script src="js/respond.js"></script>
	<![endif]-->
	<script src="assets/jqvmap/jqvmap/jquery.vmap.js"
		type="text/javascript"></script>
	<script src="assets/jqvmap/jqvmap/maps/jquery.vmap.russia.js"
		type="text/javascript"></script>
	<script src="assets/jqvmap/jqvmap/maps/jquery.vmap.world.js"
		type="text/javascript"></script>
	<script src="assets/jqvmap/jqvmap/maps/jquery.vmap.europe.js"
		type="text/javascript"></script>
	<script src="assets/jqvmap/jqvmap/maps/jquery.vmap.germany.js"
		type="text/javascript"></script>
	<script src="assets/jqvmap/jqvmap/maps/jquery.vmap.usa.js"
		type="text/javascript"></script>
	<script src="assets/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"
		type="text/javascript"></script>
	<script src="assets/jquery-knob/js/jquery.knob.js"></script>
	<script src="assets/flot/jquery.flot.js"></script>
	<script src="assets/flot/jquery.flot.resize.js"></script>

	<script src="assets/flot/jquery.flot.pie.js"></script>
	<script src="assets/flot/jquery.flot.stack.js"></script>
	<script src="assets/flot/jquery.flot.crosshair.js"></script>

	<script src="js/jquery.peity.min.js"></script>
	<script type="text/javascript"
		src="assets/uniform/jquery.uniform.min.js"></script>
	<script src="js/scripts.js"></script>
	<script>
		jQuery(document).ready(function() {
			// initiate layout and plugins
			App.setMainPage(true);
			App.init();
		});
	</script>


</body>
</html>