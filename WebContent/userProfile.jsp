<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="cn.Threadmuse.Model.order" %>

<%@ page import="cn.Threadmuse.Dao.OrderDao" %>
<%@ page import="cn.Threadmuse.Connection.DBConn" %>
<%@ page import="java.sql.Connection" %>


 <%

 Integer userIdObj = (Integer) session.getAttribute("user_id");

 if (userIdObj == null) {
     response.sendRedirect("login.jsp");
     return;
 }

 int userId = userIdObj;

 Connection conn = DBConn.getConnection();
 OrderDao dao = new OrderDao(conn);

 List<order> myOrders = dao.getOrdersWithProducts(userId);

 request.setAttribute("myOrders", myOrders);
 
 UserModel user = (UserModel) session.getAttribute("key");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">



<link href ="CSS/orderdetails.css" rel="stylesheet">

</head>

<body>
<%@ include file ="includes/header.jsp" %>
<div class="container-fluid mt-5 p-2">
<div class="container my-5 p-1">
    
<div class="mb-4 p-3">
<h3 >Registered User </h3>
<p><strong>Name: </strong><%= user.getName() %></p>
<p><strong>Email : </strong><%= user.getEmail() %></p>
<p><strong>Contact : </strong><%= user.getMob() %></p>
</div>

<hr>


<h2 class="text-center mt-4">My Orders</h2>
<%
        
            List<order> list = (List<order>) request.getAttribute("myOrders");
            if(list != null && !list.isEmpty()){
            for(order or : list){
        %>
    <table class="table table-hover text-center custom-table">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Product</th>
                <th>Product name</th>
                <th>Date</th>
                <th>Total</th>
                <th>Payment</th>
                <th>Status</th>
                <th>Track</th>
            </tr>
        </thead>

        <tbody>
        
            <tr>
                <td><%= or.getOrderId() %></td>
               <td><img src="product_img/<%= or.getProductImage() %>"
               width="90px">
               </td>
               <td><%= or.getProductName() %></td>
               <td><%= or.getCreatedAt() %></td>
                <td>₹<%= or.getTotalAmount() %></td>
                <td><%= or.getPaymentMode() %></td>

                <td>
                    <span class="badge bg-info text-dark"><%= or.getStatus() %></span>
                </td>

                <td>
                    <a href="trackOrderServlet?orderId=<%= or.getOrderId() %>" 
                       class="btn btn-primary btn-sm">
                        Track
                    </a>
                </td>
            </tr>
        
        </tbody>
    </table>
    <% }
            
            }
             else{%>
                <div class="d-flex justify-content-center mt-5 "style="border:2px solid black;">
        			<p style="color:#FFFDO"> You haven’t placed any orders yet !</p>
        
					<a href="shop.jsp" class="btn mt-5 d-flex justify-content-between">Shop Now</a>
               
                </div>
            <% } %>
</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</html>
