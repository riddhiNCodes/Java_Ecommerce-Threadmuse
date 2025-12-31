<%@page import="cn.Threadmuse.Model.*" %>
<%@page import="cn.Threadmuse.Dao.ProductDao" %>
<%@page import="cn.Threadmuse.Connection.DBConn" %>
<%@page import="java.sql.Connection" %>
<%@page import="cn.Threadmuse.Model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   UserModel user=(UserModel) request.getSession().getAttribute("key");
   if(user!=null)
   {
	   request.setAttribute("key", user);
	  

	   
   }
%>  
<!DOCTYPE html>
<html>
<head>

<title>HomePage</title>


<%@include file="includes/head.jsp" %>

<link rel="stylesheet" href="CSS/index.css">


</head>
<body>

<%@ include file="includes/header.jsp" %> 



<div class="container-fluid mt-5 pt-5">
<section class="hero-banner d-flex align-items-center text-light  mt-4" style="background-image: url('Images/new_banner.png'); ">
  <div class="container text-center" style="margin-top: 100px;"> 
    <h1 class="display-4 fw-bold">Welcome to ThreadMuse</h1>
    <p class="lead">Where fashion becomes expressive, immersive, and irresistibly yours.</p>
    <a href="shop.jsp" class="btn  btn-lg mt-3">Explore Collection</a>
  </div>
</section>
</div>


<div class="container-fluid ">
  <div class="container mt-2 mb-2">
    <div class="row ">
      <div class="col">
      <div id="carouselExampleCaptions" class="carousel slide"data-bs-ride="carousel" data-bs-interval="9000">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  
   <div class="carousel-inner">
<div class="carousel-item active" style="height: 350px; overflow: hidden;">
  <img 
    src="Images/Banners/item4.png" 
    class="d-block w-100 h-100" 
    alt="sale on casuals"
    style="object-fit: cover; object-position: center; height: 350px; width: 100%;"
  >

</div>

   <div class="carousel-item " style="height: 350px; overflow: hidden;">
  <img 
    src="Images/Banners/item7.png" 
    class="d-block w-100 h-100" 
    alt="sale on office wear"
    style="object-fit: cover; object-position: center; height: 350px; width: 100%;"
  >

</div>
<div class="carousel-item " style="height: 350px; overflow: hidden;">
  <img 
    src="Images/Banners/item6.png" 
    class="d-block w-100 h-100" 
    alt="sale on college wear"
    style="object-fit: cover; object-position: center; height: 350px; width: 100%;"
  >

</div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
      </div>
      
    </div>
    
  </div>
  
</div>


<div class="container-fluid">
  <div class="container mt-2 mb-2 con2">
  <div class="row">
    <h2 class="section-title" style="text-align:center;">Explore Our Styles</h2>
    <p class="section-subtitle">Find your perfect look — whether it's for the office, campus, or a casual day out.</p>

<hr class="divider" />
    <h2 class="tagline">Modshift: <em>Your fit for every shift — from desk to lecture to weekend chill.</em></h2>

 
    <div class="col mt-2 ms-4">
      <div class="card">
      <img src="Images/office.jpg" class="card-img-top" alt="office wear";>
      <div class="card-body text-center">
        <span class="card-tag">#Workwear</span>
<h3 class="card-title">Office wear</h3>
      <div class="card-text"><h6>Power dressing, re-imagined.</h6>
      <p>Step into your workday with confidence. From crisp shirts to minimalistic co-ords.</p>
      </div>
      <a href="shop.jsp" class="btn btn-outline-success  mx-5">
      <i class="fa-solid fa-bag-shopping fa-flip"></i>
      Shop now
      </a>
<div style="text-align: center; margin-top: 8px;">
  <a href="officeproducts.jsp" class="btn btn-dark px-4 py-2" style="border-radius: 25px;">
    View All Styles
  </a>
</div>
      
  <div class="text-warning mb-1">
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star-half-alt"></i>
  <span class="text-muted small">(4.8/5 · 240 reviews)</span>
</div>

  </div>
  </div>
