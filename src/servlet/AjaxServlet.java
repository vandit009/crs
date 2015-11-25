package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
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

/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String flag1 = request.getParameter("flag1");
		if (flag1 != null && flag1.equals("loadCourse")) {
			loadCourse(request, response);
		}
		
	}

	protected void loadCourse(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter pw = response.getWriter();
		int id = Integer.parseInt(request.getParameter("department"));
		DepartmentVo v2 = new DepartmentVo();
		v2.setId(id);
		CourseVo v1 = new CourseVo();
		v1.setS1(v2);
		CourseDao dt1 = new CourseDao();
		@SuppressWarnings("rawtypes")
		List l2 = dt1.searchCourse(v1);
		session.setAttribute("course", l2);
		System.out.println("list size is" + l2.size());
		@SuppressWarnings("rawtypes")
		Iterator i = l2.iterator();

		@SuppressWarnings("unused")
		int i10 = 10;
		pw.print("[");
		while (i.hasNext()) {
			CourseVo cv = new CourseVo();
			cv = (CourseVo) i.next();

			pw.print("{\"id\":\"" + cv.getId() + "\",\"value\":\""
					+ cv.getCourse() + "\"}");
			if (i.hasNext()) {
				pw.print(",");
			}

		}

		pw.print("]");
	}

}
