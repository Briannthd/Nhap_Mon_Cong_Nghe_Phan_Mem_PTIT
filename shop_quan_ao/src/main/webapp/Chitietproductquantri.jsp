<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@page import="model.ChiTietSanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sản phẩm</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.product {
	max-width: 1200px;
	margin: 50px auto;
	padding: 30px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
}

.product-title {
	font-size: 3rem;
	font-weight: bold;
	color: #333;
	margin-bottom: 20px;
	text-align: center;
}

.product-image {
	width: 150px; /* Set a specific width for the image */
	height: 150px; /* Set the same height to maintain a perfect circle */
	border-radius: 50%; /* Makes the image circular */
	object-fit: cover;
	/* Ensures the image covers the circle without distortion */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
	margin: 0 auto;
}

.variants {
	margin-bottom: 40px;
}

.variant {
	background-color: #f9f9f9;
	border-radius: 10px;
	padding: 25px;
	margin-bottom: 25px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: relative;
}

.variant:hover {
	background-color: #f1f1f1;
}

.color-box {
	display: inline-block;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 20px;
}

.yellow {
	background-color: yellow;
}

.purple {
	background-color: purple;
}

.red {
	background-color: red;
}

.blue {
	background-color: blue;
}

.variant-details {
	font-size: 1.4rem;
	color: #555;
}

.size, .quantity {
	font-size: 1.3rem;
	color: #777;
	margin-bottom: 10px;
	margin-top: 10px;
}

.actions {
	display: flex;
	gap: 20px;
}

/* .edit, .delete, .save {
	padding: 12px 20px;
	font-size: 1.3rem;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background 0.3s ease;
} */
.edit, .delete, .save {
    width: 60px; /* Đặt chiều rộng cố định */
    height: 38px; /* Đặt chiều cao cố định */
    padding: 8px 12px; /* Điều chỉnh padding để nội dung căn giữa */
    font-size: 1.3rem;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s ease;
    display: inline-flex; /* Sử dụng flex để căn giữa nội dung */
    align-items: center; /* Căn giữa theo chiều dọc */
    justify-content: center; /* Căn giữa theo chiều ngang */
    box-sizing: border-box; /* Đảm bảo kích thước bao gồm padding và border */
}

.edit {
	background-color: #4CAF50;
}

.edit:hover {
	background-color: #45a049;
}

.delete {
	background-color: #f44336;
}

.delete:hover {
	background-color: #e53935;
}

.save {
	background-color: #008CBA;
}

.save:hover {
	background-color: #007B9E;
}

.input-field {
	display: none;
}

.product-price {
	text-align: center;
	font-size: 2rem;
	font-weight: bold;
	color: #333;
	margin-top: 30px;
}

/* Button "Quay lại" */
.back-button {
	display: inline-flex;
	align-items: center;
	margin: 20px auto;
	font-size: 1.4rem;
	font-weight: bold;
	color: #ffffff;
	background-color: #4CAF50;
	padding: 12px 25px;
	border-radius: 8px;
	text-decoration: none;
	cursor: pointer;
	transition: background 0.3s ease;
}

.back-button img {
	width: 20px;
	margin-right: 10px;
}

.back-button:hover {
	background-color: #45a049;
}

.cangiua {
	text-align: center;
	margin-bottom: 30px;
}

#addVariantBtn {
	display: inline-block;
	padding: 12px 25px;
	margin: 20px auto;
	background-color: #008CBA;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 1.2rem;
	transition: background 0.3s ease;
}

#addVariantBtn:hover {
	background-color: #007B9E;
}

/* Form thêm variant */
#addVariantForm {
	display: none;
	background-color: #fff;
	padding: 30px;
	margin-top: 20px;
	border-radius: 10px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 600px;
	margin-left: auto;
	margin-right: auto;
}

#addVariantForm h3 {
	text-align: center;
	font-size: 2rem;
	margin-bottom: 20px;
	color: #333;
}

#addVariantForm input {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 1rem;
	color: #333;
}

#addVariantForm button {
	width: 48%;
	padding: 12px;
	margin: 10px 1%;
	border: none;
	border-radius: 8px;
	font-size: 1.1rem;
	cursor: pointer;
	transition: background 0.3s ease;
}

#addVariantForm button[type="submit"] {
	background-color: #4CAF50;
	color: white;
}

#addVariantForm button[type="submit"]:hover {
	background-color: #45a049;
}

#addVariantForm button[type="button"] {
	background-color: #f44336;
	color: white;
}

#addVariantForm button[type="button"]:hover {
	background-color: #e53935;
}
/* Sử dụng Flexbox để căn chỉnh các nút (Quay lại và Thêm variant mới) */
.button-container {
	display: flex;
	justify-content: space-between; /* Đặt các nút ở 2 đầu đối diện */
	align-items: center; /* Căn giữa theo chiều dọc */
	margin: 20px 0;
}

/* Nút "Thêm variant mới" */
#addVariantBtn {
	display: inline-flex;
	align-items: center;
	padding: 12px 25px;
	background-color: #008CBA;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 1.2rem;
	transition: background 0.3s ease;
}

