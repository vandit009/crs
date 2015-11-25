<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile</title>

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
<%@include file="Student_Header.jsp"%>
</head>
<body>
	<div id="container" class="row-fluid">
		<div id="sidebar" class="nav-collapse collapse">
			<%@include file="Student_Menu.jsp"%>
		</div>

		<!-- BEGIN PAGE -->

		<div id="main-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">

				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12">
						<div class="widget">
							<div class="widget-title">
								<h4>
									<i class="icon-globe"></i>Update Profile
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">
								<div class="innerLR">
									<div class="widget widget-gray widget-body-white">
										<div class="widget-head"></div>
										<div class="widget-body" style="padding: 10px 0; width: auto;">


											<form
												action="<%=request.getContextPath()%>/StudentRegistrationServlet"
												method="post" class="form-horizontal">
												<div class="well" style="padding-bottom: 20px; margin: 0;">
												<input type="hidden" name="flag1" value="update">
												<input type="hidden" name="userType" value="student">
												<c:forEach items="${sessionScope.edit}" var="j">
													<input type="hidden" name="id" value="${j.id}">
													<input type="hidden" name="loginid" value="${j.s2.id}">
													<div class="control-group">
														<label class="control-label">Student Number:</label>
														<div class="controls">
															<input type="text" name="studentnumber" value="${j.studentnumber}"
																placeholder="Student Number" class="input-large" /> <span
																class="help-inline">Enter Your Student Number</span>
														</div>
													</div>
													

													<div class="control-group">
														<label class="control-label">Program:</label>
														<div class="controls">
															<input type="text" name="program" value="${j.program}"
																placeholder="Program Name" class="input-large" /> <span
																class="help-inline">Enter Program Name</span>
														</div>
													</div>

													<div class="control-group">
														<label class="control-label">First Name</label>
														<div class="controls">
															<input type="text" class="input-xxlarge" name="fn" value="${j.fn}"
																placeholder="First Name" ><span
																class="help-inline">Enter First Name</span>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Last Name</label>
														<div class="controls">
															<input type="text" class="input-xxlarge" name="ln" value="${j.ln}"
																placeholder="Last Name" ><span
																class="help-inline">Enter Last Name</span>
														</div>
													</div>

													

													<div class="control-group">
														<label class="control-label">Email Address :</label>
														<div class="controls">
															<div class="input-prepend">
																<span class="add-on">@</span><input value="${j.email}"
																	type="text" name="email" placeholder="Email Address" />
																	<span
																class="help-inline">Enter Email Address</span>
															</div>
														</div>
													</div>

													
													<div class="control-group">
														<label class="control-label">User Name :</label>
														<div class="controls">
															<input type="text" name="username" value="${j.s2.username}"
																placeholder="User Name" class="input-large" /> <span
																class="help-inline">Enter Your User Name</span>
														</div>
													</div>

													<div class="control-group">
														<label class="control-label">Password :</label>
														<div class="controls">
															<input type="password" value="${j.pass}" name="pass" id="pass"
																placeholder="Password" class="input-large" /> <span
																class="help-inline">Enter your Password</span>
														</div>
													</div>

													<div class="control-group">
														<label class="control-label">Confirm Password :</label>
														<div class="controls">
															<input type="password" value="${j.conpass}" onblur="fn();" name="conpass"
																id="conpass" placeholder="Confirm Password"
																class="input-large" /> <span class="help-inline">Confirm
																Password</span>
														</div>
													</div>

													<div class="form-actions">
														<button type="submit" class="btn btn-success">Submit</button>
											
													</div>
													</c:forEach>
													</div>
											</form>

										</div>
									</div>
								</div>
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
	</div>
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