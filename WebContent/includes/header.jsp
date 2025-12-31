<%@page import="cn.Threadmuse.Model.*" %>
<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="CSS/header.css" >

</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center" style="line-height: 1; display: inline-block; vertical-align: middle; margin-left:8px;">
  <img src="Images/newlogo.png" height="90px" class="me-2" />
  <%
    UserModel key = (UserModel) session.getAttribute("key");
    if (key != null) {
  %>
    <span class="text-warning fw-bold">Welcome, <%= key.getName() %></span>
  <%
    } else {
  %>
    <span class="text-light fw-bold">Threadmuse</span>
  <%
    }
  %>
</a>
      <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#mynav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mynav">
        <form class="d-flex ms-4 me-3 ">
          <input class="form-control me-2" type="search" placeholder="Search"/>
          <button class="btn-signin" style="border-radius:50%;border:none;box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);">Search</button>
        </form>
        <ul class="navbar-nav">
          <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">Shop Now</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="officeproducts.jsp">Office wear</a></li>
              <li><a class="dropdown-item" href="collegeproducts.jsp">College wear</a></li>
              <li><a class="dropdown-item" href="casualproducts.jsp">Casuals</a></li>
              <li><a class="dropdown-item" href="partyproducts.jsp">Party Wear</a></li>
              <li><a class="dropdown-item" href="ethnicproducts.jsp">Ethnic Wear</a></li>
            </ul>
          </li>
        
<li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a>

<% 
   if (key != null) {
%>
    
    <li class="nav-item">
        <a class="nav-link" href="userProfile.jsp?user_id=">Profile</a>
    </li>
    <li class="nav-item">
        <a href="logoutServlet" class="btn-signout ">
            <i class="fas fa-user p-1"></i> SIGNOUT
        </a>
    </li>
<% } else { %>
    <li class="nav-item">
        <a href="login.jsp" class="btn-signin">
            <i class="fas fa-user p-1"></i> SIGN IN
        </a>
    </li>
<% } %>
</ul>
  
<a class="d-flex align-items-center  me-3 position-relative" href="cart.jsp">
    <i class="fa-solid fa-cart-shopping p-2" style="color: white; font-size:22px;"></i>

    <%
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        int totalQty = 0;

        if (cart != null) {
            for (Cart c : cart) {
                totalQty += c.getQuantity();
            }
        }

        if (totalQty > 0) {
    %>

        <!-- Notification Dot -->
      
            <span class="badge cart-badge"><%= totalQty %></span>
        

    <% } %>
</a>


      </div>
    </div>
  </nav>


</body>
</html>