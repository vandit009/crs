<!-- BEGIN SIDEBAR MENU -->
<ul class="sidebar-menu">
	
	<li class="has-sub"><a href="javascript:;" class=""> <span
			class="icon-box"> <i class="icon-book"></i></span>Courses<span
			class="arrow"></span>
	</a>
		<ul class="sub">
			<li><a class=""
				href="<%=request.getContextPath()%>/StudentCourseRegistrationServlet?flag1=loadpage">
					Register for Courses</a></li>
			<li><a class=""
				href="<%=request.getContextPath()%>/StudentCourseRegistrationServlet?flag1=searchregisteredcourses">
					Registered Courses</a></li>
			
		</ul></li>
		
	<li class="has-sub"><a href="<%=request.getContextPath()%>/StudentCourseRegistrationServlet?flag1=loadpage" class=""> <span
			class="icon-box"> <i class="icon-book"></i></span>My TimeTable<span
			class="arrow"></span>
	</a>
		</li>
		<li class="has-sub">
					<a href="javascript:;" class="">
					    <span class="icon-box"> <i class="icon-dashboard"></i></span> Manage Profile
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub">
						<li><a class="" href="<%=request.getContextPath()%>/StudentRegistrationServlet?flag1=search"> View Profile</a></li>				
						<li><a class="" href="<%=request.getContextPath()%>/Filter?flag=logout"> Log Out </a></li>						
					</ul>
                    
				</li>
		
</ul>
<!-- END SIDEBAR MENU -->