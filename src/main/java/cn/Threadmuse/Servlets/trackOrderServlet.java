package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.OrderDao;
import cn.Threadmuse.Model.order;

@WebServlet("/trackOrderServlet")
public class trackOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrderDao dao = new OrderDao(DBConn.getConnection());
        order o = dao.getOrderById(orderId);

        request.setAttribute("order", o);

        request.getRequestDispatcher("trackorder.jsp").forward(request, response);
    }



}
