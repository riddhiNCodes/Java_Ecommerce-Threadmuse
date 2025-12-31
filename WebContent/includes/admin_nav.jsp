<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Admin_nav</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS/header.css" >

</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center col-4" style="line-height: 1;
  display: inline-block;vertical-align: middle;margin-left:8px;">
        <img src="Images/newlogo.png" height="90px" class="me-2" />
   <%
        String admin1 = (String)session.getAttribute("admin");
        if (admin1 != null) {
  %>
         <span class="text-warning fw-bold">Welcome, Admin</span>
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
        
        <ul class="navbar-nav col-8">
          <li class="nav-item"><a class="nav-link" href="admin_page.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="admin_ordersite.jsp">Orders</a></li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">Stock</a>
            <ul class="dropdown-menu">
             <li><a class="dropdown-item" href="admin_page.jsp">All Products</a></li>
              <li><a class="dropdown-item" href="adminoffice.jsp">Office wear</a></li>
              <li><a class="dropdown-item" href="admincollege.jsp">College wear</a></li>
              <li><a class="dropdown-item" href="admincasual.jsp">Casuals</a></li>
              <li><a class="dropdown-item" href="adminparty.jsp">Party Wear</a></li>
              <li><a class="dropdown-item" href="adminethnic.jsp">Ethnic Wear</a></li>
            </ul>
          </li>
          
          <li class="nav-item"><a class="nav-link" href="AddProducts.jsp">Add Products</a></li>
         
          <li class="nav-item"><a class="nav-link" href="admin_viewUsers.jsp">Users</a></li>
       
       
        </ul>
<a href="logoutServlet" class="btn-signin">
  <i class="fas fa-user p-1"></i> SIGN OUT
</a>

      </div>
    </div>
  </nav>
  
  
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
 -->  
</body>
</html>