</div>

    <div class="col mt-2 ms-4">
      <div class="card" >
      <img src="Images/college.jpg" class="card-img-top" alt="college wear">
      <div class="card-body text-center">
           <span class="card-tag">#Collegewear</span>
      <h3 class="card-title">College wear</h3>
      <div class="card-text"><h6>Style that speaks your vibe.</h6>
     <p> Fresh, functional and a little fun—this collection balances chill fits to keep you campus-ready every day.</p>
      </div>

      <a href="shop.jsp" class="btn btn-outline-success mx-5">
      <i class="fa-solid fa-bag-shopping fa-flip"></i>
      Shop now
      </a>
    <div style="text-align: center; margin-top: 8px;">
  <a href="collegeproducts.jsp" class="btn btn-dark px-4 py-2" style="border-radius: 25px;">
    View All Styles
  </a>
</div>

    <div class="text-warning mb-1">
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star-half-alt"></i>
  <span class="text-muted small">(4.8/5 · 240 reviews)</span>
</div>

</div>
</div>
</div>

  <div class="col mt-2 ms-4 pb-3">
      <div class="card">
      <img src="Images/casual2.jpg" class="card-img-top" alt="casuals wear">
      <div class="card-body text-center">
           <span class="card-tag">#Casualwear</span>

      <h3 class="card-title">Casuals</h3>

      <div class="card-text"><h6>Relax, but make it chic.</h6>
          <p>Think breezy tops, denim love, and laid-back looks that never try too hard.</p>
      </div>
      <a href="shop.jsp" class="btn btn-outline-success mx-5">
      <i class="fa-solid fa-bag-shopping fa-flip"></i>
      Shop now
      </a>

      <div style="text-align: center; margin-top: 8px;">
  <a href="casualproducts.jsp" class="btn btn-dark px-4 py-2" style="border-radius: 25px;">
    View All Styles
  </a>
</div>
    <div class="text-warning mb-1">
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star"></i>
  <i class="fas fa-star-half-alt"></i>
  <span class="text-muted small">(4.8/5 · 240 reviews)</span>
</div>
  </div>
</div>
</div>

</div>
</div>
</div>



<div class="container-fluid mt-3">
  <div class="container mb-2 con1">
<div class="row" style="background-image:url(Images/Banners/back.png);">
  <div class="tagline fw-semibold mt-4"><h2 style=" color: goldenrod; text-align:center;"><em>Noor : "Evoking glam + shimmer, perfect for festive or spotlight moments”</em></h2>
   </div>
  <hr class="m-3">
  <div class="col ms-4 p-4 d-flex justify-content-evenly ">

      <div class="card " style="width:300px; border-radius:35%;">
      <img src="Images/ethnic.jpg" class="card-img-top" alt="ethnic wear" style="border-radius:35%;">
      <div class="card-body text-center">
      <h3 class="card-title">Ethnic wear</h3>
      <!-- <p class="card-text"><h6>Tradition meets trend.</h6>
       Celebrate culture-with vibrant weaves.From kurta sets to fusion drapes.
      </p> -->
      <a href="ethnicproducts.jsp" class="btn btn-outline-success  mx-5">
      <i class="fa-solid fa-bag-shopping fa-flip"></i>
      Shop now
      </a>
     </div>
     </div>
</div>
<div class="col mt-5 ms-4 p-3 d-flex justify-content-evenly">
   <div class="fst-italic discript p-3 mt-3" style="height: 350px;">
     <h4>
     Celebrate heritage with a modern twist. Whether it’s a festive gathering or a quiet cultural nod, each look speaks of elegance, authenticity, and timeless charm.Bold and statement finishes this is where fashion meets fantasy,for every celebration</h4>
     
   </div>
</div> 
<div class="col p-3 ms-4  d-flex justify-content-evenly">
      <div class="card" style="width: 300px; border-radius:35%;">
      <img src="Images/party2.jpg" class="card-img-top" alt="party wear" style="border-radius:35%;">
      <div class="card-body text-center">
      <h3 class="card-title">Party wear</h3>
     
      <a href="partyproducts.jsp" class="btn btn-outline-success  mx-5">
      <i class="fa-solid fa-bag-shopping fa-flip"></i>
      Shop now
      </a>
  </div>
</div>
</div> 

</div>
</div>

