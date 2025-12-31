<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="head.jsp" %>

<style>
.category-filter {
    background: #ffffff;
    border-radius: 14px;
    padding: 20px;
    box-shadow: 0 8px 24px rgba(0,0,0,0.08);
}
.category-filter h6 {
    font-weight: 600;
    margin-bottom: 10px;
}


</style>
</head>
<body>



<div class=" category-filter  border rounded mt-4 p-2 bg-light">

    <div class="d-flex justify-content-between mb-3">
        <h6 class="fw-bold">Filters</h6>
        <a href="#" type="reset" class="text-danger small"><i class="fa-solid fa-rotate-left"></i>  CLEAR ALL</a>
    
    </div>

    <hr>

    <h6 class="fw-semibold">Category</h6>

    <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category" >
        <label class="form-check-label">tshirts</label>
    </div>

    <div class="form-check">
        <input class="form-check-input" type="checkbox"name="category">
        <label class="form-check-label">shirt</label>
    </div>
    
       <div class="form-check">
        <input class="form-check-input" type="checkbox"name="category">
        <label class="form-check-label">jeans</label>
    </div>
       <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category">
        <label class="form-check-label">jacket</label>
    </div>
       <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category">
        <label class="form-check-label">dress</label>
    </div>
       <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category">
        <label class="form-check-label">frock</label>
    </div>
       <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category">
        <label class="form-check-label">blazzers</label>
    </div>
       <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category">
        <label class="form-check-label">pant</label>
    </div>
       <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category">
        <label class="form-check-label">shorts</label>
    </div>
       <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category">
        <label class="form-check-label">top</label>
    </div>
       <div class="form-check">
        <input class="form-check-input" type="checkbox" name="category">
        <label class="form-check-label">other</label>
    </div>

    <hr>

    <h6 class="fw-semibold">Discount</h6>

<div class="form-check">
        <input class="form-check-input" type="radio" name="discount">
        <label class="form-check-label">5% & Above</label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="discount">
        <label class="form-check-label">20% & Above</label>
    </div>

    <div class="form-check">
        <input class="form-check-input" type="radio" name="discount">
        <label class="form-check-label">40% & Above</label>
    </div>

</div>

</body>
</html>