#addVariantBtn img {
	width: 20px;
	margin-right: 10px; /* Khoảng cách giữa biểu tượng và văn bản */
}

#addVariantBtn:hover {
	background-color: #007B9E;
}

/* Nút "Quay lại" */
.back-button {
	display: inline-flex;
	align-items: center;
	font-size: 1.4rem;
	font-weight: bold;
	color: #ffffff;
	background-color: #4CAF50;
	padding: 12px 25px;
	border-radius: 8px;
	text-decoration: none;
	cursor: pointer;
	transition: background 0.3s ease;
}

.back-button img {
	width: 20px;
	margin-right: 10px;
}

.back-button:hover {
	background-color: #45a049;
}
/* Hiệu ứng fade-in khi form xuất hiện */
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
#addVariantForm {
	display: none;
	animation: fadeIn 0.5s ease-out; /* Thêm hiệu ứng fade-in */
}

/* Hiệu ứng fade-out khi form biến mất */
@
keyframes fadeOut {from { opacity:1;
	
}

to {
	opacity: 0;
}

}
#addVariantForm.fade-out {
	animation: fadeOut 0.5s ease-out;
}

.cachnhau {
	margin-bottom: 150px
}
/* Style the select box */
.styled-select {
	width: 200px; /* Increase the width */
	padding: 10px; /* Add padding for more space inside */
	font-size: 16px; /* Increase font size */
	border: 1px solid #ccc; /* Add a light border */
	border-radius: 8px; /* Rounded corners */
	background-color: #f9f9f9; /* Light background color */
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
	transition: all 0.3s ease; /* Smooth transition for focus effect */
}

.styled-select:focus {
	border-color: #4CAF50; /* Green border when focused */
	outline: none; /* Remove the default outline */
	box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
	/* Add shadow when focused */
}

/* Add some spacing for labels and inputs */
form label {
	font-weight: bold;
	margin-bottom: 5px;
	display: inline-block;
}

/* Add some spacing between form elements */
form input, .styled-select {
	margin-bottom: 15px;
}

