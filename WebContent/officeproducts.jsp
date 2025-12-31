<%@page import="cn.Threadmuse.Dao.ProductDao"  %>
<%@page import="cn.Threadmuse.Connection.*"  %>

<%@page import="java.util.List" %>

<%@page import="cn.Threadmuse.Model.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   UserModel user=(UserModel) request.getSession().getAttribute("key");
   if(user!=null)
   {
	   request.setAttribute("key", user);
	   
   }
   ProductDao pd = new ProductDao(DBConn.getConnection());
   List<Product> products = pd.getAllproductsOffice("office");
   int size = products.size();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ThreadMuse- Office wears</title>
<%@include file="includes/head.jsp" %>

<link rel="stylesheet" href="CSS/productpg.css">
</head>
<body>

<%@ include file="includes/header.jsp" %> 


  <div class="container-fluid mt-5 pt-5">
   
    <!-- Breadcrumb + Title -->
    <div class="row mb-3 pt-5">
        <div class="col-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="shop.jsp">Clothing</a></li>
                    <li class="breadcrumb-item active">Office Wear</li>
                </ol>
            </nav>
            <h2 class="fw-bold">Office Wear</h2>
        </div>
    </div>

 <div class="d-flex justify-content-between align-items-center mb-3">
    <p class="text-muted mb-0">Showing <%= size %> products</p>
    <select class="form-select w-auto">
        <option>Sort by: Recommended</option>
        <option>Price: Low to High</option>
        <option>Price: High to Low</option>
    </select>
</div>

    <!-- MAIN CONTENT -->
    <div class="row">

        <!-- LEFT FILTER -->
        <div class="col-12 col-md-2 ">
            <%@include file="includes/filter.jsp" %>
        </div>

            <!-- Product Grid -->
    	
       <div class="col-12 col-md-10">
            <div class="row">
<%
    if(!products.isEmpty())
    {
    	for(Product p :products){ %>
    	
                <div class="col-6 col-md-3  product-card mb-2">
                    <div class="card">
                    <div class="image-container">
                        <img src="product_img/<%=p.getImage()%>" class="img-fluid card-img-top product-img" alt="<%=p.getName() %>>">
                     </div>
                        <div class="card-body">
                            <h6 class="fw-semibold mb-1"><%=p.getName()%></h6>
                          <h6 class="card-text text-muted"> Size :  <%= p.getSizes() %></h6>
                       
                           <h6 class="text-muted small mb-1">Category : <%=p.getCategory() %></h6>
                           
                           <p class="card-text dis" 
                           style="color:#FFD700;text-decoration:underline;"> Discount of <%= p.getDiscount() %>% </p>
                          <p class="fw-bold text-success"> Rs. <%= p.getPrice() %></p>
          
                            
                        </div>
                        <a href="addtocartServlet?id=<%=p.getId()%>" class="btn btn-outline-success m-3 mt-1">
                            <i class="fa-solid fa-bag-shopping fa-flip"></i>
                                         Add to cart
                        </a>
                    </div>
                </div>
      
                    	 <% }
  }
%> 
            </div>
       
            <!-- <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="index.jsp">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
 -->        </div>
 
    </div> 
</div> 
<%@include file="includes/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</html>