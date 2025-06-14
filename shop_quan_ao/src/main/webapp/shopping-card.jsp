<%@page import="model.User"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@page import="model.GioHang"%>
<%@page import="model.ChiTietSanPham"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Giỏ hàng</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="assetsquantri/img/LOGOTHE5IVE.jpg" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<style>
/* Reset các kiểu mặc định */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	color: #333;
}

.cart-container {
	width: 80%;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: auto;
	background-color: #fff;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
}

.cart-item {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 15px;
	border-bottom: 1px solid #eee;
	margin-bottom: 15px;
}

.product-image {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 8px;
}

.product-info {
	flex: 1;
	padding: 0 20px;
}

.product-name {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

.product-price {
	color: #f56c6c;
	font-size: 16px;
	margin-bottom: 5px;
}

.product-color {
	color: #888;
	font-size: 14px;
	margin-bottom: 10px;
}

.quantity-control {
	display: flex;
	align-items: center;
	gap: 10px;
}

.quantity {
	width: 50px;
	text-align: center;
	padding: 5px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.btn-minus, .btn-plus {
	background-color: #eee;
	border: 1px solid #ccc;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

.btn-minus:hover, .btn-plus:hover {
	background-color: #ddd;
}

.btn-remove {
	font-size: 14px;
  padding: 6px 14px;
  border-radius: 6px;
  background-color: #ff4d4d;
  color: white;
  border: none;
  cursor: pointer;
  width: auto;
  height: 36px;
  line-height: 1;
}

button.btn-remove:hover {
  background-color: #e04343;
}

.cart-total {
	text-align: right;
	margin-top: 20px;
	font-size: 18px;
	font-weight: bold;
}

.btn-checkout {
	width: 100%;
	padding: 12px;
	background-color: #28a745;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	margin-top: 20px;
}

.btn-checkout:hover {
	background-color: #218838;
}

/* Media Queries cho Responsive */
@media ( max-width : 768px) {
	.cart-container {
		width: 95%;
		margin: 20px auto;
		padding: 15px;
	}
	.cart-item {
		flex-direction: column;
		align-items: flex-start;
	}
	.product-image {
		width: 80px;
		height: 80px;
	}
	.product-info {
		padding: 0 10px;
	}
	.quantity-control {
		gap: 5px;
	}
	.btn-remove {
		width: 100%;
		margin-top: 10px;
	}
}

@media ( max-width : 480px) {
	h2 {
		font-size: 24px;
	}
	.product-name {
		font-size: 16px;
	}
	.product-price {
		font-size: 14px;
	}
	.btn-minus, .btn-plus {
		padding: 4px 8px;
	}
	.quantity {
		width: 40px;
	}
	.btn-checkout {
		padding: 10px;
		font-size: 16px;
	}
	.cart-total {
		font-size: 16px;
	}
}
.icon-header-dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-menu {
    display: none; /* Ẩn menu mặc định */
    position: absolute;
    top: 100%;
    left: 0;
    background-color: white;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    padding: 10px 20px;
    z-index: 10;
    border-radius: 5px;
}

.dropdown-menu ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

.dropdown-menu ul li {
    padding: 8px 0;
}

.dropdown-menu ul li a {
    text-decoration: none;
    color: #333;
    font-size: 14px;
}

.icon-header-dropdown:hover .dropdown-menu {
    display: block; /* Hiển thị menu khi hover */
}
</style>
</head>
<body class="animsition">

	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<!-- <div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
					</div>

					
				</div>
			</div> -->

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">

					<!-- Logo desktop -->
					<a href="Laydulieusanpham" class="logo">
						 <img src="assetsquantri/img/LOGOTHE5IVE-removebg.png"
						alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu"><a href="Laydulieusanpham">Trang
									chủ</a></li>

							<li><a href="Cuahang">Cửa hàng</a></li>

							<li class="label1" data-label1="hot"><a href="Giohang">Giỏ
									hàng</a></li>
									
							<li><a href="blog.html">Blog</a></li>

							<li><a href="about.jsp">Giới thiệu</a></li>

							<li><a href="contact.jsp">Liên hệ</a></li>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div
						<%
						Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
							List<GioHang> gh = lgn.LayHetThongTinGioHang();
							HttpSession tk = request.getSession(false);
							List<User> user = (List<User>) tk.getAttribute("Ghinhotaikhoan");
							int soluong = 0;
							float tongTien = 0;
							if(user != null){
							for(GioHang gioHang:gh){
								for(User u : user)
									if(u.getMaTaiKhoan()==gioHang.getMaNguoiDung()){
								soluong += gioHang.getSoLuong();
								tongTien += gioHang.getGia();
									}
							}
							}
						%>
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
							data-notify="<%=soluong%>">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<div class="icon-header-dropdown">
							<a href="#"
								class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
								<i class="fa fa-user"></i>
							</a>

							<!-- Thẻ con chứa thông tin cá nhân và đơn hàng -->
							<div class="dropdown-menu">
								<ul>
									<li><a href="Thongtincanhan.jsp">Thông tin cá nhân</a></li>
									<li><a href="Thongtindonhangdamua.jsp">Đơn hàng</a></li>
									<li><a href="Dangxuat">Đăng xuất</a></li>
								</ul>
							</div>
						</div>
					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="index.html"><img src="images/icons/aaaaaaaaaaaaaaaaaaaaa.jpg"
					alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m">
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<%
				tongTien = 0;
				if (user != null) {
					for (GioHang gioHang : gh) {
						for (User u : user)
					if (u.getMaTaiKhoan() == gioHang.getMaNguoiDung()) {
						soluong += gioHang.getSoLuong();
						tongTien += gioHang.getGia();
					}
					}

				}
				%>
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
					data-notify="<%=soluong%>">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>


				<div class="icon-header-dropdown">
					<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="toggleDropdown(event)">
							    <i class="fa fa-user"></i>
							</a>

					<!-- Thẻ con chứa thông tin cá nhân và đơn hàng -->
					<div class="dropdown-menu">
						<ul>
							<li><a href="Thongtincanhan.jsp">Thông tin cá nhân</a></li>
							<li><a href="Thongtindonhangdamua.jsp">Đơn hàng</a></li>
							<li><a href="Dangxuat">Đăng xuất</a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">

			<ul class="main-menu-m">
				<li><a href="Laydulieusanpham">Trang chủ</a> <span
					class="arrow-main-menu-m"> <i class="fa fa-angle-right"
						aria-hidden="true"></i>
				</span></li>

				<li><a href="Cuahang">Cửa hàng</a></li>

				<li><a href="Giohang" class="label1 rs1" data-label1="hot">Giỏ
						hàng</a></li>

				<li><a href="about.jsp">Giới thiệu</a></li>

				<li><a href="contact.jsp">Liên hệ</a></li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div
			class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button
					class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search"
						placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart" >
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> Giỏ hàng </span>

				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart" >
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
				<%
				if(user != null){
				for(GioHang giohang : gh){
					for(User u : user){
					if(u.getMaTaiKhoan()==giohang.getMaNguoiDung()){	
					
				%>
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="<%=giohang.getDuongDan() %>" alt="IMG">
						</div>
						<div class="header-cart-item-txt" style="padding-top: 4px;">
							<a href="#" class="header-cart-item-name hov-cl1 trans-04" style="margin-bottom: 4px; display: inline-block;">
								<%= giohang.getTenSanPham() %>
							</a>
							<div class="header-cart-item-info" style="font-size: 13px; color: #888;">
								Số lượng: <%= giohang.getSoLuong() %> &nbsp;-&nbsp; Tổng: <%= String.format("%.2f", giohang.getGia()) %>
							</div>
						</div>
					</li>
					<%}} }}%>
					
				</ul>

				<div class="w-full">
<div class="header-cart-total w-full p-tb-40">
  <strong>Tổng tiền:</strong> 
  <span style="font-weight: normal;"><%= tongTien %>đ</span>
</div>
					<div class="header-cart-buttons flex-w w-full">
						<a href="Giohang"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							Xem giỏ hàng </a> <a href="Giohang"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Kiểm tra </a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Shoping Cart -->
	<div class="cart-container" style="marigin-top: 0px">
		<%
		String loi = (String) request.getAttribute("loi");
		if (loi != null) {
		%>
		<script>
	alert("Xóa không thành công");
	</script>
		<%
		}
		%>
		<%
		List<GioHang> gioHang = (List<GioHang>) request.getAttribute("gioHang");
		float tongGia = 0;
		for (GioHang g : gioHang) {
			tongGia += g.getGia();
		%>

		<div class="cart-item" id="product1" style="marigin-top: -70px">
			<img src="<%=g.getDuongDan()%>" alt="Sản phẩm 1"
				class="product-image">
			<div class="product-info">
				<h3 class="product-name"><%=g.getTenSanPham()%></h3>
				<p class="product-price" data-price="<%=g.getGia()%>"><%=g.getGia()%></p>
				<p class="product-color">
					Màu:
					<%=g.getMauSac()%></p>
				<p class="product-color">
					Kích cỡ:
					<%=g.getKichThuoc()%></p>
				<div class="quantity-control">
					<input type="number" class="quantity" id="quantity-product1"
						value="<%=g.getSoLuong()%>" min="1" onchange="updateTotal()">

				</div>
			</div>
			<form action="Xoasanphamtrongdonhang" method="post">
				<input hidden="text" value="<%=g.getMaGioHang()%>" name="idGioHang">
				<button class="btn-remove" onclick="removeItem()">Xóa</button>
			</form>

		</div>
		<%
		}
		%>

		<div class="cart-total">
			<p>
				Tổng cộng:
				<%=tongGia%></p>
		</div>
		
	<form action="ThanhToanGioHang" method="post">
 	   <button class="btn-checkout" type="submit">Thanh toán</button>
	</form>

	</div>




	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
    <!-- LIÊN HỆ VỚI CHÚNG TÔI -->
    <div class="col-sm-6 col-lg-4 p-b-50">
    <h4 class="stext-301 cl0 p-b-30"><strong>The 5ive</strong></h4>
        <p class="stext-107 cl7 size-201">
          The 5ive là thương hiệu thời trang hiện đại, kết hợp sự tối giản và cá tính, đề cao tự do thể hiện bản thân. Với chúng tôi, thời trang là tuyên ngôn cá nhân.
        </p><p class="stext-107 cl7 size-201 p-t-10">
        <em>"Define Your Style – Live The 5ive."</em>
    </p>
        
    </div>

<!-- HỖ TRỢ KHÁCH HÀNG -->
<div class="col-sm-6 col-lg-4 p-b-50">
    <h4 class="stext-301 cl0 p-b-30"><strong>Hỗ trợ khách hàng</strong></h4>
    <p class="stext-107 cl7 size-201">
        <strong>Tổng đài chăm sóc khách hàng:</strong>
    </p>
    <p class="stext-107 cl7 size-201">
        <strong>Thời trang/Nhận hàng:</strong> 1800 6789
    </p>
    <p class="stext-107 cl7 size-201">
        <strong>Đổi trả/Bảo hành:</strong> 1800 1234
    </p>
    <p class="stext-107 cl7 size-201">
        <strong>Email CSKH:</strong> support@the5ive.vn
    </p>
</div>


    <!-- THEO DÕI CHÚNG TÔI -->
    <div class="col-sm-6 col-lg-4 p-b-50">
    <h4 class="stext-301 cl0 p-b-30"><strong>Theo dõi chúng tôi</strong></h4>
         <div class="auth-external-list">
        <div class="row social-icons-custom">
            <div class="col-2 d-flex justify-content-right">
                <a href="#" class="social-icon">
                    <i class="fa fa-facebook"></i>
                </a>
            </div>
            <div class="col-2 d-flex justify-content-right">
                <a href="#" class="social-icon">
                    <i class="fa fa-instagram"></i>
                </a>
            </div>
            <div class="col-2 d-flex justify-content-right">
                <a href="#" class="social-icon">
                    <i class="fa fa-pinterest-p"></i>
                </a>
            </div>
            <div class="col-2 d-flex justify-content-right">
                <a href="#" class="social-icon">
                    <i class="fa fa-twitter"></i> <!-- Icon thêm nếu muốn đủ 4 -->
                </a>
            </div>
        </div>
    </div>
</div>

    </div>
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1"> <img
						src="images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a> <a href="#" class="m-all-1"> <img
						src="images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a> <a href="#" class="m-all-1"> <img
						src="images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a> <a href="#" class="m-all-1"> <img
						src="images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a> <a href="#" class="m-all-1"> <img
						src="images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>document.write(new Date().getFullYear());</script>
					All rights reserved | Made with <i class="fa fa-heart-o"
						aria-hidden="true"></i> by <a href="https://colorlib.com"
						target="_blank">Colorlib</a> &amp; distributed by <a
						href="https://themewagon.com" target="_blank">ThemeWagon</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
		 // Hàm cập nhật số lượng
		 function updateQuantity(productId, change) {
            const quantityInput = document.querySelector(`#quantity-${productId}`);
            let quantity = parseInt(quantityInput.value);
            quantity += change;
            if (quantity < 1) quantity = 1; // Số lượng không thể nhỏ hơn 1
            quantityInput.value = quantity;
            updateTotal();
        }

        // Hàm tính tổng giá
        function updateTotal() {
            let total = 0;
            const productItems = document.querySelectorAll('.cart-item');
            productItems.forEach(item => {
                const priceElement = item.querySelector('.product-price');
                const price = parseFloat(priceElement.getAttribute('data-price'));
                const quantity = parseInt(item.querySelector('.quantity').value);
                total += price * quantity;
            });

            document.querySelector('#total-price').textContent = `Tổng cộng: ${total.toLocaleString()} VND`;
        }

        // Hàm xóa sản phẩm khỏi giỏ
        function removeItem() {
        	if (confirm("Bạn câu chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?")) {
        	    // Nếu người dùng nhấn "OK"
        	    console.log("Đã xóa sản phẩm!");
        	} else {
        	    // Nếu người dùng nhấn "Cancel"
        	    console.log("Hủy thao tác xóa.");
        	}
        }

        // Khởi tạo tổng giá trị khi tải trang
        updateTotal();
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	
		<script>
	// điều hướng icon hợp lý
	// Hàm để mở và đóng dropdown
	function toggleDropdown(event) {
	    event.preventDefault();  // Ngừng hành động mặc định của <a> (tránh điều hướng)
	
	    // Lấy thẻ dropdown
	    const dropdownMenu = document.querySelector('.dropdown-menu');
	    
	    // Chuyển đổi việc hiển thị menu dropdown (hiển thị/ẩn)
	    dropdownMenu.classList.toggle('show');  // Tạo class 'show' để hiển thị dropdown
	}
	
	// Hàm để đóng dropdown khi click ra ngoài
	function closeDropdown(event) {
	    const dropdownMenu = document.querySelector('.dropdown-menu');
	    
	    // Kiểm tra nếu click ra ngoài dropdown (và không click vào icon user)
	    if (!dropdownMenu.contains(event.target) && !event.target.closest('.icon-header-item')) {
	        dropdownMenu.classList.remove('show');  // Ẩn dropdown
	    }
	}
	
	// Lắng nghe sự kiện click toàn trang
	document.addEventListener('click', closeDropdown);

    </script>
    
</body>
</html>