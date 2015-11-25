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
import vo.ScheduleVo;

import dao.CourseDao;
import dao.DepartmentDao;
import dao.ScheduleDao;


/**
 * Servlet implementation class CourseServlet
 */
@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleServlet() {
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
		
		if (flag1 != null && flag1.equals("search")) {
			search(request, response);
		}
		if (flag1 != null && flag1.equals("edit")) {
			edit(request, response);
		}
		if (flag1 != null && flag1.equals("delete")) {

			delete(request, response);
			boolean b = delete(request, response);
			if (b == true) {
				@SuppressWarnings("rawtypes")
				List ls = new ArrayList();
				ScheduleDao c = new ScheduleDao();
				ls = c.search();
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("search", ls);
				httpSession.setAttribute("b", "true");
				response.sendRedirect("Search_Schedule.jsp");
			} else {
				List ls = new ArrayList();
				ScheduleDao c = new ScheduleDao();
				ls = c.search();
				HttpSession httpSession1 = request.getSession();
				httpSession1.setAttribute("search", ls);
				httpSession1.setAttribute("b", "false");
				response.sendRedirect("Search_Schedule.jsp");

			}
		}
	}

	private boolean delete(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		ScheduleVo cv = new ScheduleVo();
		int id = Integer.parseInt(request.getParameter("id"));
		cv.setId(id);

		ScheduleDao cd = new ScheduleDao();
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

	private void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Method-1 ");
		HttpSession h = request.getSession();
		DepartmentDao departmentdao=new DepartmentDao();
		List l=departmentdao.search();
		CourseDao coursedao=new CourseDao();
		List l1=coursedao.search();		
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("Method-2 ");
		ScheduleVo v1 = new ScheduleVo();
		v1.setId(id);
		ScheduleDao d = new ScheduleDao();
		List l2 = d.edit(v1);
		h.setAttribute("loaddepartment", l);
		h.setAttribute("loadcourse", l1);
		h.setAttribute("edit", l2);
		response.sendRedirect("Update_Schedule.jsp");

	}

	private void search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ScheduleDao d = new ScheduleDao();
		@SuppressWarnings("rawtypes")
		List l = d.search();
		HttpSession h = request.getSession();
		h.setAttribute("search", l);
		response.sendRedirect("Search_Schedule.jsp");

	}
	private void loadPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		DepartmentDao sd = new DepartmentDao();
		List l = sd.loadpage();
		CourseDao sd1 = new CourseDao();
		List l1 = sd1.loadpage();
		HttpSession hs = request.getSession();
		hs.setAttribute("loadpage", l);
		hs.setAttribute("loadpage1", l1);
		response.sendRedirect("Add_Schedule.jsp");

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
		if (flag1 != null && flag1.equals("update")) {

			update(request, response);
		}
		if (flag1 != null && flag1.equals("insert")) {

			insert(request, response);
		}

	}

	private void insert(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int dept = Integer.parseInt(request.getParameter("department"));
		int c = Integer.parseInt(request.getParameter("course"));
		String s1 = request.getParameter("day");
		String s2 = request.getParameter("st");
		String s3 = request.getParameter("et");
		String s4 = request.getParameter("startdate");
		String s5 = request.getParameter("enddate");
		DepartmentVo st = new DepartmentVo();
		st.setId(dept);
		CourseVo st1=new CourseVo();
		st1.setId(c);
		
		ScheduleVo v = new ScheduleVo();
		v.setS1(st);
		v.setS2(st1);
		v.setDay(s1);
		v.setSt(s2);
		v.setEt(s3);
		v.setStartdate(s4);
		v.setEnddate(s5);
		ScheduleDao d = new ScheduleDao();
		d.insert(v);
		String temp = "abc";
		session.setAttribute("abc", temp);
		response.sendRedirect("Add_Schedule.jsp");

	}

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		int s = Integer.parseInt(request.getParameter("department"));
		int s1 = Integer.parseInt(request.getParameter("course"));
		String s2 = request.getParameter("day");
		String s3 = request.getParameter("st");
		String s4 = request.getParameter("et");
		String s5 = request.getParameter("startdate");
		String s6 = request.getParameter("enddate");
		
		DepartmentVo st=new DepartmentVo();
		st.setId(s);
		CourseVo st1 = new CourseVo();
		st1.setId(s1);
		ScheduleVo c1 = new ScheduleVo();
		c1.setS1(st);
		c1.setS2(st1);
		c1.setId(id);
		c1.setDay(s2);
		c1.setSt(s3);
		c1.setEt(s4);	
		c1.setStartdate(s5);
		c1.setEnddate(s6);
		ScheduleDao d1 = new ScheduleDao();
		d1.update(c1);
		@SuppressWarnings("rawtypes")
		List l=d1.search();
		session.setAttribute("search", l);
		String temp = "abc";
		session.setAttribute("abc", temp);
		response.sendRedirect("Search_Schedule.jsp");

	}

}
