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


@WebServlet("/addProductBundleServlet")
public class addProductBundleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("key");

        // 🔐 Login check
        if (user == null) {
            response.sendRedirect("login.jsp?msg=loginRequired");
            return;
        }

        // 🛒 Get cart from session
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        
        String ids = request.getParameter("ids"); // "3,7,12,18"
        String[] productIds = ids.split(",");
        
        ProductDao pd = new ProductDao(DBConn.getConnection());

        // 🔁 Loop through each product in bundle
        for (String pid : productIds) {

            int productId;
            try {
                productId = Integer.parseInt(pid.trim());
            } catch (Exception e) {
                continue; // skip invalid id
            }

            Product p = pd.getProductById(productId);
            if (p == null) continue;

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

        // 💾 Save cart
        session.setAttribute("cart", cart);

        // 🔁 Redirect to cart
        response.sendRedirect("cart.jsp?msg=bundleAdded");
	}
}