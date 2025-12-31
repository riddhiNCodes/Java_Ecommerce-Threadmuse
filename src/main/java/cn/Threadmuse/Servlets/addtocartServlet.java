package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.ProductDao;
import cn.Threadmuse.Model.Cart;
import cn.Threadmuse.Model.Product;
import cn.Threadmuse.Model.UserModel;

@WebServlet("/addtocartServlet")
public class addtocartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

		 UserModel user=(UserModel) request.getSession().getAttribute("key");
		   if(user!=null) {

		
	    HttpSession session = request.getSession();
	    List<Cart> cart = (List<Cart>) session.getAttribute("cart");

	    if (cart == null) {
	        cart = new ArrayList<>();
	    }

	    String action = request.getParameter("action");
	    int productId = Integer.parseInt(request.getParameter("id"));

	    // -------------------------------
	    // CASE 1: NO ACTION → Add to cart
	    // -------------------------------
	    if (action == null) {

	        ProductDao pd = new ProductDao(DBConn.getConnection());
	        Product p = pd.getProductById(productId);

	        boolean exists = false;
	        for (Cart c : cart) {
	            if (c.getId() == productId) {
	                c.setQuantity(c.getQuantity() + 1);
	                exists = true;
	                break;
	            }
	        }

	        if (!exists) {
	            Cart c = new Cart();
	            c.setId(p.getId());
	            c.setName(p.getName());
	            c.setPrice(p.getPrice());
	            c.setSize(p.getSizes());
	            c.setImage(p.getImage());
	            c.setQuantity(1);
	            cart.add(c);
	        }

	    } 
	    else {

	        // -------------------------------
	        // CASE 2: ACTION PRESENT → update/decrease/remove
	        // -------------------------------
	        switch (action) {

	            case "update":  // increase qty
	            case "decre":   // decrease qty
	                int qty = Integer.parseInt(request.getParameter("quantity"));
	                for (Cart c : cart) {
	                    if (c.getId() == productId) {
	                        if (qty < 1) qty = 1; // prevent ZERO qty
	                        c.setQuantity(qty);
	                        break;
	                    }
	                }
	                break;

	            case "remove":  // remove item
	                cart.removeIf(c -> c.getId() == productId);
	                break;
	        }
	    }

	    session.setAttribute("cart", cart);
	    String referer = request.getHeader("Referer");
	    response.sendRedirect(referer);
	}

	else {
		response.sendRedirect("login.jsp?msg=loginRequired");
        return;
	}
}
}