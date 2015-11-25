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

import vo.DepartmentVo;
import dao.DepartmentDao;

/**
 * Servlet implementation class DepartmentServlet
 */
@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter p1=response.getWriter();
		String flag1=request.getParameter("flag1");
		if(flag1!=null && flag1.equals("loaddepartment"))
		{
			
				load(request,response);
			
		}
		if(flag1!=null && flag1.equals("search"))
		{
			search(request,response);
		}
		if(flag1!=null && flag1.equals("edit"))
		{
			edit(request,response);
		}
		if(flag1!=null && flag1.equals("delete"))
		{
			delete(request,response);
			boolean b=delete(request,response);	
			if(b==true)
			{
				@SuppressWarnings("rawtypes")
				List ls= new ArrayList();
	   			DepartmentDao c= new DepartmentDao();
	   			ls = c.search();
	   			HttpSession httpSession = request.getSession();
	   			httpSession.setAttribute("search", ls);
	   			httpSession.setAttribute("b","true");
	   			response.sendRedirect("Search_Department.jsp");
			}
			else
			{
				@SuppressWarnings("rawtypes")
				List ls= new ArrayList();
	   			DepartmentDao c = new DepartmentDao();
	   			ls = c.search();
	   			HttpSession httpSession1 = request.getSession();
	   			httpSession1.setAttribute("search", ls);
	   			httpSession1.setAttribute("b","false");
	   			response.sendRedirect("Search_Department.jsp");
			}
		}
	}

private boolean delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		DepartmentVo cv=new DepartmentVo();
		int id=Integer.parseInt(request.getParameter("id"));
		cv.setId(id);
		
		 DepartmentDao cd=new DepartmentDao();
		 boolean b=cd.delete(cv);
			 if(b==false)
				 {
					return false;
				 }
				 else
				 {
					 return true;
				 }
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		HttpSession h=request.getSession();
		int id=Integer.parseInt(request.getParameter("id"));
		DepartmentVo v1=new DepartmentVo();
		v1.setId(id);
		DepartmentDao d=new DepartmentDao();
		@SuppressWarnings("rawtypes")
		List l=d.edit(v1);
		h.setAttribute("edit", l);
		response.sendRedirect("Update_Department.jsp");
		
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		DepartmentDao d=new DepartmentDao();
		@SuppressWarnings("rawtypes")
		java.util.List l=d.search();
		HttpSession h=request.getSession();
		h.setAttribute("search", l);
		response.sendRedirect("Search_Department.jsp");
		
	}

	private void load(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		DepartmentDao dt=new DepartmentDao();
		List l1=dt.search();
		session.setAttribute("department", l1);
		response.sendRedirect("Add_Course.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag1=request.getParameter("flag1");
		if(flag1!=null && flag1.equals("department"))
		{
			insert(request,response);
		}
		if(flag1!=null && flag1.equals("update"))
		{
			update(request,response);
		}
		
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		HttpSession session=request.getSession();
		String s1=request.getParameter("department");
		String s2=request.getParameter("description");
		DepartmentVo v=new DepartmentVo();
		v.setId(id);
		v.setDepartment(s1);
		v.setDescription(s2);
		DepartmentDao d=new DepartmentDao();
		d.update(v);
		List l=d.search();
		session.setAttribute("search", l);
		String temp="abc";
		session.setAttribute("abc",temp);		
		response.sendRedirect("Search_Department.jsp");
		
	}

	void insert(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
	{
		
		
		HttpSession session=request.getSession();
		String s1=request.getParameter("department");
		String s2=request.getParameter("description");

		DepartmentVo v=new DepartmentVo();
		v.setDepartment(s1);
		v.setDescription(s2);
		DepartmentDao d=new DepartmentDao();
		d.insert(v);
		String temp="abc";
		session.setAttribute("abc", temp);
		response.sendRedirect("Add_Department.jsp");
	}

}
