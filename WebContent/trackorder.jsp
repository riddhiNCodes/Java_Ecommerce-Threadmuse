<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.Threadmuse.Model.order" %>

<!DOCTYPE html>
<html>
<head>
<title>My Orders</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">


<%@include file="includes/head.jsp" %>

<link rel="stylesheet" href="CSS/trackorder.css">

</head>

<body>

 
 <div class="container mt-5 p-5">
 
 <%@include file="includes/header.jsp" %>
 
    <div class="col-md-10 mx-auto ">

        <h3 class="page-title mb-4 mt-5">My Orders</h3>

        <%
            order o = (order) request.getAttribute("order");
            if (o != null) {
        %>

        <div class="card order-card mb-4 p-3">
            <div class="card-body">

                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <h5 class="fw-bold mb-1">Order #<%= o.getOrderId() %></h5>
                        <p class="text-muted mb-1">
                            Placed on <%= o.getCreatedAt() %>
                        </p>
                       
                        <p class="fw-semibold">
                            Total: ₹<%= o.getTotalAmount() %>
                        </p>
                    </div>

                    <span class="status-badge
                        <%= o.getStatus().equalsIgnoreCase("Delivered") ? "bg-success text-white" :
                            o.getStatus().equalsIgnoreCase("Pending") ? "bg-warning text-dark" :
                            o.getStatus().equalsIgnoreCase("Out") ? "bg-danger text-dark" :
                            o.getStatus().equalsIgnoreCase("Shipped") ? "bg-info text-white" : "bg-primary text-white" %>">
                        <%= o.getStatus() %>
                    </span>
                </div>

                <!-- Progress -->
                <div class="mt-4">
                    <div class="progress" style="height: 7px;">
                        <div class="progress-bar bg-success"
                             style="width:
                             <%= o.getStatus().equalsIgnoreCase("Pending") ? "25%" :
                                 o.getStatus().equalsIgnoreCase("Shipped") ? "50%" :
                                 o.getStatus().equalsIgnoreCase("Out for Delivery") ? "75%" :
                                 o.getStatus().equalsIgnoreCase("Delivered") ? "100%" : "0%" %>;">
                        </div>
                    </div>

                    <div class="d-flex justify-content-between mt-2 text-muted small">
                        <span>Placed</span>
                        <span>Shipped</span>
                        <span>Out</span>
                        <span>Delivered</span>
                    </div>
                </div>

                <!-- Actions -->
                <div class="mt-4 d-flex gap-3 action-btns">
                    <a href="view_order.jsp?orderId=<%= o.getOrderId() %>"
                       class="btn btn-outline-primary btn-sm">
                        View Details
                    </a>

                    <% if ((!o.getStatus().equalsIgnoreCase("Delivered"))||(!o.getStatus().equalsIgnoreCase("Shipped"))) { %>
                    <a href="cancelOrder?orderId=<%= o.getOrderId() %>"
                       class="btn btn-outline-danger btn-sm">
                        Cancel Order
                    </a>
                    <% } %>
                </div>
<p class="text-muted mt-1"><i>"Cancellation is not available after Shipping"</i></p>
            </div>
        </div>

        <%
            } else {
        %>
            <div class="alert alert-warning rounded-4">
                No orders found.
            </div>
        <%
            }
        %>

    </div>
    
</div>
 <%@include file="includes/footer.jsp" %>
 
</body>
</html>
