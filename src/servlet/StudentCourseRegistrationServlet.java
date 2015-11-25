package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import vo.CourseVo;
import vo.DepartmentVo;
import vo.LoginVo;
import vo.ScheduleVo;
import vo.StudentCourseRegistrationVo;
import dao.CourseDao;
import dao.DepartmentDao;
import dao.ScheduleDao;
import dao.StudentCourseRegistrationDao;



/**
 * Servlet implementation class CourseServlet
 */
@WebServlet("/StudentCourseRegistrationServlet")
public class StudentCourseRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentCourseRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter p1 = response.getWriter();
		String flag1 = request.getParameter("flag1");
		if (flag1 != null && flag1.equals("loadpage")) {

			loadPage(request, response);

			// TODO Auto-generated catch block

		}
		if (flag1 != null && flag1.equals("courseapply")) {

			edit(request, response);

			// TODO Auto-generated catch block

		}
		if (flag1 != null && flag1.equals("searchregisteredcourses")) {
			searchRegisteredcourses(request, response);
		}

		
		
		if (flag1 != null && flag1.equals("delete")) {

			delete(request, response);
			boolean b = delete(request, response);
			if (b == true) {
				@SuppressWarnings("rawtypes")
				List ls = new ArrayList();
				StudentCourseRegistrationVo v = new StudentCourseRegistrationVo();
				StudentCourseRegistrationDao c = new StudentCourseRegistrationDao();
				ls = c.searchRegisteredcourses(v);
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("search", ls);
				httpSession.setAttribute("b", "true");
				response.sendRedirect("Student_Registered_Courses.jsp");
			} else {
				List ls = new ArrayList();
				StudentCourseRegistrationVo v = new StudentCourseRegistrationVo();
				StudentCourseRegistrationDao c = new StudentCourseRegistrationDao();
				ls = c.searchRegisteredcourses(v);
				HttpSession httpSession1 = request.getSession();
				httpSession1.setAttribute("search", ls);
				httpSession1.setAttribute("b", "false");
				response.sendRedirect("Student_Registered_Courses.jsp");

			}
			
			
		}
	}

    private void searchRegisteredcourses(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
    	HttpSession h = request.getSession();
		int login = (Integer) h.getAttribute("userId");
		LoginVo v1 = new LoginVo();
		v1.setId(login);
		StudentCourseRegistrationVo v = new StudentCourseRegistrationVo();
		v.setS2(v1);
		StudentCourseRegistrationDao d = new StudentCourseRegistrationDao();
		List l = d.searchRegisteredcourses(v);
		h.setAttribute("search", l);
		response.sendRedirect("Student_Registered_Courses.jsp");
		
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		int id = Integer.parseInt(request.getParameter("id"));
		PrintWriter p = response.getWriter();
		p.println(id);

		ScheduleVo v1 = new ScheduleVo();
		v1.setId(id);
		ScheduleDao d1 = new ScheduleDao();
		@SuppressWarnings("rawtypes")
		List l1 = d1.edit(v1);
		@SuppressWarnings("rawtypes")
		List l2 = d1.search();
		session.setAttribute("search", l2);
		session.setAttribute("edit", l1);
		response.sendRedirect("Student_Course_Registration2.jsp");

	}
	private boolean delete(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		StudentCourseRegistrationVo cv = new StudentCourseRegistrationVo();
		int id = Integer.parseInt(request.getParameter("id"));
		cv.setId(id);

		StudentCourseRegistrationDao cd = new StudentCourseRegistrationDao();
		boolean b = cd.delete(cv);
		
		if (b == false) {
			return false;
		} else {
			return true;
		}
	}

	protected void doFilter(HttpServletRequest request,
			HttpServletResponse response) {

	}

	
	private void search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int dept = Integer.parseInt(request.getParameter("department"));
		
		DepartmentVo st = new DepartmentVo();
		st.setId(dept);
		
		ScheduleVo v = new ScheduleVo();
		v.setS1(st);
		
		ScheduleDao d = new ScheduleDao();
		@SuppressWarnings("rawtypes")
		List l = d.searchCourses(v);
		HttpSession h = request.getSession();
		h.setAttribute("search", l);
		response.sendRedirect("Student_Course_Registration1.jsp");

	}
	private void loadPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		DepartmentDao sd = new DepartmentDao();
		@SuppressWarnings("rawtypes")
		List l = sd.loadpage();
		CourseDao sd1 = new CourseDao();
		@SuppressWarnings("rawtypes")
		List l1 = sd1.loadpage();
		HttpSession hs = request.getSession();
		hs.setAttribute("loadpage", l);
		hs.setAttribute("loadpage1", l1);
		response.sendRedirect("Student_Course_Registration.jsp");

	}


	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter p1 = response.getWriter();
		String flag1 = request.getParameter("flag1");
		
		if (flag1 != null && flag1.equals("searchcourses")) {

			search(request, response);
		}
		if (flag1 != null && flag1.equals("insert")) {

			insert(request, response);
		}

	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter p = response.getWriter();
		HttpSession session = request.getSession();		
		int login = (Integer)session.getAttribute("userId");		
		System.out.println(request.getParameter("flag1"));
		int scheduleid = Integer.parseInt(request.getParameter("id"));
		p.println(scheduleid);
		LoginVo v1 = new LoginVo();
		v1.setId(login);		
		ScheduleVo v = new ScheduleVo();
		v.setId(scheduleid);
		StudentCourseRegistrationVo vo = new StudentCourseRegistrationVo();
		vo.setS1(v);
		vo.setS2(v1);
		StudentCourseRegistrationDao d = new StudentCourseRegistrationDao();
		d.insert(vo);
		String temp = "abc";
		session.setAttribute("abc", temp);
		response.sendRedirect("Student_Course_Registration.jsp");
	}
	

	

}
