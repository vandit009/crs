package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import vo.LoginVo;
import vo.StudentRegistrationVo;

import dao.LoginDao;
import dao.StudentRegistrationDao;

/**
 * Servlet implementation class StudentRegistrationServlet
 */
@WebServlet("/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentRegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag1 = request.getParameter("flag1");
		if (flag1 != null && flag1.equals("search")) {

			search(request, response);

		}
		if (flag1 != null && flag1.equals("edit")) {

			edit(request, response);

		}
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		PrintWriter p = response.getWriter();
		p.println(id);
		StudentRegistrationVo v1 = new StudentRegistrationVo();
		v1.setId(id);
		StudentRegistrationDao d1 = new StudentRegistrationDao();
		List l1 = d1.edit(v1);
		session.setAttribute("edit", l1);
		response.sendRedirect("Student_Registration_Update.jsp");

	}

	private void search(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession h = request.getSession();
		int login = (Integer) h.getAttribute("userId");
		LoginVo v1 = new LoginVo();
		v1.setId(login);
		StudentRegistrationVo v = new StudentRegistrationVo();
		v.setS2(v1);
		StudentRegistrationDao d = new StudentRegistrationDao();
		List l = d.search(v);
		h.setAttribute("search", l);
		response.sendRedirect("Search_StudentRegistration.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag1 = request.getParameter("flag1");
		if (flag1 != null && flag1.equals("insert")) {
			insert(request, response);

		}
		if (flag1 != null && flag1.equals("update")) {

			update(request, response);

		}

	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String flag2 = request.getParameter("userType");
		int id = Integer.parseInt(request.getParameter("loginid"));

		String s1 = request.getParameter("studentnumber");
		String s2 = request.getParameter("program");
		String s3 = request.getParameter("fn");
		String s4 = request.getParameter("ln");

		String s5 = request.getParameter("email");

		String s6 = request.getParameter("username");
		String s7 = request.getParameter("pass");
		String s8 = request.getParameter("conpass");
		LoginVo loginvo = new LoginVo();
		loginvo.setId(id);
		loginvo.setUsername(s6);
		loginvo.setPassword(s7);

		loginvo.setUsertype(flag2);

		LoginDao loginDao = new LoginDao();
		List list = loginDao.searchCustom(loginvo);

		StudentRegistrationVo registrationVo = (StudentRegistrationVo) list
				.get(0);
		int regId = registrationVo.getId();

		System.out.println("Registration Id = " + regId);

		StudentRegistrationVo v = new StudentRegistrationVo();
		v.setId(regId);
		v.setS2(loginvo);
		v.setStudentnumber(s1);
		v.setProgram(s2);
		v.setFn(s3);
		v.setLn(s4);
		v.setEmail(s5);

		v.setPass(s7);
		v.setConpass(s8);
		v.setUsername(s6);

		StudentRegistrationDao d = new StudentRegistrationDao();
		d.update(v);
		List l = d.search(v);
		

		LoginDao l1 = new LoginDao();

		l1.update(loginvo);

		String temp = "abc";
		session.setAttribute("abc", temp);
		
		session.setAttribute("search", l);
		response.sendRedirect("Student_Home.jsp");

	}

	private void insert(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, NumberFormatException {
		// TODO Auto-generated method stub
		
		String flag2 = request.getParameter("userType");
		String s = request.getParameter("studentnumber");
		String s7 = request.getParameter("program");
		String s1 = request.getParameter("fn");
		String s2 = request.getParameter("ln");
		String s3 = request.getParameter("email");
		String s4 = request.getParameter("username");
		String s5 = request.getParameter("password");
		String s6 = request.getParameter("conpassword");

		LoginVo log = new LoginVo();
		log.setUsertype(flag2);
		log.setUsername(s4);
		log.setPassword(s5);
		LoginDao l = new LoginDao();
		l.insert(log);
		StudentRegistrationVo v = new StudentRegistrationVo();
		v.setS2(log);
		v.setStudentnumber(s);
		v.setProgram(s7);
		v.setFn(s1);
		v.setLn(s2);
		v.setEmail(s3);
		v.setUsername(s4);
		v.setPass(s5);
		v.setConpass(s6);
		StudentRegistrationDao d = new StudentRegistrationDao();
		d.insert(v);
		response.sendRedirect("Student_Registration.jsp");

	}

}
