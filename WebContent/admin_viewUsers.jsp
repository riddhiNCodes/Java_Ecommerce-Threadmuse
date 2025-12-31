<%@ page import="java.util.List" %>


<%@ page import =" cn.Threadmuse.Model.UserModel" %>
<%@ page import =" cn.Threadmuse.Connection.DBConn"%>
<%@ page import = "cn.Threadmuse.Dao.UserDao" %>
<%@ page import = "java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
Connection conn = DBConn.getConnection();
UserDao ud = new UserDao(conn);

List<UserModel> userList = ud.getAllUsers();
request.setAttribute("userList", userList);
int t = userList.size();
		
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Registered Users - Admin Panel</title>

    <!-- BOOTSTRAP 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<%@ include file ="includes/head.jsp" %>
<%@ include file ="includes/admin_nav.jsp" %>
    <link href ="CSS/orders.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid mt-5 p-2">
<div class="container my-5">


    <h2 class="page-title mb-4 text-center">Registered Users : <%= t %></h2>

    <!-- Search Bar -->
    <div class="row mb-3">
        <div class="col-md-4 ms-auto">
            <input type="text" id="searchInput" class="form-control" placeholder="Search by name, email, or phone">
        </div>
    </div>
<%
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
%>

<div class="alert alert-info text-center" style="font-size : 20px;"><%= msg %></div>

<%
        session.removeAttribute("msg");
    }
%>

    <!-- Table -->
<div class="table-container">
    <table class="table table-hover text-center custom-table" id="userTable">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <%  
                List<UserModel> users = (List<UserModel>) request.getAttribute("userList");
                for(UserModel u : users){
            %>
            
            <tr>
                <td><%=u.getId() %></td>
                <td><%=u.getName() %></td>
                <td><%=u.getEmail() %></td>
                <td><%=u.getMob() %></td>
				<td>
                 <a href="deleteUser?userid=<%=u.getId()%>" 
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure?')">
                        Delete
                    </a>
                </td>
            </tr>

            <% } %>
        </tbody>
    </table>
</div>


</div>
</div>
<script>
    // Simple Search Filter
    document.getElementById("searchInput").addEventListener("keyup", function() {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll("#userTable tbody tr");

        rows.forEach(row => {
            let text = row.textContent.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    });
 </script>   


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</html>
