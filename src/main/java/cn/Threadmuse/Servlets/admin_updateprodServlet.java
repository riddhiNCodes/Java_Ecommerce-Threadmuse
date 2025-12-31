package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.OrderDao;
import cn.Threadmuse.Dao.adminUpdateorder;


@WebServlet("/admin_updateprodServlet")
public class admin_updateprodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String status = request.getParameter("status");

            adminUpdateorder dao = new adminUpdateorder(DBConn.getConnection());
            boolean updated = dao.updateOrderStatus(orderId, status);

            if(updated) {
                response.sendRedirect("admin_ordersite.jsp?success=1");
            } else {
                response.sendRedirect("admin_ordersite.jsp?error=1");
            }


        } catch (Exception e) {
            e.printStackTrace();
            
        }
    
	}

}
