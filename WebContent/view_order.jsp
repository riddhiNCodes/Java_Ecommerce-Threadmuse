<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="cn.Threadmuse.Model.UserModel" %>
<%@ page import="cn.Threadmuse.Model.order" %>
<%@ page import="cn.Threadmuse.Model.Cart" %>
<%@ page import="cn.Threadmuse.Dao.OrderDao" %>
<%@ page import="cn.Threadmuse.Dao.CartDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.Threadmuse.Connection.DBConn" %>

<%
    String orderIdParam = request.getParameter("orderId");

    if (orderIdParam == null) {
        out.println("Order ID missing");
        return;
    }

    int orderId = Integer.parseInt(orderIdParam);

    UserModel user = (UserModel) session.getAttribute("key");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = DBConn.getConnection();
    OrderDao odao = new OrderDao(conn);

    // Fetch order using orderId
    order o = odao.getOrderById(orderId);

    // Fetch order items
    List<Cart> items = odao.getItemsByOrderId(orderId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details - ThreadMuse</title>
<%@include file="includes/head.jsp" %>
<link rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">



<link rel="stylesheet" href="CSS/view_order.css">

</head>
<body>

  <div class="container">

    <div class="order-box">

   <h3 class=" head text-center mb-4 fw-bold"><i class="fa-solid fa-cart-shopping" style="color:#24640c;"></i>
 Order Details</h3>


<div class="row mt-3 p-3">
    <div class="col-md-6">
        <!-- Order Summary -->
        <div class="mb-4 p-4">
            <h5 class="fw-bold">Order Summary</h5>
            <hr class="rule">
            <p><strong class="num">Order ID:</strong> #<%=o.getOrderId()%></p>
            <p><strong class="num">Order Date:</strong> <%=o.getCreatedAt()%></p>
            <p><strong>Status:</strong> 
                <span class="status-badge bg-success text-white"><%=o.getStatus()%></span>
            </p>
        </div>
</div>
 <div class="col-md-6">
        <!-- Customer Info -->
        <div class="mb-4 p-4 ms-4">
        
            <h5 class="fw-bold">Customer Details</h5>
            <hr class="rule">
            <p><strong>Name:</strong> <%=o.getName()%></p>
            <p><strong class="num">Phone:</strong> <%=o.getPhone()%></p>
            <p><strong>Address:</strong> <%=o.getAddress()%></p>
        </div>
    </div>
         <hr>
</div>
   

<div class="row">   
        <!-- Ordered Items -->
        <h5 class="fw-bold mt-2">Items in this Order</h5>

        <div class="mt-3">
       
        <% 
            int subTotal = 0;
            for(Cart c : items) { 
                int itemTotal = c.getPrice() * c.getQuantity();
                subTotal += itemTotal;
        %>
            <div class="row item-row">
                <div class="col-2">
                    <img src="product_img/<%=c.getImage()%>" 
                         class="img-fluid rounded" />
                </div>
                <div class="col-6">
                    <h6><%=c.getName()%></h6>
                    <p class="text-muted small num">Qty: <%=c.getQuantity()%></p>
                </div>
                <div class="col-4 text-end num">
                    <h6>₹ <%=itemTotal%></h6>
                </div>
            </div>

        <% } %>

        </div>
</div>
        <hr>

        <!-- Price Summary -->
        <div class="text-end">
            <h5 class="Subtotal num">Subtotal: ₹ <%=subTotal%></h5>
            <h4 class=" total fw-bold num">Total Paid: ₹ <%=o.getTotalAmount()%></h4>
        </div>

        <div class="text-center mt-4 ">
            <a href="userProfile.jsp" class="btn view">Back to Orders</a>
            <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
        </div>

    </div>
</div>

</body>
</html>
