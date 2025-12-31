
package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.AdminProductDao;
import cn.Threadmuse.Model.Product;

@MultipartConfig
@WebServlet("/UpdateProduct_servlet")
public class UpdateProduct_servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// LOAD PRODUCT INTO UPDATE PAGE
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        AdminProductDao dao = new AdminProductDao(DBConn.getConnection());
        Product product = dao.getProductById(id);

        request.setAttribute("product", product);
        request.getRequestDispatcher("updateproductAdmin.jsp").forward(request, response);
    }

    // 🔹 UPDATE PRODUCT
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            System.out.println("CONTENT TYPE = " + request.getContentType());

            // ===== BASIC FIELDS (ALWAYS SAFE) =====
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String descript = request.getParameter("descript");
            String category = request.getParameter("category");
            String subCategory = request.getParameter("sub_category");
            String gender = request.getParameter("gender");

            int price = Integer.parseInt(request.getParameter("price"));

            String discountStr = request.getParameter("discount");
            

            String[] sizesArr = request.getParameterValues("sizes");
            String sizes = sizesArr != null ? String.join(",", sizesArr) : "";

            String[] colorsArr = request.getParameterValues("colors");
            String colors = colorsArr != null ? String.join(",", colorsArr) : "";

            // ===== IMAGE HANDLING (CONDITIONAL) =====
            String imageName = request.getParameter("oldImage");

            if (request.getContentType() != null
                    && request.getContentType().toLowerCase().startsWith("multipart/")) {

                Part imagePart = request.getPart("image");

                if (imagePart != null && imagePart.getSize() > 0) {
                    String fileName = imagePart.getSubmittedFileName();
                    String uploadPath = getServletContext().getRealPath("") + "product_img";

                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();

                    imagePart.write(uploadPath + File.separator + fileName);
                    imageName = fileName;
                }
            }

            // ===== PRODUCT OBJECT =====
            Product product = new Product();
            product.setId(id);
            product.setName(name);
            product.setDescript(descript);
            product.setCategory(category);
            product.setSub_category(subCategory);
            product.setGender(gender);
            product.setPrice(price);
            product.setDiscount(discountStr);
            product.setSizes(sizes);
            product.setColors(colors);
            product.setImage(imageName);

            // ===== UPDATE =====
            AdminProductDao dao = new AdminProductDao(DBConn.getConnection());
            boolean success = dao.updateProduct(product);

            session.setAttribute("msg",
                    success ? "Product updated successfully!" : "Product update failed!");

            response.sendRedirect("admin_page.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "Something went wrong while updating product!");
            response.sendRedirect("admin_page.jsp");
        }
    }

    private String getValue(HttpServletRequest request, String name) throws Exception {
        Part part = request.getPart(name);
        if (part == null) return null;

        try (java.util.Scanner scanner = new java.util.Scanner(part.getInputStream())) {
            return scanner.hasNext() ? scanner.nextLine() : null;
        }
    }

}
