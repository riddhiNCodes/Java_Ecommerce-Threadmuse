<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.Threadmuse.Model.UserModel" %>
<%@ page import="cn.Threadmuse.Model.order" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession session2 = request.getSession();
    UserModel user = (UserModel) session2.getAttribute("key");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    
    String orderIdStr = request.getParameter("orderId");
    int orderId = 0;

    if (orderIdStr != null) {
        orderId = Integer.parseInt(orderIdStr);
    }


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful</title>

<%@ include file="includes/head.jsp" %>

<link rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<link rel="stylesheet" href="CSS/order_success.css">
</head>
<body>
 
<div class="container mt-5">
    <div class="card success-card p-4 text-center">

        <div class="check-icon">✔</div>

        <h2 class="mt-3 text-success">Order Placed Successfully!</h2>
        <p class="text-muted">Thank you, <strong class="text-success"><%=user.getName() %></strong></p>

        <h5>Your Order ID:</h5>
        <h3 class="fw-bold" style="font-family:serif;"># <%= orderId %></h3>

        <p class="mt-3">
            You will receive further updates on your registered email/phone.
        </p>
 <div class="whats-next">
    <h4>What’s Next?</h4>
    <ul>
        <li><i class="bi bi-box-seam" style="color:#FFD700;"></i> Your order is being prepared for shipment</li>
        <li><i class="fa-solid fa-truck" style="color: #0a6b4e;"></i> Shipping updates will be sent via email & SMS</li>
        <li><i class="fa-sharp fa-solid fa-location-dot" style="color: #e00b0b;"></i> Track your order anytime from <b>My Orders</b></li>
        <li><i class="fa-solid fa-file-invoice" style="color: #000000;"></i> Invoice will be available after shipping</li>
    </ul>
</div>


        <hr>

        <div class="d-flex justify-content-center gap-3">
            <a href="index.jsp" class="btn btn-success px-4">Continue Shopping</a>

            <a href="view_order.jsp?orderId=<%= orderId %>" 
               class="btn view px-4">
               View Order Details
            </a>
        </div>

    </div>
</div>  
</body>
</html>
