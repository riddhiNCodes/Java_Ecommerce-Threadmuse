<%@page import="cn.Threadmuse.Model.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   UserModel user=(UserModel) request.getSession().getAttribute("key");
   if(user!=null)
   {
	   response.sendRedirect("index.jsp");
	   
   }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sign In - ThreadMuse</title>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
 
<link href="CSS/login.css" rel="stylesheet">


<%
    String msg = request.getParameter("msg");
    if("loginRequired".equals(msg)){
%>
<script>
    alert("⚠️ Please login to continue!");
</script>
<%
    }
%>





</head>
<body>
  <div class="login-container">
    <div class="login-box">
      <img src="Images/favicon (1).png" alt="ThreadMuse Logo" class="login-logo">

      <h2 class="m-2">Welcome Back</h2>
      <p>Sign in to continue your journey with <strong>ThreadMuse</strong></p>
     
     <%
String success = (String) session.getAttribute("successMsg");
if(success != null){ %>
<div style="color:#FFD700;"><%= success %></div>
<% session.removeAttribute("successMsg"); } 

%>
      <form action="LoginServlet" method="post">
        <label for="email" >Email</label>
        <input type="email" name="mail" id="email" placeholder="you@example.com" required />
        
        <label for="password">Password</label>
        <input type="password" name="pass" id="password" placeholder="Enter your password" required />
        
        <button type="submit" class="btn-signin">Sign In</button>
      </form>
      <div class="links">
        <a href="forgot_pass.jsp">Forgot Password?</a>
        <span> | </span>
        <a href="register.jsp">Create Account</a>
      </div>
    </div>
  </div>
</body>
</html>
