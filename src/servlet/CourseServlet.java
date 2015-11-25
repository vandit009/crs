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
import dao.CourseDao;
import dao.DepartmentDao;

/**
 * Servlet implementation class CourseServlet
 */
@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseServlet() {
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
		if (flag1 != null && flag1.equals("loaddepartment")) {

			load(request, response);

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
				CourseDao c = new CourseDao();
				ls = c.search();
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("search", ls);
				httpSession.setAttribute("b", "true");
				response.sendRedirect("Search_Course.jsp");
			} else {
				List ls = new ArrayList();
				CourseDao c = new CourseDao();
				ls = c.search();
				HttpSession httpSession1 = request.getSession();
				httpSession1.setAttribute("search", ls);
				httpSession1.setAttribute("b", "false");
				response.sendRedirect("Search_Course.jsp");

			}
		}
	}

	private boolean delete(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		CourseVo cv = new CourseVo();
		int id = Integer.parseInt(request.getParameter("id"));
		cv.setId(id);

		CourseDao cd = new CourseDao();
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
		int id = Integer.parseInt(request.getParameter("id"));
		CourseVo v1 = new CourseVo();
		v1.setId(id);
		CourseDao d = new CourseDao();
		@SuppressWarnings("rawtypes")
		List l = d.edit(v1);
		DepartmentDao departmentdao=new DepartmentDao();
		@SuppressWarnings("rawtypes")
		List l1=departmentdao.search();
		
		HttpSession h = request.getSession();
		h.setAttribute("edit", l);
		h.setAttribute("loaddepartment", l1);
		response.sendRedirect("Update_Course.jsp");

	}

	private void search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		CourseDao d = new CourseDao();
		@SuppressWarnings("rawtypes")
		List l = d.search();
		HttpSession h = request.getSession();
		h.setAttribute("search", l);
		response.sendRedirect("Search_Course.jsp");

	}

	private void load(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		DepartmentDao dt = new DepartmentDao();
		@SuppressWarnings("rawtypes")
		java.util.List l1 = dt.search();
		session.setAttribute("department", l1);
		response.sendRedirect("Add_Course.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request,
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
		int cat = Integer.parseInt(request.getParameter("department"));
		String s2 = request.getParameter("term");
		String s3 = request.getParameter("code");
		String s4 = request.getParameter("course");
		String s5 = request.getParameter("description");
		DepartmentVo st = new DepartmentVo();
		st.setId(cat);
		CourseVo v = new CourseVo();
		v.setS1(st);
		v.setTerm(s2);
		v.setCode(s3);
		v.setCourse(s4);
		v.setDescription(s5);
		CourseDao d = new CourseDao();
		d.insert(v);
		String temp = "abc";
		session.setAttribute("abc", temp);
		response.sendRedirect("Add_Course.jsp");

	}

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		int s = Integer.parseInt(request.getParameter("department"));
		String s1 = request.getParameter("term");
		String s2 = request.getParameter("code");
		String s3 = request.getParameter("course");
		String s4 = request.getParameter("description");
		DepartmentVo st = new DepartmentVo();
		st.setId(s);
		CourseVo c1 = new CourseVo();
		c1.setS1(st);
		c1.setId(id);
		c1.setTerm(s1);
		c1.setCode(s2);
		c1.setCourse(s3);
		c1.setDescription(s4);
		CourseDao d1 = new CourseDao();
		d1.update(c1);
		@SuppressWarnings("rawtypes")
		List l=d1.search();
		session.setAttribute("search", l);
		String temp = "abc";
		session.setAttribute("abc", temp);
		response.sendRedirect("Search_Course.jsp");

	}

}
