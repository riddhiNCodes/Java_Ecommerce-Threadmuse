package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.UserDao;
import cn.Threadmuse.Dao.adminUpdateorder;

@WebServlet("/deleteUser")
public class deleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        try {
            int userid = Integer.parseInt(request.getParameter("userid"));

            UserDao dao = new UserDao(DBConn.getConnection());
            boolean deleted = dao.removeUser(userid);

            if (deleted) {
                // Optional success message
                request.getSession().setAttribute("msg", "User deleted successfully!");
            } else {
                request.getSession().setAttribute("msg", "Failed to delete user!");
            }

            response.sendRedirect("admin_viewUsers.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_viewUsers.jsp");
   		
	}

   	}
}
	


