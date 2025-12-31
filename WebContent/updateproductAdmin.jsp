<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.Threadmuse.Model.Product" %>

<%
Product p = (Product) request.getAttribute("product");
if (p == null) {
    response.sendRedirect("admin_page.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPanel : Update Product</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css">

<%@include file="includes/head.jsp" %>

<link href="CSS/addprod.css" rel="stylesheet">
</head>

<body>
<%@include file="includes/admin_nav.jsp" %>

<div class="container-fluid mt-5 pt-5">
<div class="container mt-5">

<div class="card shadow-sm me-auto ms-auto">
        <div class="card-header text-center mb-4">
          <img src="Images/favicon (1).png" alt="ThreadMuse Logo" class="login-logo">
<!--         <h4 class="mb-0">Update Product - ThreadMuse Collection  </h4>
 -->       
 <h4>Update Catalog Product</h4>
<small class="text-muted">ThreadMuse Collection</small>
 
  </div>

<div class="card-body">
<form action="UpdateProduct_servlet" method="post">

<!-- Hidden IDs -->
<input type="hidden" name="id" value="<%= p.getId() %>">
<input type="hidden" name="oldImage" value="<%= p.getImage() %>">

<!-- Product Name -->
<div class="mb-3">
    <label class="form-label">Product Name</label>
    <input type="text" class="form-control" name="name"
           value="<%= p.getName() %>" required>
</div>

<!-- Description + Category -->
<div class="row mb-3">
    <div class="col-md-8">
        <label class="form-label">Description</label>
        <textarea class="form-control" name="descript" rows="4"><%= p.getDescript() %></textarea>
    </div>

    <div class="col-md-4">
        <label class="form-label">Category</label>
        <select name="category" class="form-select" required>
            <option selected><%= p.getCategory() %></option>
                 <option value="office">office</option>
                  <option value="casuals">casuals</option>
                  <option value="college">college</option>
                  <option value="ethnic">ethnic</option>
                  <option value="party">party</option>
              
        </select>
    </div>
</div>

<!-- Sub Category + Gender -->
<div class="row mb-3">
    <div class="col-md-6">
        <label class="form-label">Sub Category</label>
        <select name="sub_category" class="form-select">
            <option selected><%= p.getSub_category() %></option>
             <option>tshirt</option>
            <option>shirt</option>
            <option>jeans</option>
            <option>jacket</option>
            <option>dress</option>
            <option>frock</option>
             <option>blazzers</option>
            <option>pant</option>
             <option>shorts</option>
            <option>top</option>
              <option>saree</option>
            <option>other</option>
        </select>
    </div>

    <div class="col-md-6">
        <label class="form-label">Gender</label>
        <select name="gender" class="form-select">
            <option selected><%= p.getGender() %></option>
            <option>men</option>
            <option>women</option>
            <option>unisex</option>
        </select>
    </div>
</div>

<!-- Price + Discount -->
<div class="row mb-3">
    <div class="col-md-6">
        <label class="form-label">Price (₹)</label>
        <input type="number" class="form-control" name="price"
               value="<%= p.getPrice() %>" required>
    </div>

    <div class="col-md-6">
        <label class="form-label">Discount (%)</label>
        <input type="number" class="form-control" name="discount"
               value="<%= p.getDiscount() %>">
    </div>
</div>

<!-- Sizes -->
<div class="mb-4">
<label class="form-label">Sizes</label>
<div id="sizesContainer">

<%
String[] sizes = p.getSizes() != null ? p.getSizes().split(",") : new String[0];
for(String s : sizes){
%>
<div class="d-flex gap-2 mb-2">
    <select name="sizes" class="form-select" required>
        <option value="">Size</option>
        <option <%= s.equals("XS")?"selected":"" %>>XS</option>
        <option <%= s.equals("S")?"selected":"" %>>S</option>
        <option <%= s.equals("M")?"selected":"" %>>M</option>
        <option <%= s.equals("L")?"selected":"" %>>L</option>
        <option <%= s.equals("XL")?"selected":"" %>>XL</option>
        <option <%= s.equals("XXL")?"selected":"" %>>XXL</option>
    </select>

    <span class="remove-btn" onclick="this.parentElement.remove()">×</span>
</div>
<% } %>

</div>

<button type="button" class="btn btn-sm btn-outline-success" id="addSizeBtn">
    + Add Size
</button>
</div>

<!-- Colors -->
<div class="mb-4">
<label class="form-label">Colors</label>
<div id="colorsContainer" class="d-flex flex-wrap gap-3">

<%
String[] colors = p.getColors() != null ? p.getColors().split(",") : new String[0];
for(String c : colors){
%>
<div class="position-relative">
    <input type="color" name="colors"
           value="<%= c %>"
           class="form-control form-control-color">
    <span class="remove-btn position-absolute top-0 start-100 translate-middle"
          onclick="this.parentElement.remove()">×</span>
</div>
<% } %>

</div>

<button type="button" class="btn btn-sm btn-outline-success mt-2" id="addColorBtn">
    + Add Color
</button>
</div>

<!-- Current Image -->
<div class="mb-3">
<label class="form-label">Product Image</label><br>
<img src="product_img/<%= p.getImage() %>" width="150" class="img-thumbnail">
<p class="m-1 text-muted">Product Image cannot be Updated !</p>
</div>

<!-- Submit -->
<div class="text-end">
    <a href="admin_page.jsp" class="btn btn-remove">Cancel</a>
    <button type="submit" class="btn btn-add">Update Product</button>
</div>

</form>
</div>
</div>
</div>
</div>
<script>
const sizesContainer = document.getElementById("sizesContainer");
const colorsContainer = document.getElementById("colorsContainer");

document.getElementById("addSizeBtn").onclick = () => {
    const div = document.createElement("div");
    div.className = "d-flex gap-2 mb-2";
    div.innerHTML = `
        <select name="sizes" class="form-select" required>
            <option value="">Size</option>
            <option>XS</option>
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
            <option>XXL</option>
            <option>free</option>
        </select>
        <span class="remove-btn" onclick="this.parentElement.remove()">×</span>
    `;
    sizesContainer.appendChild(div);
};

document.getElementById("addColorBtn").onclick = () => {
    const div = document.createElement("div");
    div.className = "position-relative";
    div.innerHTML = `
        <input type="color" name="colors" class="form-control form-control-color">
        <span class="remove-btn position-absolute top-0 start-100 translate-middle"
              onclick="this.parentElement.remove()">×</span>
    `;
    colorsContainer.appendChild(div);
};
</script>

</body>
</html>
