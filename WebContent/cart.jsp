<%@ page import="java.util.*" %>
<%@ page import ="cn.Threadmuse.Model.Cart" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ThreadMuse - Shopping Cart </title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css">
<%@ include file="includes/head.jsp" %>  
<link href="CSS/cartpg.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/header.jsp" %> 

<div class="container-fluid mt-5 pt-5">
<div class="container mt-3 p-2">

 <%
        
 int subtotal = 0;

 if (cart != null) {
     for (Cart c : cart) {
         subtotal += c.getTotal();  
     }
 }

       
    %>

<div class="d-flex py-3">
	<h3>Your Cart has <b><i style="color:#3e7b63;"><%= totalQty %></i></b> items worth Rupees <i><b  style="color:#3e7b63;"><%= subtotal %></b></i> </h3>
	</div>

<table class="table table-hover custom-table ">
  <thead>
  
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Name</th>
 
      <th scope="col">Price</th>
      <th scope="col">Size</th>
      <th scope="col">Quantity</th>
      <th scope="col">SubTotal</th>
      <th scope="col">Cancel</th>
    </tr>
  </thead>
 
  <%
           if (cart != null) {
            for (Cart item : cart) {
    %>
    <tr>
      <td><%=item.getId() %></td>
      <td><img src="product_img/<%= item.getImage()%>" width="80px" ></td>
      <td><%= item.getName() %></td>
      
      <td><%= item.getPrice() %></td>
      <td><%= item.getSize() %></td> 
      <td>
        <form>
        <input type="hidden" name="id" value="1" class="form-input">
        <div class="form-group d-flex justify-content-center align-items-center" style="gap:10px;">

        
        <a class="btn btn-sm btn-incre" href="addtocartServlet?action=update&id=<%=item.getId()%>&quantity=<%=item.getQuantity()+1%>"><i class="fas fa-plus-square"></i></a>
        
        <input type="text" name="quantity" class="form-control" value="<%= item.getQuantity() %>" readonly>
        
        <a class="btn btn-sm btn-decre" 
         href="addtocartServlet?action=decre&id=<%=item.getId()%>&quantity=<%= (item.getQuantity()-1 ) %>">
        <i class="fas fa-minus-square"></i></a>
        
        </div>
        </form>
	  </td>
	  <td><%= item.getTotal() %></td>
      <td>
      <a class="btn btn-remove" style="background-color:#d9534f;color:white" href="addtocartServlet?action=remove&id=<%=item.getId()%>">Remove</a>
	 </td>
     </tr>
     <% } } else{ %>
     <caption>Your cart is empty</caption>
<%} %>
  </tbody>
</table>
<div>
<a href="index.jsp"><button>Continue shopping...</button></a>
<a href="checkout.jsp"><button>Proceed to Order</button></a>
</div>
</div> 
<%@include file="includes/footer.jsp" %>

</div>



</body>


<%
    String msg = request.getParameter("msg");
    if("emptyCart".equals(msg)){
%>
<script>
    alert("⚠️ Your cart is empty !");
</script>
<%
    }
    %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</html>