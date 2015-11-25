<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Scheule</title>

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
<%@include file="Admin_Header.jsp"%>
<script>
	function loadCourse() {

		var dept_id = document.getElementById("department");
		var xmlhttp = new XMLHttpRequest();
		removeAllState();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {

				var jsonObj = JSON.parse(xmlhttp.responseText);

				for (i = 0; i < jsonObj.length; i++) {

					var createOption = document.createElement("option");
					createOption.value = jsonObj[i].id;
					createOption.text = jsonObj[i].value;
					document.schedule.course.options.add(createOption);
				}
			}
		}
		xmlhttp.open("get", "AjaxServlet?flag1=loadCourse&department="
				+ dept_id.value, true);
		xmlhttp.send();
	}
	function removeAllState() {
		var removeCourse = document.schedule.course.options.length;
		for (i = removeCourse; i > 0; i--) {
			document.schedule.course.remove(i);
		}
	}
	function check()

	{
		if (document.getElementById("department").value == "select") {
			
			document.getElementById("department1").style.display = "";
			document.getElementById("department").style.border = "1px solid red";
		}
            if (document.getElementById("course").value == "select") {
			
			document.getElementById("course1").style.display = "";
			document.getElementById("course").style.border = "1px solid red";
		}
		if (document.getElementById("stdt").value == null) {
			
			document.getElementById("sstdt").style.display = "";
			document.getElementById("stdt").style.border = "1px solid red";
		}

		if (document.getElementById("stdt").value == null) {
		
			document.getElementById("sstdt").style.display = "";
			document.getElementById("stdt").style.border = "1px solid red";
		}
		if (document.getElementById("eddt").value == "") {
			document.getElementById("seddt").style.display = "";
			document.getElementById("eddt").style.border = "1px solid red";
		}
		if (document.getElementById("day").value == "") {
			document.getElementById("days1").style.display = "";
			document.getElementById("day").style.border = "1px solid red";
		}
		if (document.getElementById("st").value == "") {
			document.getElementById("st1").style.display = "";
			document.getElementById("st").style.border = "1px solid red";
		}
		if (document.getElementById("et").value == "") {
			document.getElementById("et1").style.display = "";
			document.getElementById("et").style.border = "1px solid red";
		}
		
	}

function hide() {
	    if (document.getElementById("department").value != "select") {
		    document.getElementById("department1").style.display = "none";
		    document.getElementById("department").style.border = "1px solid Blue";
	        }
	     if (document.getElementById("course").value != "select") {
		     document.getElementById("course1").style.display = "none";
		     document.getElementById("course").style.border = "1px solid Blue";
	        }
	
		if (document.getElementById("stdt").value != "") {
			document.getElementById("sstdt").style.display = "none";
			document.getElementById("stdt").style.border = "1px solid Blue";
		}

		if (document.getElementById("st").value != "") {
			document.getElementById("st1").style.display = "none";
			document.getElementById("st").style.border = "1px solid Blue";
		}
		if (document.getElementById("eddt").value != "") {
			document.getElementById("seddt").style.display = "none";
			document.getElementById("eddt").style.border = "1px solid Blue";
		}
		if (document.getElementById("et").value != "") {
			document.getElementById("et1").style.display = "none";
			document.getElementById("et").style.border = "1px solid Blue";
		}
		if (document.getElementById("day").value != "") {
			document.getElementById("days1").style.display = "none";
			document.getElementById("day").style.border = "1px solid Blue";
		}
	}

</script>
</script>
</head>
<body>
	<div id="container" class="row-fluid">
		<div id="sidebar" class="nav-collapse collapse">
			<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
									<i class="icon-globe"></i>ADD SCHEDULE
								</h4>
								<span class="tools"> <a href="javascript:;"
									class="icon-chevron-down"></a> <a href="javascript:;"
									class="icon-remove"></a>
								</span>
							</div>
							<div class="widget-body">
								<!-- BEGIN FORM-->
								<%
									String abc = (String) session.getAttribute("abc");
									if (abc != null) {
								%><table>
									<tr>
										<td>inserted succesfully</td>
									</tr>
								</table>
								<%
									}
									session.removeAttribute("abc");
								%>


								<form action="<%=request.getContextPath()%>/ScheduleServlet"
									method="post" name="schedule" class="form-horizontal">
									<div class="well" style="padding-bottom: 20px; margin: 0;">
										<input type="hidden" name="flag1" value="insert">

										<div class="control-group">
											<label class="control-label">Select Department:</label>
											<div class="controls">
												<select id="department" onchange="loadCourse();"
													name="department">
													<option value='select'>Select Any One</option>
													<c:forEach var="i" items="${sessionScope.loadpage}">
														<option value="${i.id}">${i.department}</option>
													</c:forEach>
												</select>
												<span
													class="help-inline" id="department1" style="display: none">Select
													Department</span>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Select Course:</label>
											<div class="controls">
												<select id="course" name="course" onchange="clear();">
													<option value='select'>Select Any One</option>
												</select>
												<span
													class="help-inline" id="course1" style="display: none">Select
													Courses</span>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Course Start Date</label>
											<div class="controls">
												<div class="input-prepend">
													<span class="add-on"><i class="icon-calendar"></i></span> <input
														type="date" id="stdt" name="startdate" required="True"
														onclick="hide()" onchange="dateValidate(this)" /> <span id="sstdt"
														style="display: none" class="help-inline">Select
														Course Start Date</span>
												</div>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">Course End Date</label>
											<div class="controls">
												<div class="input-prepend">
													<span class="add-on"><i class="icon-calendar"></i></span> <input
														type="date" name="enddate" id="eddt" required="True"
														onclick="hide()" onchange="dateValidate(this); notgreaterthenstart(this);"/> <span id="seddt"
														style="display: none" class="help-inline">Select
														Course End Date</span>
												</div>
											</div>
										</div>


										<div class="control-group">
											<label class="control-label">Days:</label>
											<div class="controls">
												<input type="text" name="day" id="day" placeholder="days" onchange="isAlpha(this)"
													required="True" onkeyup="hide()" class="input-large" /> <span
													class="help-inline" id="days1" style="display: none">Enter
													Course Days</span>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">Start Time :</label>
											<div class="controls">
												<input type="text" name="st" id="st"
													placeholder="Start Time" required="True" onkeyup="hide()"
													class="input-large" /> <span class="help-inline" id="st1"
													style="display: none">Enter Start Time</span>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">End Time :</label>
											<div class="controls">
												<input type="text" name="et" id="et" placeholder="End Time" onchange="timevalidate()"
													required="True" onkeyup="hide()" class="input-large" /> <span
													class="help-inline" id="et1" style="display: none">Enter
													End Time</span>
											</div>
										</div>



										<div class="form-actions">
											<button type="submit" onclick="check()"
												class="btn btn-success">Submit</button>

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
		<script src="js/validation.js"></script>
	
	<script>
		jQuery(document).ready(function() {
			// initiate layout and plugins
			App.setMainPage(true);
			App.init();
		});
	</script>

</body>
</html>