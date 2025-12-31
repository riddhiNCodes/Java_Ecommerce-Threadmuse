package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doPost(request, response); // reuse the same logic
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getSession().getAttribute("admin")!=null)
		{
			request.getSession().removeAttribute("admin");
			response.sendRedirect("admin_page.jsp");
		}
		else if(request.getSession().getAttribute("key")!=null)
		{
			request.getSession().removeAttribute("key");
			response.sendRedirect("index.jsp");
		}
		else {
			response.sendRedirect("login.jsp");
		}
	}

}
