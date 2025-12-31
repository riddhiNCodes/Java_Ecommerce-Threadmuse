<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up - ThreadMuse</title>

<link href="CSS/register.css" rel="stylesheet">

</head>
<body>

 
<div class="register-container" >

    <div class="header">
        <img src="Images/favicon (1).png" alt="ThreadMuse Logo" class="login-logo">
        <h2>Register Your Account</h2>
        <p style="color:#555">Sign up to unlock a world of style. with <strong>ThreadMuse</strong></p>
    </div>


    <div class="progress-bar">
        <div class="step active">1</div>
        <div class="line"></div>
        <div class="step">2</div>
        <div class="line"></div>
        <div class="step">3</div>
    </div>
<%
String error = (String) session.getAttribute("errorMsg");
String m = (String) session.getAttribute("errorMail");
String p =(String) session.getAttribute("errmob");
if (error != null) {
%>
    <div style="color:red;"><%= error %></div>
<%
    session.removeAttribute("errorMsg");
} else if (m != null) {
%>
    <div style="color:red;"><%= m %></div>
<%
    session.removeAttribute("errorMail");
} else if (p != null) {
%>
    <div style="color:red;"><%= p %></div>
<%
    session.removeAttribute("errmob");
}%>

    <form id="register-form" action="registerservlet" method="post">
        <!-- STEP 1 -->
        <div class="form-step active">
            <div class="form-group">
                <label style="color:#555">Full Name</label>
                <input type="text" name="fullName" placeholder="Enter your name " required>
            </div>
            <div class="form-group">
                <label style="color:#555">Email</label>
                <input type="email" name="email" placeholder="Enter your email " required>
            </div>
            <button type="button" onclick="nextStep(2)">Next</button>
        </div>

        <!-- STEP 2 -->
        <div class="form-step">
            <div class="form-group">
                <label style="color:#555">Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group" style="color:#555">
                <label >Confirm Password</label>
                <input type="password" placeholder="Enter confirm password" name="confirmPassword" required>
            </div>
            <button type="button" onclick="prevStep(1)">Previous</button>
            <button type="button" onclick="nextStep(3)">Next</button>
        </div>

        <!-- STEP 3 -->
        <div class="form-step">
            <div class="form-group" style="color:#555">
                <label >Phone Number</label>
                <input type="tel" name="phone" placeholder="Enter your phone number">
            </div>
            <button type="button" onclick="prevStep(2)">Previous</button>
            <button type="submit">Register</button>
        </div>

        <div class="links">
            Already have an account? <a href="login.jsp">Sign in</a>
        </div>
    </form>

</div>



</body>
<!-- JavaScript -->
<script type="text/javascript">
function nextStep(step) {
    const steps = document.querySelectorAll('.form-step');
    const progressSteps = document.querySelectorAll('.progress-bar .step');
    const lines = document.querySelectorAll('.progress-bar .line');

    // Reset all form steps
    steps.forEach(s => s.classList.remove('active'));

    // Reset all progress steps + lines
    progressSteps.forEach(s => {
        s.classList.remove('active');
        s.classList.remove('completed');
    });
    lines.forEach(l => l.classList.remove('completed'));

    // Activate the current form step
    steps[step - 1].classList.add('active');
    progressSteps[step - 1].classList.add('active');

    // Color completed steps + lines
    for (let i = 0; i < step - 1; i++) {
        progressSteps[i].classList.add('completed');
        lines[i].classList.add('completed');
    }
}

function prevStep(step) {
    nextStep(step);
}
</script>
</html>