package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.CartDao;
import cn.Threadmuse.Dao.OrderDao;
import cn.Threadmuse.Model.Cart;
import cn.Threadmuse.Model.UserModel;
import cn.Threadmuse.Model.order;

@WebServlet("/checkout")
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
  		
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String paymentMode = request.getParameter("paymentMode");
  		
        HttpSession session = request.getSession();

       
       // 1. CHECK USER LOGIN
       UserModel user = (UserModel) session.getAttribute("key");
        if (user == null) {
            response.sendRedirect("login.jsp?msg=loginRequired");
            return;
        }

      
        // 2. READ SESSION CART
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp?msg=emptyCart");
            return;
        }

   
        // 3. CALCULATE TOTAL
        int totalAmount = 0;
        for (Cart c : cart) {
            totalAmount += c.getTotal();
        }

       
        // 4. CREATE ORDER OBJECT
       
        order order = new order();
        order.setUserId(user.getId());
        order.setName(name);
        order.setPhone(phone);
        order.setAddress(address);
        order.setPaymentMode(paymentMode);
        
        order.setTotalAmount(totalAmount);

        // Date and time
        String createdAt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        order.setCreatedAt(createdAt);

        order.setStatus("Pending");

      
        // 5. SAVE ORDER TO DB
        OrderDao orderDao = new OrderDao(DBConn.getConnection());
        int orderId = orderDao.createOrder(order);


     
        // 6. SAVE ORDER ITEMS
      
        CartDao itemDao = new CartDao(DBConn.getConnection());
       
        for (Cart c : cart) {
            Cart item = new Cart();

            item.setOrderId(orderId);
            item.setId(c.getId());
            item.setName(c.getName());
            item.setCategory(c.getCategory() == null ? "" : c.getCategory());
            item.setSize(c.getSize() == null ? "" : c.getSize());
            item.setPrice(c.getPrice());
            item.setQuantity(c.getQuantity());
            item.setSubtotal(c.getTotal());  // FIXED !!
            item.setImage(c.getImage());

            itemDao.addOrderItem(item);
        }

    
        // 7. CLEAR CART
        session.removeAttribute("cart");

       
        // 8. REDIRECT SUCCESS PAGE
        response.sendRedirect("order_success.jsp?orderId=" + orderId);
    }

	}


