<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threadmuse:Add Products</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css">

<%@include file="includes/head.jsp" %>

<link href="CSS/addprod.css" rel="stylesheet">

</head>
<body>
<%@include file="includes/admin_nav.jsp" %>

<div class="container-fluid mt-5 pt-5">

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="card shadow-sm me-auto ms-auto">
        <div class="card-header text-center mb-4">
          <img src="Images/favicon (1).png" alt="ThreadMuse Logo" class="login-logo">
        <h4 class="mb-0">Add Product to ThreadMuse Collection</h4>
        </div>
        <div class="card-body p-4">

          <form action="addproduct" method="post" enctype="multipart/form-data">
            <!-- Product Name -->
            <div class="mb-4">
              <label class="form-label">Product Name <span class="text-danger">*</span></label>
              <br><input type="text"  name="name" required class="w-100" />
            </div>


	<div class="row mb-3">
		<div class="col-md-8">
            <!-- Description -->
            <div class="mb-4">
              <label class="form-label">Description <span class="text-danger">*</span></label>
              <br><textarea  rows="4" name="descript" required class="w-100"></textarea>
            </div>
	
		</div>
    <div class="col-md-4">
        <label class="form-label">Sub Category</label>
        <select name="sub_category" class="form-select">
            <option>tshirt</option>
            <option>shirt</option>
            <option>jeans</option>
            <option>jacket</option>
            <option>dress</option>
            <option>frock</option>
             <option>blazzers</option>
            <option>pant</option>
             <option>shorts</option>
            <option>top</option>
              <option>saree</option>
            <option>other</option>
        </select>
    </div>
</div>

            <!-- Category & Gender -->
            <div class="row mb-4">
              <div class="col-md-6">
                <label class="form-label">Category <span class="text-danger">*</span></label>
                <select class="form-select" name="category" required>
                  <option value="">-- Select Category --</option>
                  <option value="office">office</option>
                  <option value="casuals">casuals</option>
                  <option value="college">college</option>
                  <option value="ethnic">ethnic</option>
                  <option value="party">party</option>
                  </select>
              </div>
              <div class="col-md-6">
                <label class="form-label">Gender</label>
                <select class="form-select" name="gender">
                  <option value="unisex">Unisex</option>
                  <option value="men">Men</option>
                  <option value="women">Women</option>
                  <option value="kids">Kids</option>
                </select>
              </div>
            </div>
          
                      <!-- Price & Discount -->
            <div class="row mb-4">
              <div class="col-md-6">
                <label class="form-label">Price (₹) <span class="text-danger">*</span></label>
                <input type="number" step="0.01" min="0" class="form-control" name="price" required />
              </div>
              <div class="col-md-6">
                <label class="form-label">Discount (%)</label>
                <input type="number" min="0" max="100" class="form-control" name="discount" />
              </div>
            </div>
            
            
                        <!-- Sizes with Stock -->
            <div class="mb-4">
              <div class="section-title">Sizes </div>
              <div id="sizesContainer">
                <!-- Dynamic size fields will be added here -->
              </div>
              <button type="button" class="btn btn-sm btn-outline-success" id="addSizeBtn">
                + Add Size
              </button>
            </div>

      
              <!-- Colors -->
            <div class="mb-4">
              <div class="section-title">Colors</div>
              <div id="colorsContainer" class="d-flex flex-wrap gap-2">
                <!-- Dynamic color swatches -->
              </div>
              <button type="button" class="btn btn-sm btn-outline-success mt-2" id="addColorBtn">
                + Add Color
              </button>
            </div>
           <!-- Images -->
           <!--   <div class="mb-4">
              <label class="form-label">Product Images (Max 5)</label>
              <input type="file" name="file" class="form-control" id="imageInput" accept="image/*" multiple />
              <small class="text-muted">Hold Ctrl/Cmd to select multiple images</small>
              <div id="imagePreview" class="mt-3 d-flex flex-wrap"></div>
            </div>
 -->
    <div class="mb-3">
    <label>Product Image</label>
    <input type="file" name="image" class="form-control" required>
</div>


            <!-- Submit Buttons -->
            
              <div class="d-flex justify-content-end gap-2">
             <a href="admin_page.jsp"><button type="button" class="btn btn-remove">
                Cancel
              </button>
              </a>
              <button type="submit" class="btn btn-add">
                Add Product
              </button>
            </div>
            
          </form>
        </div>
      </div>
    </div>
  </div>
</div>



</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // DOM Elements
  const sizesContainer = document.getElementById('sizesContainer');
  const colorsContainer = document.getElementById('colorsContainer');
  const addSizeBtn = document.getElementById('addSizeBtn');
  const addColorBtn = document.getElementById('addColorBtn');
  const imageInput = document.getElementById('imageInput');
  const imagePreview = document.getElementById('imagePreview');
  const form = document.getElementById('addProductForm');

 
  let sizeCount = 0;
  let colorCount = 0;
  let imageFiles = [];

  // Add Size Field
  addSizeBtn.addEventListener('click', () => {
    sizeCount++;
    const sizeDiv = document.createElement('div');
    sizeDiv.className = 'size-input-group';
    sizeDiv.innerHTML = `
      <select class="form-select" name="sizes" required>
        <option value="">Size</option>
        <option>XS</option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
        <option>XXL</option>
        <option>Free</option>
      </select>

      <span class="remove-btn" onclick="this.parentElement.remove()">×</span>
    `;
    sizesContainer.appendChild(sizeDiv);
  });

//Add Color Field
  addColorBtn.addEventListener('click', () => {
      const colorDiv =document.createElement('div');
      colorDiv.className = 'position-relative d-inline-block';

      /* colorDiv.innerHTML = `
          <input type="color" class="form-control form-control-color" 
                 name="colors"
                 value="#${Math.floor(Math.random()*16777215).toString(16)}">

          <span class="remove-btn position-absolute top-0 start-100 translate-middle"
                style="font-size:0.9rem; background:white; border-radius:50%;  width:20px; height:20px; text-align:center; line-height:20px;cursor:pointer;"
                onclick="this.parentElement.remove()">×</span>
      `;
 */
 const colorHex = Math.floor(Math.random()*16777215).toString(16);

 colorDiv.innerHTML = `
     <input type="color" class="form-control form-control-color" 
            value="#${colorHex}"
            onchange="this.nextElementSibling.value=this.value">

     <input type="hidden" name="colors" value="#${colorHex}">

     <span class="remove-btn position-absolute top-0 start-100 translate-middle"
    	 onclick="this.parentElement.remove()" style="font-size:0.9rem; background:white; border-radius:50%;  width:20px; height:20px; text-align:center; line-height:20px;cursor:pointer;">×</span>
 `;

      colorsContainer.appendChild(colorDiv);
      colorCount++;
      
  });

  // Image Preview
  /* imageInput.addEventListener('change', function () {
    imagePreview.innerHTML = '';
    imageFiles = Array.from(this.files);

    if (imageFiles.length > 5) {
      alert('Maximum 5 images allowed.');
      imageFiles = imageFiles.slice(0, 5);
      this.files = createFileList(imageFiles);
    }

    imageFiles.forEach((file, index) => {
      const reader = new FileReader();
      reader.onload = function (e) {
        const img = document.createElement('img');
        img.src = e.target.result;
        img.className = 'img-preview';
        img.title = file.name;
        imagePreview.appendChild(img);
      };
      reader.readAsDataURL(file);
    });
  });
 */

   

  
  // Initialize with one size field
  addSizeBtn.click();
</script>

</html>