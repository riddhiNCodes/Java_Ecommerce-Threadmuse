<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import =" cn.Threadmuse.Connection.DBConn"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "cn.Threadmuse.Dao.OrderDao" %>
<%@page import= "cn.Threadmuse.Model.order" %>
<%@page import="java.util.List" %>

 <%
Connection conn = DBConn.getConnection();
OrderDao dao = new OrderDao(conn);
List<order> orderList = dao.getAllOrders();   // Create this method in dao
request.setAttribute("orderList", orderList);
int t = orderList.size();
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="includes/head.jsp" %>
<meta charset="UTF-8">
<title>Orders_page:Admin panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<%@ include file ="includes/admin_nav.jsp" %>
<link href ="CSS/orders.css" rel="stylesheet">
  
</head>

<body>
<div class="container-fluid mt-5 p-2">
<div class="container my-5">

    <h2 class="page-title mb-4 text-center">Orders : <%= t %></h2>

    <!-- Search Bar -->
    <div class="row mb-3">
        <div class="col-md-4 ms-auto">
            <input type="text" id="searchInput" class="form-control" placeholder="Search by name, email, or phone">
        </div>
    </div> 

    <% if(request.getParameter("success") != null) { %>
    <p style="color:green;font-size:30px;">Order updated Successfully !</p>
<% } %>
    <!-- Table -->
    <div class="table-container">

<table class="table table-hover text-center custom-table" id="orderTable">
    <thead>
        <tr>
            <th>Order ID</th>
            <th>User</th>
            <th>Phone</th>
            <th>Total</th>
            <th>Payment</th>
            <th>Date</th>
            <th>Status</th>
            <th>View</th>
        </tr>
    </thead>

    <tbody>
    <% 
       List<order> order =(List<order>) request.getAttribute("orderList") ;
       for(order o : order){
      %>
            <tr>
                <td><%= o.getOrderId() %></td>
                <td><%= o.getName()  %></td>
                <td><%= o.getPhone() %></td>
                <td>₹<%= o.getTotalAmount() %></td>
                <td><%= o.getPaymentMode() %></td>
                <td><%= o.getCreatedAt() %></td>
                
                <td><%= o.getStatus() %></td>

                <td>
                    <a href="orderitemSrevlet?orderId=<%= o.getOrderId() %>" class="btn btn-primary btn-sm">
                        View Details
                    </a>
                </td>
            </tr>
        <%} %>
    </tbody>
</table>
</div>
</div>
</div>
  <script>
    // Simple Search Filter
    document.getElementById("searchInput").addEventListener("keyup", function() {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll("#orderTable tbody tr");

        rows.forEach(row => {
            let text = row.textContent.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    }); 
</script>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
