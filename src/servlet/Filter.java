package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.LoginVo;
import dao.LoginDao;

/**
 * Servlet Filter implementation class Filter
 */
@WebFilter("/*")
public class Filter implements javax.servlet.Filter {

	/**
	 * Default constructor.
	 */
	public Filter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession();
		String flag = request.getParameter("flag");
		String uri = ((HttpServletRequest) request).getRequestURI();
		String userType = (String) session.getAttribute("userType");

		RequestDispatcher requestDispatcher;
		System.out.println(flag);
		if (uri.contains("/css") || uri.contains("/.idea")
				|| uri.contains("/css1") || uri.contains("/images")
				|| uri.contains("/js1") || uri.contains("/assets")
				|| uri.contains("/data1") || uri.contains("/engine1")
				|| uri.contains("/font") || uri.contains("/img")
				|| uri.contains("/js") || uri.contains("/fonts")
				|| uri.contains("/JSON")
				|| uri.contains("/StudentRegistrationServlet")				
				|| uri.contains("Login.jsp") 
				|| uri.contains("Admin_Header.jsp")
				|| uri.contains("Student_Header.jsp")
				|| uri.contains("Footer.jsp")
				|| uri.contains("Student_Registration.jsp")) {
			chain.doFilter(request, response);
		}

		else if (flag != null && flag.equals("logout")) {
			session.invalidate();
			requestDispatcher = request.getRequestDispatcher("Index.jsp");
			requestDispatcher.forward(request, response);
		}

		else if (flag != null && flag.equals("login")) {

			String username = request.getParameter("username");
			String password = request.getParameter("password");

			LoginVo loginvo = new LoginVo();
			loginvo.setUsername(username);
			loginvo.setPassword(password);

			LoginDao logindao = new LoginDao();
		
			List list = logindao.search(loginvo);

			if (list != null && list.size() >= 1) {
			
				Iterator iterator = list.iterator();
				LoginVo loginVO2 = (LoginVo) iterator.next();

				String userTypeVO = loginVO2.getUsertype();
				int loginId = loginVO2.getId();

				session.setAttribute("userType",userTypeVO);
				session.setAttribute("userId",loginId);

				if (userTypeVO != null && userTypeVO.equals("admin")) {
					requestDispatcher = request
							.getRequestDispatcher("Add_Department.jsp");
					requestDispatcher.forward(request, response);
				} else if (userTypeVO != null && userTypeVO.equals("student")) {
					requestDispatcher = request
							.getRequestDispatcher("Student_Home.jsp");
					requestDispatcher.forward(request, response);
				} 
			} else {

				requestDispatcher = request.getRequestDispatcher("Index.jsp");
				requestDispatcher.forward(request, response);
			}
		}

		else if (userType != null) {
			chain.doFilter(request, response);
		}

		else {
			requestDispatcher = request.getRequestDispatcher("Index.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
