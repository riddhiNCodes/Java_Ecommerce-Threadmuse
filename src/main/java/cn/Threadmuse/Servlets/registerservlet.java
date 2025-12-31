package cn.Threadmuse.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.UserDao;
import cn.Threadmuse.Model.UserModel;

@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String n = request.getParameter("fullName");
        String e = request.getParameter("email");
        String p = request.getParameter("password");
        String cp = request.getParameter("confirmPassword");
        String m = request.getParameter("phone");

        HttpSession session = request.getSession();

        try {
            UserDao udao = new UserDao(DBConn.getConnection());

            // ---- VALIDATIONS ----

            // Empty field check
            if (n == null || e == null || p == null || m == null ||
                    n.isEmpty() || e.isEmpty() || p.isEmpty() || m.isEmpty()) {

                session.setAttribute("errorMsg", "All fields are required!");
                response.sendRedirect("register.jsp");
                return;
            }

            // Password match
            if (!p.equals(cp)) {
                session.setAttribute("errorMsg", "Passwords do not match!");
                response.sendRedirect("register.jsp");
                return;
            }

            // Phone validation
            if (m.length()!=10) {
                session.setAttribute("errmob", "Invalid Mobile Number!");
                response.sendRedirect("register.jsp");
                return;
            }

            // Email exists check
            if (udao.isEmailExists(e)) {
                session.setAttribute("errorMail", "Email already registered!");
                response.sendRedirect("register.jsp");
                return;
            }

            // ---- REGISTER USER ----
            UserModel user = udao.userRegister(n, e, p, m);

            if (user != null) {
                session.setAttribute("successMsg", "Registration Successful! Please Login.");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong. Try again!");
                response.sendRedirect("register.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            session.setAttribute("errorMsg", "Server error: " + ex.getMessage());
            response.sendRedirect("register.jsp");
        }
    }

}
