<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="java.util.List" %>
<%@ page import =" cn.Threadmuse.Connection.DBConn"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "cn.Threadmuse.Dao.OrderDao" %>
<%@ page import= "cn.Threadmuse.Dao.CartDao" %>
<%@ page import=" cn.Threadmuse.Model.Cart"%>
<%@ page import = "cn.Threadmuse.Model.order" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file ="includes/head.jsp" %>
<title>OrderDetail : AdminPanel</title>
<link href ="CSS/orderdetails.css" rel="stylesheet">
</head>
<body>
<div class ="container-fluid">
<div class = "Container mt-2 p-2">
<% 
order o =(order) request.getAttribute("order");       
%>
<h2 class="text-center">Order #<%= o.getOrderId() %></h2>
<div class="customer-details">


<h4>Customer Info</h4>
<p><strong>Name: </strong> <%= o.getName() %></p>
<p><strong>Phone: </strong> <%= o.getPhone()%></p>
<p><strong>Address: </strong><%=o.getAddress()%></p>
<p><strong>Payment: </strong> <%= o.getPaymentMode()%></p>
<p><strong>Status: </strong><span class="w-30 badge bg-warning text-dark"><%= o.getStatus() %></span></p>


</div>
<hr>

<h4>Order Items</h4>

<table class="table table-hover text-center custom-table">
    <thead>
        <tr>
        	<th>Product ID</th>
            <th>Image</th>
            <th>Product</th>
            <th>Size</th>
    
            <th>Quantity</th>
            <th>Price</th>
            <th><strong>Update Status:</strong></th>
        </tr>
    </thead>

    <tbody>
    <% 
       List<Cart> cart= (List<Cart>) request.getAttribute("items");
       for(Cart c : cart ){
    %>
            <tr>
           	 <td><%= c.getId() %></td>
                <td><img src="product_img/<%= c.getImage() %>" width="80" style="object-fit:cover;"></td>
                <td><%= c.getName() %></td>
                <td><%= c.getSize() %></td>
                <td><%= c.getQuantity() %></td>
                <td><strong>₹<%= c.getPrice() %></strong></td>
          
          <td>

          	<form action="admin_updateprodServlet" method="post" class="mb-3">
    <input type="hidden" name="orderId" value="<%= o.getOrderId() %>" />

    <select name="status" class="form-select w-25 d-inline-block ">
        <option value="Pending" <%= o.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
      
        <option value="Shipped" <%= o.getStatus().equals("Shipped") ? "selected" : "" %>>Shipped</option>
        
        <option value="Out for Delivery" <%= o.getStatus().equals("Out for Delivery") ? "selected" : "" %>>Out for Delivery</option>
        
        <option value="Delivered"<%= o.getStatus().equals("Delivered") ? "selected" : "" %>>Delivered</option>
        
        <option value="Cancelled" <%= o.getStatus().equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
    </select>

    <button type="submit" class="btn btn-success d-inline-block">Update</button>
</form>
          	
          
          </td>
          
          
          
          
          
            </tr>
        <%} %>
    </tbody>
</table>
</div>
</div>
</body>
</html>