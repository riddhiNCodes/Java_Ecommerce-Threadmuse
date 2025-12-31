<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ThreadMuse - Forgot Password</title>

    <!-- Bootstrap 5 -->
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(to right, #e8dfd8, #f6f3ef);
            font-family: "Poppins", sans-serif;
        }
        .forgot-container {
            max-width: 420px;
            margin-top: 90px;
        }
        .card {
            border: none;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .brand-name {
            font-size: 28px;
            font-weight: 700;
            color: #4A3F35;
        }
        .btn-reset {
            background-color: #4A3F35;
            color: #fff;
            font-weight: 500;
            border-radius: 10px;
        }
        .btn-reset:hover {
            background-color: #362f29;
        }
    </style>
</head>

<body>

    <div class="container d-flex justify-content-center">
        <div class="forgot-container">
            
            <div class="text-center mb-3">
                <div class="brand-name">ThreadMuse</div>
            </div>

            <div class="card">

                <h4 class="text-center mb-3">Forgot Password?</h4>
                <p class="text-center text-muted" style="font-size:14px;">
                    Enter your registered email. We will send you a link to reset your password.
                </p>

                <!-- Error or success message -->
                <% 
                    String err = (String)session.getAttribute("resetError");
                    String suc = (String)session.getAttribute("resetSuccess");
                    if(err != null){ %>
                        <div class="alert alert-danger py-2"><%= err %></div>
                <% session.removeAttribute("resetError"); } %>

                <% if(suc != null){ %>
                    <div class="alert alert-success py-2"><%= suc %></div>
                <% session.removeAttribute("resetSuccess"); } %>

                <!-- Forgot Password Form -->
 <form action="forgotpass_Servlet" method="post">

             <div class="form-step active">
            <div class="form-group">
                <label style="color:#555">Email</label>
                <input type="email" name="email" placeholder="Enter your email " required>
            </div>
            <button type="button" onclick="nextStep(2)">Next</button>
        </div>
           <div class="form-step">
            <div class="form-group">
                <label style="color:#555">Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group" style="color:#555">
                <label >Confirm Password</label>
                <input type="password" placeholder="Enter confirm password" name="confirmPassword" required>
            </div>
           </div>
           <div class="btn text-center mt-3">
                    Submit
            </div>
                </form>

                <div class="text-center mt-3">
                    <a href="login.jsp" class="text-dark">
                        ← Back to Login
                    </a>
                </div>

            </div>

        </div>
    </div>

</body>
</html>
