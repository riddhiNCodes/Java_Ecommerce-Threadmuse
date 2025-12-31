package cn.Threadmuse.Servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import cn.Threadmuse.Model.UserModel;
import cn.Threadmuse.Connection.DBConn;
import cn.Threadmuse.Dao.UserDao;


@WebServlet("/adminServlet")
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConn.getConnection();
		UserDao ud = new UserDao(conn);
	
		List<UserModel> userList = ud.getAllUsers();
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("admin_viewUsers.jsp").forward(request, response);

	}

	
}
