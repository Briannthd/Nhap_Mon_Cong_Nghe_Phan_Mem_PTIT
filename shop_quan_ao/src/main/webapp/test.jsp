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
    object-fit: cover; /* Ensures the image covers the circle without distortion */
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

.edit, .delete, .save {
	padding: 12px 20px;
	font-size: 1.3rem;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background 0.3s ease;
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
.cangiua{
    text-align: center;
    margin-bottom: 30px;
}
</style>
</head>
<body>

		<% LaydulieuReponsitory l = new LaydulieuReponsitory();
		
		HttpSession s = request.getSession(false); // false để không tạo session mới
		int id = (Integer) s.getAttribute("idthamchieu");
		System.out.println("id product quan tri trong phan lay id jsp "+ id);
		List<ChiTietSanPham> chitiet = l.Laythongtinchitietsanpham();
		List<SanPham> sp  = l.Laythongtinsanpham();
		%>
		 <div class="product">
        <!-- Nút quay lại -->
        <a href="productquantri.jsp" class="back-button">
            <img src="https://img.icons8.com/ios/452/left.png" alt="Quay lại"> Quay lại
        </a>
		<% 
		for(SanPham sanpham : sp){
			if(sanpham.getMaSanpham() == id){
		%>
        <h1 class="product-title"><%=sanpham.getTenSanPham()%></h1>
        <div class="cangiua">
            <img src=<%= sanpham.getDuongDanAnh() %> alt="Áo thun nam" class="product-image">
        </div>
        <%} } %>
        <%for(ChiTietSanPham c : chitiet){ 
        if(c.getMaSanPham() == id){
        %>
        <div class="variants">
            <!-- Các sản phẩm với màu sắc và kích cỡ khác nhau -->
            <div class="variant">
                <div class="variant-details">
                    <span style="magrin-top:10px;font-size: 1.3rem;
	color: #777">Màu sắc: <%= c.getMauSac() %></span> 
                    <div class="size">Kích cỡ: <span class="size-value"><%= c.getKichCo() %></span></div>
                    <div class="quantity">Số lượng: <%= c.getSoLuong() %></div>
                </div>
                <div class="actions">
                    <button class="edit" onclick="editVariant(this)">Sửa</button>
                   <form action="Xoachitietproductquantri" method="POST" class="d-inline">
                                        <input type="hidden" name="id" value="<%= c.getIdChiTietSanPham() %>">
                                        <button class="delete" type="submit">Xóa</button>
                                    </form>
                    <form class="input-field" action="SuachitietsanphamproductQT" method="POST">
                     <%--    <label type="text" class="color-input" placeholder="Màu sắc" name="mausac" value="<%=c.getMauSac() %>">
                        <label type="text" class="size-input" placeholder="Kích cỡ" name="size" value="<%= c.getKichCo() %>"> --%>
                        <input type="number" class="quantity-input" placeholder="Số lượng" name="soluong" value="<%=  c.getSoLuong() %>">
                        
                                        <input type="hidden" name="id" value="<%= c.getIdChiTietSanPham() %>">
                                        <button class="save" onclick="saveChanges(this) type="submit">Lưu</button>
                  
                        
                    </form>
                </div>
            </div>

            <!-- Các variant khác tương tự... -->
        </div>
        <%} } %>
        <%for(SanPham sanpham : sp){
			if(sanpham.getMaSanpham() == id){ %>
		<div class="product-price">
			<p>Giá: <%=sanpham.getGia() %></p>
		</div>
		<%} }%>
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
	</script>
</body>
</html>
