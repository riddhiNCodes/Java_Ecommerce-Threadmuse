package cn.Threadmuse.Servlets;


import java.io.IOException;
import java.io.PrintWriter;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.UserDao;
import cn.Threadmuse.Model.UserModel;
import jakarta.servlet.RequestDispatcher;
/*import jakarta.servlet.RequestDispatcher;*/
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("mail")	;
	    String pass = request.getParameter("pass");
	    
		try {
			
			UserDao udao = new UserDao(DBConn.getConnection());
			UserModel user = udao.userlogin(email, pass);	
			
			if(email.equals("adminpage@gmail.com") && pass.equals("0987")) {
			    HttpSession session = request.getSession();
			    session.setAttribute("admin", "true");
			    response.sendRedirect("admin_page.jsp");
			}

			else if (user != null)
			{
//				out.println("User login successfull");
				HttpSession session = request.getSession();
				session.setAttribute("key",user);
				session.setAttribute("user_id",user.getId());
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
//				response.sendRedirect("index.jsp");
			}
			else {
				
				out.println("User login failed");
			}


		}
		catch(Exception ex)
		{
			System.out.println("Error: "+ex.getMessage());
		}
	}

}