.quantity-input {
    width: 100px; /* Tăng chiều rộng, bạn có thể điều chỉnh giá trị */
    height: 30px; /* Tăng chiều cao, bạn có thể điều chỉnh giá trị */
    font-size: 16px; /* Tăng kích thước chữ nếu cần */
}
</style>
</head>
<body>
	<%
	String projectName = request.getContextPath(); // Lấy tên dự án
	%>
	<%
	HttpSession s = request.getSession(false); // false để không tạo session mới
	int id = (Integer) s.getAttribute("idthamchieu");
	String error = (String) request.getAttribute("loi");
	%>
	<!-- Form thêm variant mới (ẩn ban đầu) -->
	<div class="cachnhau" id="addVariantForm">
		<%
		if (error != null) {
		%>
		<div style="color: red;"><%=error%></div>
		<%
		}
		%>
		<h3>Thêm Variant Mới</h3>

		<form action="Themchitietsanpham" method="GET">
			<input type="hidden" value=<%=id%> name="id"> <label
				for="color">Màu sắc:</label> <input type="text" id="color"
				name="color" placeholder="Nhập màu sắc" required><br>
			<br> <label for="size">Kích cỡ:</label> <br> <select
				id="size" required class="styled-select" name="addKichco">
				<option value="">Chọn kích cỡ</option>
				<option value="S">S</option>
				<option value="M">M</option>
				<option value="L">L</option>
				<option value="XL">XL</option>
				<option value="XXL">XXL</option>
			</select><br>
			<br> <label for="quantity">Số lượng:</label> <input
				type="number" id="quantity" name="adSoluong"
				placeholder="Nhập số lượng" required min="0"><br>
			<br>

			<button type="submit" class="btn btn-primary">Lưu</button>
			<button type="button" class="btn btn-secondary"
				onclick="cancelAddVariant()">Hủy</button>
		</form>
	</div>
	<%
	String loi = (String) request.getAttribute("loi");
	if(loi != null){
	%>
	<script>
	alert("Sản phẩm này đã tồn tại");
	</script>
	<%} %>
	<%
	LaydulieuReponsitory l = new LaydulieuReponsitory();

	System.out.println("id product quan tri trong phan lay id jsp " + id);
	List<ChiTietSanPham> chitiet = l.Laythongtinchitietsanpham();
	List<SanPham> sp = l.Laythongtinsanpham();
	%>
	<div class="product">
		<div class="button-container">
			<!-- Nút quay lại -->
			<a href="<%=projectName%>/productquantri.jsp" class="back-button"> <img
				src="https://img.icons8.com/ios/452/left.png" alt="Quay lại">
				Quay lại
			</a>

			<!-- Nút "Thêm variant mới" -->
			<button id="addVariantBtn" class="btn btn-success">
				<img src="https://img.icons8.com/ios/452/plus.png" alt="Thêm">
				Thêm
			</button>
		</div>
		<!-- Nút quay lại -->
		<!--  <a href="productquantri.jsp" class="back-button">
            <img src="https://img.icons8.com/ios/452/left.png" alt="Quay lại"> Quay lại
        </a>
        <button id="addVariantBtn" class="btn btn-success">Thêm variant mới</button> -->

		<%
		for (SanPham sanpham : sp) {
			if (sanpham.getMaSanpham() == id) {
		%>
		<h1 class="product-title"><%=sanpham.getTenSanPham()%></h1>
		<div class="cangiua">
			<img src=<%=sanpham.getDuongDanAnh()%> alt="Áo thun nam"
				class="product-image">
		</div>
		<%
		}
		}
		%>
		<%
		for (ChiTietSanPham c : chitiet) {
			
			if (c.getMaSanPham() == id) {
				if(!c.getDaXoa().equals("1")){
		%>
		<div class="variants">
			<!-- Các sản phẩm với màu sắc và kích cỡ khác nhau -->
			<div class="variant">
				<div class="variant-details">
					<span style="magrin-top: 10px; font-size: 1.3rem; color: #777">Màu
						sắc: <%=c.getMauSac()%></span>
					<div class="size">
						Kích cỡ: <span class="size-value"><%=c.getKichCo()%></span>
					</div>
					<div class="quantity">
						Số lượng:
						<%=c.getSoLuong()%></div>
				</div>
				<div class="actions">
					<button class="edit" onclick="editVariant(this)">Sửa</button>
					<!-- <form action="Xoachitietproductquantri" method="POST"
						class="d-inline"> -->
						<form action="Xoachitietproductquantri" method="POST" class="d-inline"
      onsubmit="return confirm('Bạn có chắc chắn muốn xóa không?');">

						<input type="hidden" name="id"
							value="<%=c.getIdChiTietSanPham()%>">
						<button class="delete" type="submit">Xóa</button>
					</form>
					<form class="input-field" action="SuachitietsanphamproductQT"
						method="POST">
						<%--    <label type="text" class="color-input" placeholder="Màu sắc" name="mausac" value="<%=c.getMauSac() %>">
                        <label type="text" class="size-input" placeholder="Kích cỡ" name="size" value="<%= c.getKichCo() %>"> --%>
						<input type="number" class="quantity-input" placeholder="Số lượng"
							name="soluong" value="<%=c.getSoLuong()%>"> <input
							type="hidden" name="id" value="<%=c.getIdChiTietSanPham()%>">
						<button class="save" onclick="saveChanges(this) type="submit">Lưu</button>


					</form>
				</div>
			</div>

			<!-- Các variant khác tương tự... -->
		</div>
		<%
				}
		}
		}
		%>
		<%
		for (SanPham sanpham : sp) {
			if (sanpham.getMaSanpham() == id) {
		%>
		<div class="product-price">
			<p>
				Giá:
				<%=sanpham.getGia()%></p>
		</div>
		<%
		}
		}
		%>
	</div>

	<script>
		// Hàm hiển thị ô input khi nhấn "Sửa"
		function editVariant(button) {
			const variant = button.closest('.variant');
			const inputField = variant.querySelector('.input-field');
			inputField.style.display = 'block';

			// Hiển thị các giá trị cũ vào các ô input
			const color = variant.querySelector('.color-box').style.backgroundColor;
			const size = variant.querySelector('.size-value').textContent;
			const quantity = variant.querySelector('.quantity').textContent
					.split(": ")[1];

			variant.querySelector('.color-input').value = color;
			variant.querySelector('.size-input').value = size;
			variant.querySelector('.quantity-input').value = quantity;
		}

		// Hàm lưu thông tin và ẩn các ô input
		function saveChanges(button) {
			const variant = button.closest('.variant');
			const colorInput = variant.querySelector('.color-input').value;
			const sizeInput = variant.querySelector('.size-input').value;
			const quantityInput = variant.querySelector('.quantity-input').value;

			// Cập nhật thông tin hiển thị
			variant.querySelector('.color-box').style.backgroundColor = colorInput;
			variant.querySelector('.size-value').textContent = sizeInput;
			variant.querySelector('.quantity').textContent = `Số lượng: ${quantityInput}`;

			// Ẩn các ô input và nút Lưu
			const inputField = variant.querySelector('.input-field');
			inputField.style.display = 'none';
		}
		document.getElementById('addVariantBtn').addEventListener('click', function() {
			  var addVariantForm = document.getElementById('addVariantForm');
			  addVariantForm.style.display = 'block';  // Hiển thị form
			  addVariantForm.classList.remove('fade-out'); // Xóa hiệu ứng fade-out nếu có
			  addVariantForm.classList.add('fade-in');  // Thêm hiệu ứng fade-in để form xuất hiện mượt mà
			});

			function cancelAddVariant() {
			  var addVariantForm = document.getElementById('addVariantForm');
			  addVariantForm.classList.add('fade-out'); // Thêm hiệu ứng fade-out để form biến mất mượt mà
			  setTimeout(function() {
			    addVariantForm.style.display = 'none'; // Ẩn form sau khi hiệu ứng fade-out hoàn tất
			    addVariantForm.classList.remove('fade-out'); // Reset hiệu ứng fade-out
			  }, 500); // Thời gian phù hợp với độ dài của hiệu ứng fade-out
			}

	</script>
</body>
</html>
