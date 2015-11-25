<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Schedule</title>


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
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-daterangepicker/daterangepicker.css" />
<%@include file="Admin_Header.jsp"%>
<script>
function check()

{
	
	if (document.getElementById("startdate").value == null) {
		
		document.getElementById("span1").style.display = "";
		document.getElementById("startdate").style.border = "1px solid red";
	}

	
	if (document.getElementById("enddate").value == "") {
		document.getElementById("span2").style.display = "";
		document.getElementById("enddate").style.border = "1px solid red";
	}
	if (document.getElementById("Days").value == "") {
		document.getElementById("days1").style.display = "";
		document.getElementById("Days").style.border = "1px solid red";
	}
	if (document.getElementById("st").value == "") {
		document.getElementById("st1").style.display = "";
		document.getElementById("st").style.border = "1px solid red";
	}
	if (document.getElementById("et").value == "") {
		document.getElementById("et1").style.display = "";
		document.getElementById("et").style.border = "1px solid red";
	}
	timevalidate();
	
}

function hide() {
   

	if (document.getElementById("startdate").value != "") {
		document.getElementById("span1").style.display = "none";
		document.getElementById("startdate").style.border = "1px solid Blue";
	}

	if (document.getElementById("st").value != "") {
		document.getElementById("st1").style.display = "none";
		document.getElementById("st").style.border = "1px solid Blue";
	}
	if (document.getElementById("enddate").value != "") {
		document.getElementById("span2").style.display = "none";
		document.getElementById("enddate").style.border = "1px solid Blue";
	}
	if (document.getElementById("et").value != "") {
		document.getElementById("et1").style.display = "none";
		document.getElementById("et").style.border = "1px solid Blue";
	}
	if (document.getElementById("Days").value != "") {
		document.getElementById("days1").style.display = "none";
		document.getElementById("Days").style.border = "1px solid Blue";
	}
}
</script>


</head>
<body>
	<div id="container" class="row-fluid">
		<div id="sidebar" class="nav-collapse collapse">
			<%@include file="Admin_Menu.jsp"%>
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
									<i class="icon-globe"></i>UPDATE SCHEDULE
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>


							<div class="widget-body">
								<form name="add_cat" class="form-horizontal"
									action="<%=request.getContextPath()%>/ScheduleServlet"
									method="post">
									<input type="hidden" name="flag1" value="update" />

									<div class="well" style="padding-bottom: 20px; margin: 0;">



										<c:forEach items="${sessionScope.edit}" var="i">
											<div class="control-group">
												<label class="control-label" id="a">Department Name:</label>

												<div class="controls"
													style="width: 300px; padding-bottom: 5px;">
													<select name="department" id="department">

														<c:forEach items="${sessionScope.loaddepartment}" var="j">

															<option value="${j.id}">${j.department}</option>
														</c:forEach>
													</select><span align="center" id="department1"
														style="margin-top: 50px; color: red; font-size: 15px; border-radius: 6px 6px 6px 6px; display: none">Please
														Select Department Name</span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" id="a">Course Name :</label>

												<div class="controls"
													style="width: 300px; padding-bottom: 5px;">
													<select name="course" id="course">

														<c:forEach items="${sessionScope.loadcourse}" var="j">

															<option value="${j.id}">${j.course}</option>
														</c:forEach>
													</select><span align="center" id="course1"
														style="margin-top: 50px; color: red; font-size: 15px; border-radius: 6px 6px 6px 6px; display: none">Please
														Select Course Name</span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" id="b">Course Start
													Date</label>
												<div class="controls">
													<input type="date" required="true" id="startdate"  onchange="dateValidate(this)"
														onkeyup="clear1()" name="startdate" class="input-large"
														value="${i.startdate}" /> <span align="center" id="span1"
														style="border-radius: 8px 8px 8px 8px; color: red; font-size: 15px; display: none">Please
														Enter Course Start Date</span>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" id="b">Course End Date</label>
												<div class="controls">
													<input type="date" required="true" id="enddate" onchange="dateValidate(this); notgreaterthenstart(this);"
														onkeyup="clear1()" name="enddate" class="input-large"
														value="${i.enddate}" /> <span align="center" id="span2"
														style="border-radius: 8px 8px 8px 8px; color: red; font-size: 15px; display: none">Please
														Enter Course End Date</span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" id="a">Days</label> <input
													type="hidden" name="id" value="${i.id}" />
												<div class="controls"
													style="width: 300px; padding-bottom: 5px;">
													<input class="span12" id="Days" onkeyup="hide()" onchange="isAlpha(this)"
														required="true" name="day" type="text" value="${i.day}" />
													<span align="center" id="days1"
														style="margin-top: 50px; color: red; font-size: 15px; border-radius: 6px 6px 6px 6px; display: none">Please
														Days</span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" id="b">Start Time </label>
												<div class="controls">
													<input required="true" type="text" id="st" onkeyup="hide()"
														name="st" class="input-xxlarge" value="${i.st}"> <span
														align="center" id="st1"
														style="border-radius: 8px 8px 8px 8px; color: red; font-size: 15px; display: none">Please
														Start Time</span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" id="b">End Time </label>
												<div class="controls">
													<input required="true" type="text" id="et" onkeyup="hide()" onchange="isNumeric1(this); timevalidate(); "
														name="et" class="input-xxlarge" value="${i.et}"> <span
														align="center" id="et1"
														style="border-radius: 8px 8px 8px 8px; color: red; font-size: 15px; display: none">Please
														End Time</span>
												</div>
											</div>

										</c:forEach>
										<div align="center">
											<input type="submit" onclick="check()"
												class="btn btn-success" name="submit" value="submit" />

										</div>
									</div>
								</form>
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
		<script src="js/validation.js"></script>

	<script src="js/jquery.peity.min.js"></script>
	<script type="text/javascript"
		src="assets/uniform/jquery.uniform.min.js"></script>
	<script src="js/scripts.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script>
		jQuery(document).ready(function() {
			// initiate layout and plugins
			App.setMainPage(true);
			App.init();
		});
	</script>



</body>
</html>