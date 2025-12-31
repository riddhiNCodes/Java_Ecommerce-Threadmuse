package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.AdminProductDao;
import cn.Threadmuse.Dao.ProductDao;

@WebServlet("/removeProdServlet")
public class removeProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	HttpSession session = request.getSession();
	
		 String admin = (String)session.getAttribute("admin");
		    if(admin == null){
		        response.sendRedirect("login.jsp");
		    }
		   
		    int productId = Integer.parseInt(request.getParameter("id"));

	        AdminProductDao pd = new AdminProductDao(DBConn.getConnection());
	        boolean success = pd.removeProduct(productId);

	        if (success) {
	            session.setAttribute("msg", "Product removed successfully!");
	        } else {
	            session.setAttribute("msg", "Something went wrong while deleting product!");
	        }

	        response.sendRedirect("admin_page.jsp");
	    }
	
	
		
	
	
	}


