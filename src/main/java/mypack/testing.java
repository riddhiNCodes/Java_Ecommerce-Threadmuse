package mypack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import cn.Threadmuse.Connection.DBConn;   // <-- import your DBConn class

@WebServlet("/testdb")
public class testing extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection conn = DBConn.getConnection();
            if (conn != null) {
                out.println("<h3 style='color:green'>Database connection successful!</h3>");
            } else {
                out.println("<h3 style='color:red'>Database connection failed!</h3>");
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}
