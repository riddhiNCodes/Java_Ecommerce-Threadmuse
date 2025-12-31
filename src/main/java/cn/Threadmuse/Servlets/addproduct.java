package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;


import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.AdminProductDao;
import cn.Threadmuse.Model.Product;

@WebServlet("/addproduct")


	
@MultipartConfig(
	    maxFileSize = 10485760L,      // 10 MB in bytes
	    maxRequestSize = 52428800L,   // 50 MB in bytes
	    fileSizeThreshold = 1048576   // 1 MB (when to write to disk)
	)
public class addproduct extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		  HttpSession session = request.getSession();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();


		
		String name = request.getParameter("name");
		String descript = request.getParameter("descript");
		String category = request.getParameter("category");
		String sub_category = request.getParameter("sub_category");
		String gender = request.getParameter("gender");
		int price = Integer.parseInt(request.getParameter("price"));
		String discount = request.getParameter("discount");
		
		 String[] sizesArr = request.getParameterValues("sizes");
         String sizes = sizesArr != null ? String.join(",", sizesArr) : "";

         String[] colorsArr = request.getParameterValues("colors");
         String colors = colorsArr != null ? String.join(",", colorsArr) : "";

		

		  Part filePart = request.getPart("image");  // input field name="image"
	         String fileName = filePart.getSubmittedFileName();

				  String uploadPath = getServletContext().getRealPath("") + "product_img";
				 
				  filePart.write(uploadPath + "/" + fileName);
				   


		try {
			Product product = new Product();
			product.setName(name);
			product.setDescript(descript);
			product.setCategory(category);
			product.setSub_category(sub_category);
			product.setGender(gender);
			product.setPrice(price);
			product.setDiscount(discount);
			product.setSizes(sizes);
	        product.setColors(colors);
	        product.setImage(fileName);
	
	        
			Connection conn = DBConn.getConnection();
			AdminProductDao dao = new AdminProductDao(conn);
			int result = dao.insertProduct(product);

			if (result > 0) {
			    session.setAttribute("msg", "<h4 style='color:green'>✅ Product added successfully!</h4>");
			    response.sendRedirect("admin_page.jsp");
			} else {
			    session.setAttribute("msg", "<h4 style='color:red'>❌ Failed to add product!</h4>");
			    response.sendRedirect("AddProducts.jsp");
			}

		} catch (Exception e) {
			System.out.print("Error "+e.getMessage());
		e.printStackTrace();
		}
	}

}
