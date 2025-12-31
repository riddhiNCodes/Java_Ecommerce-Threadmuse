<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="includes/head.jsp" %>


<title>Threadmuse - About us</title>


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
     body {
  margin:0;
  padding: 0;
  font-family: 'Playfair Display', serif;
  /*height: 80vh;*/

  justify-content: center;
  align-items: center;
 
  /* Gradient overlay */
  background: linear-gradient(to right, #e8dfd8, #f6f3ef);
  position: relative;
}
.container-fluid{
 filter:brightness(1.1);
}
/* Hero Section */
.about-hero {
    background: linear-gradient(to right, #d4af37, #2f5d4c);
    color: white;
    padding: 100px 0;
    text-align: center;
    
}

.about-hero h1 {
    font-weight: 700;
    letter-spacing: 1px;
}

.about-hero p {
    max-width: 700px;
    margin: 20px auto 0;
    opacity: 0.9;
}

/* Section spacing */
.section-padding {
    padding: 80px 0;
}

/* Cards */
.about-card {
    border: none;
    border-radius: 18px;
    padding: 30px;
    height: 100%;
    box-shadow: 0 12px 30px rgba(0,0,0,0.08);
    transition: transform .3s ease;
}

.about-card:hover {
    transform: translateY(-6px);
}

/* Icons */
.about-icon {
    font-size: 40px;
    color: #000;
    margin-bottom: 15px;
}

/* Values */
.value-box {
    background: #f8f9fa;
    border-radius: 16px;
    padding: 25px;
    text-align: center;
}

/* Divider */
.divider {
    width: 70px;
    height: 4px;
    background: #000;
    margin: 20px auto;
}
.login-logo {
  width: 80px;      
  margin-bottom: 10px;
}
</style>

</head>
<body>

<%@include file="includes/header.jsp" %>

<div class="container-fluid mt-5 pt-5 ">
<!-- Hero -->
<section class="about-hero mt-4 ">
<img src="Images/favicon (1).png" alt="ThreadMuse Logo" class="login-logo">
    <div class="container">
        <h1>About ThreadMuse</h1>
        <p>
            ThreadMuse is where fashion meets individuality.  
            We curate styles that empower you to express confidence, elegance, and creativity.
        </p>
    </div>
</section>

<!-- Our Story -->
<section class="section-padding">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold">Our Story</h2>
            <div class="divider"></div>
            <p class="text-muted mt-3">
                Born from a passion for fashion and technology, ThreadMuse brings
                carefully curated collections for every occasion.
            </p>
        </div>

        <div class="row g-4">
            <div class="col-md-6">
                <p>
                    At ThreadMuse, we believe fashion is more than clothing —
                    it’s an expression of identity. From casual essentials to
                    statement pieces, every product is designed to reflect
                    quality, comfort, and trend.
                </p>
            </div>
            <div class="col-md-6">
                <p>
                    Our platform blends modern design with seamless shopping
                    experiences, ensuring every customer finds their perfect fit,
                    style, and confidence.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Mission / Vision -->
<section class="section-padding bg-light">
    <div class="container">
        <div class="row g-4">

            <div class="col-md-6">
                <div class="about-card">
                    <div class="about-icon">🎯</div>
                    <h4 class="fw-bold">Our Mission</h4>
                    <p class="text-muted">
                        To make fashion accessible, inspiring, and empowering
                        through quality designs and seamless digital experiences.
                    </p>
                </div>
            </div>

            <div class="col-md-6">
                <div class="about-card">
                    <div class="about-icon">🌍</div>
                    <h4 class="fw-bold">Our Vision</h4>
                    <p class="text-muted">
                        To become a trusted fashion destination that celebrates
                        diversity, creativity, and sustainable style choices.
                    </p>
                </div>
            </div>

        </div>
    </div>
</section>

<!-- Why Choose Us -->
<section class="section-padding">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold">Why Choose ThreadMuse</h2>
            <div class="divider"></div>
        </div>

        <div class="row g-4 text-center">
            <div class="col-md-3">
                <div class="value-box">
                    <h5 class="fw-bold">Premium Quality</h5>
                    <p class="text-muted">Carefully crafted fabrics & finishes</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="value-box">
                    <h5 class="fw-bold">Trend Focused</h5>
                    <p class="text-muted">Inspired by global fashion trends</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="value-box">
                    <h5 class="fw-bold">Secure Shopping</h5>
                    <p class="text-muted">Safe & smooth checkout experience</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="value-box">
                    <h5 class="fw-bold">Customer First</h5>
                    <p class="text-muted">Your satisfaction is our priority</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA -->
<section class=" section-padding text-white text-center" style="background-color: #2f5c4c;">
    <div class="container">
        <h2 class="fw-bold">Discover Your Style with ThreadMuse</h2>
        <p class="mt-3 mb-4">
            Explore collections curated just for you.
        </p>
        <a href="index.jsp" class="btn btn-light btn-outline-success btn-lg px-4">Shop Now</a>
    </div>
</section>

</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</html>