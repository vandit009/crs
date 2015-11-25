<!-- BEGIN SIDEBAR MENU -->
<ul class="sidebar-menu">
	<li class="has-sub"><a href="javascript:;" class=""> <span
			class="icon-box"> <i class="icon-book"></i></span>Department<span class="arrow"></span>
	</a>
		<ul class="sub">
			<li><a class="" href="Add_Department.jsp"> Add Department </a></li>
			<li><a class=""
				href="<%=request.getContextPath()%>/DepartmentServlet?flag1=search">
					View Departments</a></li>
			
		</ul></li>
	<li class="has-sub"><a href="javascript:;" class=""> <span
			class="icon-box"> <i class="icon-book"></i></span>Courses<span
			class="arrow"></span>
	</a>
		<ul class="sub">
			<li><a class=""
				href="<%=request.getContextPath()%>/CourseServlet?flag1=loaddepartment">
					Add Courses</a></li>
			<li><a class=""
				href="<%=request.getContextPath()%>/CourseServlet?flag1=search">
					View Courses</a></li>
		</ul></li>
		
	<li class="has-sub"><a href="javascript:;" class=""> <span
			class="icon-box"> <i class="icon-book"></i></span>Schedule<span
			class="arrow"></span>
	</a>
		<ul class="sub">
			<li><a class=""
				href="<%=request.getContextPath()%>/ScheduleServlet?flag1=loadpage">
					Add Schedule</a></li>
			<li><a class=""
				href="<%=request.getContextPath()%>/ScheduleServlet?flag1=search">
					View Schedule</a></li>
		</ul></li>
	<li class="has-sub"><a class=""
		href="<%=request.getContextPath()%>/Filter?flag=logout"><span
			class="icon-box"><i class="icon-fire"></i></span> Log Out</a></li>
</ul>
<!-- END SIDEBAR MENU -->