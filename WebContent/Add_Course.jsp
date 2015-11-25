<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Course</title>

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
function check()

{
	
	


	if (document.getElementById("term").value == "") {
		document.getElementById("term1").style.display = "";
		document.getElementById("term").style.border = "1px solid red";
	}
	if (document.getElementById("code").value == "") {
		document.getElementById("code1").style.display = "";
		document.getElementById("code").style.border = "1px solid red";
	}
	if (document.getElementById("course").value == "") {
		document.getElementById("course1").style.display = "";
		document.getElementById("course").style.border = "1px solid red";
	}
	if (document.getElementById("desc").value == "") {
		document.getElementById("desc1").style.display = "";
		document.getElementById("desc").style.border = "1px solid red";
	}
	

} 

	function hide() {

		if (document.getElementById("term").value != "") {
			document.getElementById("term1").style.display = "none";
			document.getElementById("term").style.border = "1px solid Blue";
		}

		if (document.getElementById("code").value != "") {
			document.getElementById("code1").style.display = "none";
			document.getElementById("code").style.border = "1px solid Blue";
		}
		if (document.getElementById("desc").value != "") {
			document.getElementById("desc1").style.display = "none";
			document.getElementById("desc").style.border = "1px solid Blue";
		}
		if (document.getElementById("course").value != "") {
			document.getElementById("course1").style.display = "none";
			document.getElementById("course").style.border = "1px solid Blue";
		}
	}
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
									<i class="icon-globe"></i>ADD COURSE
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


								<form action="<%=request.getContextPath()%>/CourseServlet"
									method="post" class="form-horizontal">
									<div class="well" style="padding-bottom: 20px; margin: 0;">
										<input type="hidden" name="flag1" value="insert">
										<div class="control-group">
											<label class="control-label">Select Department :</label>
											<div class="controls">
												<select name="department" id="department" onchange="loaddepartment()">

													<c:forEach items="${sessionScope.department}" var="j">

														<option value="${j.id}">${j.department}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Offered Term:</label>
											<div class="controls">
												<input type="text" name="term" id="term"
													placeholder="Offered Term" required="True"
													onkeyup="hide()" class="input-large" /> <span
													class="help-inline" id="term1" style="display: none">Enter
													Offered Term</span>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Course Code :</label>
											<div class="controls">
												<input type="text" name="code" id="code"
													placeholder="Course Code" required="True"  onchange="isNumeric(this)"
													onkeyup="hide()" class="input-large" /> <span
													class="help-inline" id="code1" style="display: none">Enter
													Course Code</span>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">Course Name :</label>
											<div class="controls">
												<input type="text" name="course" id="course" 
													placeholder="Course Name" required="True"
													onkeyup="hide()" class="input-large" /> <span
													class="help-inline" id="course1" style="display: none">Enter
													Course Name</span>
											</div>
										</div>
										

										<div class="control-group">
											<label class="control-label">Course Description
												:</label>
											<div class="controls">
												<textarea class="input-large" required="True" id="desc"
													onkeyup="hide()" name="description" rows="3"></textarea>
												<span class="help-inline" id="desc1" style="display: none">Enter
													Course Description</span>
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

	<script src="js/validation.js"></script>
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