</div>


 
<div class="container con2 my-5 mt-3 p-4 ">
  <h2 class="section-title text-center mb-4">Special Offers </h2>
 
  <div class="row g-3">
    
            <!-- Offer 1 -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="offer-card card border-0 shadow">
                    <img src="Images/womensoffer.jpg" class="card-img-top" alt="Offer 1">
                    <div class="card-body text-center">
                        <h5 class="card-title">Women’s Collection</h5>
                        <p class="card-text fw-bold">Flat 50% OFF</p>
                        <a href="#" class="btn offer-btn">Shop Now</a>
                    </div>
                </div>
            </div>
    
            <!-- Offer 2 -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="offer-card card border-0 shadow">
                    <img src="Images/mensoffer.jpg" class="card-img-top" alt="Offer 2">
                    <div class="card-body text-center">
                        <h5 class="card-title">Men’s Fashion</h5>
                        <p class="card-text fw-bold">Min 40% OFF</p>
                        <a href="#" class="btn offer-btn">Explore</a>
                    </div>
                </div>
            </div>

            <!-- Offer 3 -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="offer-card card border-0 shadow">
                    <img src="Images/casoff.jpg"  class="card-img-top" alt="Offer 3">
                    <div class="card-body text-center">
                        <h5 class="card-title">Regular Wear</h5>
                        <p class="card-text fw-bold">Buy 1 Get 1 Free</p>
                        <a href="#" class="btn offer-btn">Grab Offer</a>
                    </div>
                </div>
            </div>
  </div>
</div>



<div class="container-fluid mb-4">
  <div class="container d-flex justify-content-center p-3" >
    <div class="card1">
        <div class="card1-header">
            <h3>Modern Office Collection-Womens</h3>
        </div>

<%
Connection conn = DBConn.getConnection();
ProductDao pd = new ProductDao(conn);
List<Product> products = pd.getOfficeProduct(); // returns 4 products
List<Product> productCasual = pd.getcasualsProduct();
        		  
int totalPrice = 0;
int t = 0;

StringBuilder productIds = new StringBuilder();
StringBuilder productIds2 = new StringBuilder();


for (Product p : products) {
    totalPrice += p.getPrice();
    productIds.append(p.getId()).append(",");
    
 
}

for(Product p : productCasual){
	t += p.getPrice();
	productIds2.append(p.getId()).append(",");
}
%>

<div class="card1-body">
    <div class="gallery">
        <% for(Product p : products) { %>
            <div class="gallery-item">
                <img src="product_img/<%= p.getImage() %>" 
                 alt="<%= p.getName() %>">
               
            <p class="price">₹<%= p.getPrice() %></p>
		    </div>
        <% } %>
 </div>
</div>

<div class="card1-footer">
    
        <span class="price status-badge">₹ <%=  totalPrice %></span>
       
        <a href="addProductBundleServlet?ids=<%= productIds.toString() %>"class="btn offer-btn">
            Add to Cart
        </a>
   				
</div> 

<%conn.close(); %>
</div>
</div>

</div>

<section class="why-bundles py-4 mt-4 mb-4">
<div class="container">
<div class="row text-center g-4">
<div class="col-md-3 col-6">
<div class="why-card">
<span class="why-icon">✔</span>
<h6>Curated Styles</h6>
<p>Expert-picked outfits that always work together</p>
</div>
</div>


<div class="col-md-3 col-6">
<div class="why-card">
<span class="why-icon">₹</span>
<h6>Better Value</h6>
<p>Save more when you shop smart bundles</p>
</div>
</div>


<div class="col-md-3 col-6">
<div class="why-card">
<span class="why-icon">👗</span>
<h6>Ready-to-Wear</h6>
<p>No styling stress — just wear & go</p>
</div>
</div>


<div class="col-md-3 col-6">
<div class="why-card">
<span class="why-icon">🔄</span>
<h6>Easy Exchange</h6>
<p>Hassle-free size exchange available</p>
</div>
</div>
</div>
</div>
</section>

<div class="container-fluid mt-4">
  <div class="container d-flex justify-content-center p-3" >
    <div class="card1">
        <div class="card1-header">
            <h3>Casual Combos at Special Prices</h3>
        </div>

<div class="card1-body">
    <div class="gallery">
        <% for(Product p : productCasual) { %>
            <div class="gallery-item">
                <img src="product_img/<%= p.getImage() %>" 
                 alt="<%= p.getName() %>">
               
            <p class="price">₹<%= p.getPrice() %></p>
		    </div>
        <% } %>
 </div>
</div>

<div class="card1-footer">
    
        <span class="price status-badge">₹ <%=  t %></span>
       
        <a href="addProductBundleServlet?ids=<%= productIds2.toString() %>"class="btn offer-btn">
            Add to Cart
        </a>
   				
</div> 

<%conn.close(); %>
</div>




</div>


</div>





<%@ include file="includes/footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</html>