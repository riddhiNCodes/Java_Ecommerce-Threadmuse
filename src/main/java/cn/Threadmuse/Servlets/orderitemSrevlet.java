package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.OrderDao;
import cn.Threadmuse.Model.Cart;
import cn.Threadmuse.Model.order;

@WebServlet("/orderitemSrevlet")
public class orderitemSrevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idParam = request.getParameter("orderId");

		if(idParam == null || idParam.equals("")) {
		   System. out.println("Invalid Order ID");
		    return;
		}

		int orderId = Integer.parseInt(idParam);
		OrderDao orderDao = new OrderDao(DBConn.getConnection());
		OrderDao itemDao = new OrderDao(DBConn.getConnection());

		order orderObj = orderDao.getOrderById(orderId);
		List<Cart> orderItems = itemDao.getItemsByOrderId(orderId);

		request.setAttribute("order", orderObj);
		request.setAttribute("items", orderItems);


        request.getRequestDispatcher("admin_order_details.jsp").forward(request, response);
	}

	

}
