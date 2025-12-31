<%@page import="cn.Threadmuse.Dao.ProductDao"  %>
<%@page import="cn.Threadmuse.Connection.*"  %>
<%@page import="java.util.List" %>
<%@page import="cn.Threadmuse.Model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
    String admin = (String)session.getAttribute("admin");
    if(admin == null){
        response.sendRedirect("login.jsp");
    }
    
    ProductDao pd = new ProductDao(DBConn.getConnection());
    List<Product> products = pd.getAllproductsEthnic("ethnic");
    int total = products.size();
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product : Ethnic </title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css">

<%@include file="includes/head.jsp" %>

<link rel="stylesheet" href="CSS/admin_page.css">

</head>
<body>
<%@include file="includes/admin_nav.jsp" %>


<div class="container-fluid mt-5 pt-5">
<h1 class=" title mt-4 m-2">Available Ethnic Products - <%= total %> </h1>

<div class="row mt-4 p-2">
<%
if(!products.isEmpty())
{
 for(Product p : products) { %>

  <div class="col-md-6 mb-4">

    <div class="card">
      <div class="row g-0">

           <!-- LEFT SIDE IMAGE -->
       <div class="col-md-5 image-container">
          <img src="product_img/<%= p.getImage() %>" 
               class="img-fluid rounded-start product-img" 
               alt="<%= p.getName() %>">
        </div>

        <!-- RIGHT SIDE BODY -->
        <div class="col-md-7">
          <div class="card-body ms-2">
            
            <h4 class="card-title mb-3"><%= p.getName() %></h4>
            <h6 class="card-text text-muted">Product ID : <%= p.getId() %></h6>
            <h6 class="card-text text-muted">Category : <%= p.getCategory() %></h6>
             <h6 class="card-text text-muted"> Size :  <%= p.getSizes() %></h6>
            
            <p class="card-text dis"> Discount of <%= p.getDiscount() %>% </p>
            <p class="card-text fw-bold "> Rs. <%= p.getPrice() %></p>
            
 
          <a href="UpdateProduct_servlet?id=<%= p.getId() %>" class="btn btn-update ">Update Product</a>
             
              
            <a href="removeProdServlet?id=<%= p.getId() %>" class="btn btn-rem btn-sm ms-2" onclick="return confirm('Are you sure you want to delete this product?')">
            Remove Product</a>
          
          </div>
        </div>

      </div>
    </div>

  </div>

<% }
}
%>
</div>

</div>

<%@include file="includes/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</html>