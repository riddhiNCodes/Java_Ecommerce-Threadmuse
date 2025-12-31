<%@ page language="java"  
    contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>
<%@ page import="cn.Threadmuse.Model.UserModel" %>

<%
    UserModel user = (UserModel) session.getAttribute("key");
    if (user == null) {
        response.sendRedirect("login.jsp?msg=loginRequired");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Checkout - ThreadMuse</title>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<%@include file="includes/head.jsp" %>

<link rel="stylesheet" href="CSS/checkout.css">


</head>
<body>

<div class="container p-3">
    <div class="checkout-card">

      <img src="Images/favicon (1).png" alt="ThreadMuse Logo" class="login-logo">

        <h3 class="text-center mb-4">Shipping Details</h3>


        <form action="checkout">
 				<div class="row">

                <div class="col-md-6 mb-1">
                   <!-- USER NAME -->
                <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="name" value="<%=user.getName() %>"
                       placeholder="Customer name" readonly>
            </div>
    </div>

             <div class="col-md-6 mb-1">
               <!-- PHONE -->
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="text" name="phone" 
                       value=<%=user.getMob() %>
                       placeholder="Enter phone number" 
                       style="font-family:serif;"required>
                
            </div>
             </div>
              <p class="trust  m-1">We’ll contact you for delivery updates</p>
    </div>
    <div class="row">
       
            <!-- ADDRESS -->
            <div class=" mb-3">
                <label class="form-label">Address</label>
                <textarea name="address" class="form-control"
                          rows="3" placeholder="Full Shipping Address" required></textarea>
            </div>
      <hr>
          <!-- PAYMENT MODE -->
            <div class="mb-2">
                <label class="form-label">Payment Mode : </label>
             
                <p class="mt-2">
               <input type="radio" class="m-2" name="paymentMode" value="COD" checked>  <i class="fa-solid fa-money-bill" style="color: #07694c;"></i> Cash on Delivery
               |  <input type="radio" class="m-2" name="paymentMode" value="Card">  <i class="fa-duotone fa-solid fa-credit-card" style="--fa-primary-color: #26067f; --fa-secondary-color: #1a0a48;"></i> Card / UPI
                </p>
               
            </div>
            <hr>
        
    </div>
           

            <!-- SUBMIT -->
            <div class="text-center m-2">
               <button type="submit" class="btn  px-4 py-2">
                    Place Order Securely
                </button>
            </div>

        </form>

    </div>
</div>

</body>
</html>
