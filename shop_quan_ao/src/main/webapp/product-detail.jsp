<%@page import="model.Danhgia"%>
<%@page import="model.DonHang"%>
<%@page import="model.User"%>
<%@page import="model.GioHang"%>
<%@page import="controller.Donhang"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@page import="model.ChiTietSanPham"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Product Detail</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/g" href="assetsquantri/img/LOGOTHE5IVE.jpg" />
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
/* Tạo một container flexbox cho nút */
.button-group {
	display: flex; /* Sử dụng flexbox để căn chỉnh */
	gap: 15px; /* Tạo khoảng cách đều giữa các nút */
	/* Khi màn hình nhỏ, các nút sẽ xuống dòng */
	justify-content: flex-start; /* Canh trái các nút */
}

/* Nút "Thêm vào giỏ hàng" */
.js-addcart-detail {
	background-color: #5978ad; 
	color: white;
	font-size: 16px;
	padding: 12px 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: auto;
}

.js-addcart-detail i {
	margin-right: 8px; /* Khoảng cách giữa biểu tượng và chữ */
	font-size: 20px; /* Kích thước biểu tượng */
}

/* Nút "Đặt hàng" */
.js-order {
	background-color: #5699e2; /* Màu xanh dương */
	color: white;
	font-size: 16px;
	padding: 12px 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: auto;
}

.js-order i {
	margin-right: 8px; /* Khoảng cách giữa biểu tượng và chữ */
	font-size: 20px; /* Kích thước biểu tượng */
}

/* Hiệu ứng hover */
.js-addcart-detail:hover {
	background-color: #9fa9b9; /* hover nut them vao gio hang */
	transition: background-color 0.3s ease;
}

.js-order:hover {
	background-color: #0056b3; /* Xanh dương đậm khi hover */
	transition: background-color 0.3s ease;
}

/* Responsive: Khi màn hình nhỏ hơn 768px, các nút sẽ tự động xuống dòng */
@media ( max-width : 768px) {
	.button-group {
		flex-direction: column; /* Xếp các nút theo chiều dọc */
		align-items: center; /* Canh giữa các nút */
	}
	.js-addcart-detail, .js-order {
		width: 100%; /* Chiếm toàn bộ chiều rộng của container */
		margin-bottom: 10px; /* Tạo khoảng cách giữa các nút */
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
					<a href="<%= request.getContextPath() %>/Laydulieusanpham" class="logo">
					    <img src="assetsquantri/img/LOGOTHE5IVE.jpg" alt="IMG-LOGO">
					</a>


					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li><a href="Laydulieusanpham">Trang chủ</a></li>

							<li><a href="Cuahang">Cửa hàng</a></li>

							<li class="label1" data-label1="hot"><a href="Giohang">Giỏ
									hàng</a></li>

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
							<%Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
							List<GioHang> gh = lgn.LayHetThongTinGioHang();
							HttpSession tk = request.getSession(false);
							List<User> user = (List<User>) tk.getAttribute("Ghinhotaikhoan");
							int soluong = 0;
							float tongTien = 0;
							if (user != null) {
								for (GioHang gioHang : gh) {
									for (User u : user)
										if (u.getMaTaiKhoan() == gioHang.getMaNguoiDung()) {
											soluong += gioHang.getSoLuong();
											tongTien += gioHang.getGia();
										}
								}
							}%>
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
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="index.html"><img src="images/icons/LOGOTHE5IVE-removebg.png"
					alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
					data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#"
					class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
					data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<!-- <ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">Free shipping for standard order
						over $100</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04"> Help & FAQs </a> <a
							href="#" class="flex-c-m p-lr-10 trans-04"> My Account </a> <a
							href="#" class="flex-c-m p-lr-10 trans-04"> EN </a> <a href="#"
							class="flex-c-m p-lr-10 trans-04"> USD </a>
					</div>
				</li>
			</ul> -->

			<ul class="main-menu-m">
				<li><a href="Laydulieusanpham">Trang chủ</a> <span
					class="arrow-main-menu-m"> <i class="fa fa-angle-right"
						aria-hidden="true"></i>
				</span></li>

				<li><a href="product.html">Shop</a></li>

				<li><a href="Giohang" class="label1 rs1" data-label1="hot">Giỏ
						hàng</a></li>

				<li><a href="about.html">About</a></li>

				<li><a href="contact.html">Contact</a></li>
			</ul>
		</div>

		
		<!-- Modal Search -->
		<div class="modal-search-header">
		  <div class="container-search-header">
		    <!-- Nút đóng -->
		    <button class="btn-hide-modal-search js-hide-modal-search">
		      <img src="images/icons/icon-close2.png" alt="CLOSE">
		    </button>
		
		    <!-- Ô tìm kiếm -->
		    <form class="wrap-search-header flex-w p-l-15">
		      <button class="flex-c-m trans-04">
		        <i class="zmdi zmdi-search"></i>
		      </button>
		      <input class="plh3" type="text" name="search" placeholder="Tìm kiếm...">
		    </form>
		  </div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> Giỏ hàng </span>

				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<%
					if (user != null) {
						for (GioHang giohang : gh) {
							for (User u : user) {
						if (u.getMaTaiKhoan() == giohang.getMaNguoiDung()) {
					%>
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="<%=giohang.getDuongDan()%>" alt="IMG">
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
					<%
					}
					}
					}
					}
					%>

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


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="Laydulieusanpham" class="stext-109 cl8 hov-cl1 trans-04">
				Trang chủ <i class="fa fa-angle-right m-l-9 m-r-10"
				aria-hidden="true"></i>
			</a> <a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
				Men <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> Lightweight Jacket </span>
		</div>
	</div>


	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<%
	int id = (int) request.getAttribute("idSanPham");
	List<SanPham> listSP = (List<SanPham>) request.getAttribute("listSanPham");
	List<ChiTietSanPham> listCTSP = (List<ChiTietSanPham>) request.getAttribute("listChiTietSanPham");
	HttpSession s = request.getSession(false);
	String loi = (String) s.getAttribute("loiTonTai");
	System.out.println("Giá trị loiTonTai: " + s.getAttribute("loiTonTai"));
	String loiDanhGia = (String) s.getAttribute("Loidanhgia");
	if (loi != null && !loi.isEmpty()) {
		session.removeAttribute("loiTonTai");
			%>
				<script>
					setTimeout(function() {
					    swal("Sản phẩm đã hết hàng", "Xin lỗi, sản phẩm hiện không còn trong kho.", "error");
					}, 300);
				</script>

				<%
					}
					if(loiDanhGia != null && !loiDanhGia.isEmpty()){ 
						s.removeAttribute("Loidanhgia");
				%>
				<script>
					setTimeout(function () {
						swal("Không thể đánh giá", "Bạn chỉ được phép đánh giá khi đã mua sản phẩm.", "warning");
					}, 300); // hoặc tăng lên 500 nếu cần delay hơn nữa
				</script>

				<%
					}
%>

				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<%
								for (SanPham sp : listSP) {
									if (sp.getMaSanpham() == id) {
								%>

								<div class="item-slick3" data-thumb="<%=sp.getDuongDanAnh()%>">
									<div class="wrap-pic-w pos-relative">
										<img src="<%=sp.getDuongDanAnh()%>" alt="IMG-PRODUCT"> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="<%=sp.getDuongDanAnh()%>"> <i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">

					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							<%=sp.getTenSanPham()%>
						</h4>

						<span class="mtext-106 cl2"> <%=sp.getGia()%>đ
						</span>

						<p class="stext-102 cl3 p-t-23" style="display:none;">
							<%=sp.getMoTa()%>
						</p>
						<%
						}
						}
						%>
						<!--  -->


						<div class="p-t-33">
							<form action="Giohangsanpham" method="post">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Kích cỡ</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="kichThuoc">
												<option>Chọn kích cỡ</option>
												<option>S</option>
												<option>M</option>
												<option>L</option>
												<option>XL</option>
												<option>XXL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Màu sắc</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="mauSac">
												<option>Chọn màu sắc</option>
												<%
												for (ChiTietSanPham c : listCTSP) {
													if (c.getMaSanPham() == id) {
												%>
												<option><%=c.getMauSac()%></option>
												<%
												}
												}
												%>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="soLuong" value="1">

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>
										<input type="hidden" name="idSanPham" value="<%=id%>">

										<div class="button-group" d-flex>
											<!-- Nút "Thêm vào giỏ hàng" với logo -->
											<button
												class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail "
												name="gioHang" value="gioHang">
												<i class="zmdi zmdi-shopping-cart"></i> Thêm vào giỏ hàng
											</button>

											<!-- Nút "Đặt hàng" với logo -->

											<button
												class="flex-c-m stext-101 cl0 size-101 bg2 bor1 hov-btn2 p-lr-15 trans-04 js-order"
												name="datHang" value="datHang">
												<i class="zmdi zmdi-check-circle"></i> Đặt hàng
											</button>


										</div>
									</div>
								</div>
							</form>
						</div>
						
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
						<div class="flex-m bor9 p-r-10 m-r-11">
							<a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
								data-tooltip="Add to Wishlist"> <i
								class="zmdi zmdi-favorite"></i>
							</a>
						</div>

						<a href="#"
							class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
							data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
						</a> <a href="#"
							class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
							data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
						</a> <a href="#"
							class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
							data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
						</a>
					</div>

					</div>

					<!--  -->
					
				</div>
			</div>
		</div>

		<div class="bor10 m-t-50 p-t-43 p-b-40">
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10"><a class="nav-link active" data-toggle="tab" href="#description" role="tab" style="font-size: 18px; font-weight: 500;">Mô tả</a></li>

					<li class="nav-item p-b-10"> <a class="nav-link" data-toggle="tab" href="#information" role="tab" style="font-size: 18px; font-weight: 500;">Thông tin chi tiết</a></li>
							
							<%
							Laydulieuchonguoidung lgnn = new Laydulieuchonguoidung();
							List<Danhgia> dh = lgnn.LayThongTinDanhGia();
							int soLuonDanhGia = 0;
							for(Danhgia danhGia : dh){
								if(danhGia.getMaSanPham()==id){
						soLuonDanhGia += 1;
								}}
							%>
					<li class="nav-item p-b-10"><a class="nav-link" data-toggle="tab" href="#reviews" role="tab" style="font-size: 18px; font-weight: 500;">Đánh giá (<%=soLuonDanhGia %>)</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content p-t-43">
					<!-- - -->
					<div class="tab-pane fade show active" id="description"
						role="tabpanel">
						<div class="how-pos2 p-lr-15-md">
						  <p class="stext-102 cl6" style="font-size:18px; font-weight:500;">
						    Thời trang năng động này được thiết kế dành cho những ai yêu thích phong cách thời trang trẻ trung và tiện lợi. 
						    Chất liệu nỉ cao cấp, mềm mại và thoáng khí mang đến cảm giác thoải mái suốt cả ngày, bất kể thời tiết se lạnh 
						    hay những buổi sáng sớm. Form dáng oversize hiện đại giúp bạn dễ dàng kết hợp với quần jeans, jogger hoặc chân váy, 
						    tạo nên phong cách cá tính mà không kém phần lịch sự. Đặc biệt, chiếc mũ rộng và túi trước tiện dụng là điểm nhấn 
						    hoàn hảo, vừa mang tính thẩm mỹ vừa đáp ứng nhu cầu thực tế. Với bảng màu đa dạng từ trung tính đến nổi bật, chiếc áo 
						    hoodie này chắc chắn sẽ là món đồ không thể thiếu trong tủ quần áo của bạn!
						  </p>
						</div>

					</div>

					<!-- - -->
					<div class="tab-pane fade" id="information" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 mx-auto">
								<ul class="p-lr-28 p-lr-15-sm">
								  <li class="flex-w flex-t p-b-7 justify-content-between">
								    <span class="stext-102 cl3 size-205 text-right" style="font-size:18px; font-weight:500;">Cân nặng</span>
								    <span class="stext-102 cl6 size-206 text-center" style="font-size:18px; font-weight:500;">0.79 kg</span>
								  </li>
								  <li class="flex-w flex-t p-b-7 justify-content-between">
								    <span class="stext-102 cl3 size-205 text-right" style="font-size:18px; font-weight:500;">Chiều cao</span>
								    <span class="stext-102 cl6 size-206 text-center" style="font-size:18px; font-weight:500;">110 x 33 x 100 cm</span>
								  </li>
								  <li class="flex-w flex-t p-b-7 justify-content-between">
								    <span class="stext-102 cl3 size-205 text-right" style="font-size:18px; font-weight:500;">Chất liệu</span>
								    <span class="stext-102 cl6 size-206 text-center" style="font-size:18px; font-weight:500;">60% cotton</span>
								  </li>
								  <li class="flex-w flex-t p-b-7 justify-content-between">
								    <span class="stext-102 cl3 size-205 text-right" style="font-size:18px; font-weight:500;">Màu sắc</span>
								    <span class="stext-102 cl6 size-206 text-center" style="font-size:18px; font-weight:500;">Black, Blue, Grey, Green, Red, White</span>
								  </li>
								  <li class="flex-w flex-t p-b-7 justify-content-between">
								    <span class="stext-102 cl3 size-205 text-right" style="font-size:18px; font-weight:500;">Kích cỡ</span>
								    <span class="stext-102 cl6 size-206 text-center" style="font-size:18px; font-weight:500;">XXL, XL, L, M, S</span>
								  </li>
								</ul>

							</div>
						</div>
					</div>

					<!-- - -->
					<div class="tab-pane fade" id="reviews" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<div class="p-b-30 m-lr-15-sm">
									<!-- Review -->
									<%
									
									for(Danhgia dhh : dh){
										if(dhh.getMaSanPham()==id){
											int i = 0;
									%>
									<div class="flex-w flex-t p-b-68">
										<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
											<img src="images/meoconcute.jpg" alt="AVATAR">
										</div>
										<div class="size-207">
										<span class="mtext-107 cl2 p-r-20"> <%=dhh.getNgayDang() %> </span>
											<div class="d-flex justify-content-between align-items-center p-b-17 ">
												<span class="mtext-107 cl2 p-r-20"> <%=dhh.getTenNguoiDung() %> </span>
												 <span
													class="fs-18 cl11">
													<%
													while(i < dhh.getSoSao()){ 
													%>
													 <i class="zmdi zmdi-star"></i> 
													 <%
													 i = i+1;} 
													 %>
												</span>
											</div>
											
											<p class="stext-102 cl6"><%=dhh.getNoiDung() %></p>
										</div>
										<!-- Phản hồi của quản trị viên -->
									 <%
									 if(dhh.getNoiDungPhanHoi() != null && dhh.getMaNguoiDung()==user.get(0).getMaTaiKhoan()){
									 %>
										<div class="admin-response mt-4">
											<h5 class="cl2">
												Admin phản hồi
												<%=dhh.getTenNguoiDung()%></h5>
											<div class="d-flex align-items-center">
												<!-- Hình ảnh của quản trị viên -->
												<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
													<img src="images/admin-avatar.jpg" alt="Admin Avatar">
												</div>
												<!-- Nội dung phản hồi -->
												<p class="stext-102 cl6">
													<%=dhh.getNoiDungPhanHoi()%>
												</p>
											</div>
										</div>
										<%
										}
										%>
									</div>

									<%
									}
									}
									%>
									<!-- Add review -->
									<form class="w-full" action="Danhgiasanpham">
										<h5 class="mtext-108 cl2 p-b-7">Thêm đánh giá</h5>
										<input value="<%=id%>" name="idSanPham" type="hidden">
										<p class="stext-102 cl6">Vui lòng hãy đánh giá sản phẩm này một cách khách quan nhất*</p>

										<select name="soSao" id="number" class="star-select">
										  <option value="0" class="star-option">★</option>
										  <option value="1" class="star-option">★ 1</option>
										  <option value="2" class="star-option">★ 2</option>
										  <option value="3" class="star-option">★ 3</option>
										  <option value="4" class="star-option">★ 4</option>
										  <option value="5" class="star-option">★ 5</option>
										</select>


										<div class="row p-b-25">
											<div class="col-12 p-b-5">
												<label class="stext-102 cl3" for="review">Nội dung</label>
												<textarea
													class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
													id="review" name="noiDungDanhGia"></textarea>
											</div>


										</div>

										<button
											class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
											Đánh giá</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25"> Phong cách </span> <span
				class="stext-107 cl6 p-lr-25"> Đột phá </span>
		</div>
	</section>


	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">Sản phẩm tương tự</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
					<%
					for (SanPham sp : listSP) {
						if (sp.getMaSanpham() != id) {
					%>
					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="<%=sp.getDuongDanAnh()%>" alt="IMG-PRODUCT"
									style="height: 300px;"> <a
									href="Giohangproducttail?id=<%=sp.getMaSanpham()%>"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 ">
									Xem nhanh </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="Giohangproducttail?id=<%=sp.getMaSanpham()%>"
										class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <%=sp.getTenSanPham()%>
									</a> <span class="stext-105 cl3"> $<%=sp.getGia()%>
									</span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#"
										class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04"
										src="images/icons/icon-heart-01.png" alt="ICON"> <img
										class="icon-heart2 dis-block trans-04 ab-t-l"
										src="images/icons/icon-heart-02.png" alt="ICON">
									</a>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					}
					%>











				</div>
			</div>
		</div>
	</section>


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
					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved |Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
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
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							'.js-name-b2').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-b2');
						$(this).off('click');
					});
				});

		$('.js-addwish-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.js-name-detail').html();

					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-detail');
						$(this).off('click');
					});
				});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-detail').html();
					$(this).on(
							'click',
							function() {
								swal(nameProduct,
										"Thêm vào giỏ hàng thành công !",
										"success");
							});
				});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
		<script>
  // Mở modal khi click icon tìm kiếm
  document.querySelectorAll('.js-show-modal-search').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelector('.modal-search-header').classList.add('show-modal-search');
    });
  });

  // Đóng modal khi click nút ×
  document.querySelectorAll('.js-hide-modal-search').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelector('.modal-search-header').classList.remove('show-modal-search');
    });
  });

  // Đóng modal khi click ra ngoài vùng trắng
  document.querySelector('.modal-search-header').addEventListener('click', function (e) {
    if (e.target === this) {
      this.classList.remove('show-modal-search');
    }
  });
</script>
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
     
     <script>
		document.addEventListener("DOMContentLoaded", function () {
		    const form = document.querySelector('form[action="Giohangsanpham"]');
		
		    const btnGioHang = document.querySelector('button[name="gioHang"]');
		    const btnDatHang = document.querySelector('button[name="datHang"]');
		
		    // Xử lý khi form submit (bằng bất kỳ nút nào)
		    form.addEventListener("submit", function (e) {
		        const kichThuoc = document.querySelector('select[name="kichThuoc"]').value.trim();
		        const mauSac = document.querySelector('select[name="mauSac"]').value.trim();
		
		        if (kichThuoc === "Chọn kích cỡ" || mauSac === "Chọn màu sắc") {
		            e.preventDefault(); // Ngăn không gửi form
		
		            // Hiển thị hộp thoại cảnh báo thay cho alert
		            swal("Thiếu thông tin!", "Vui lòng chọn kích thước và màu sắc.", "warning");
		
		            // Đánh dấu đỏ dropdown chưa chọn
		            if (kichThuoc === "Chọn kích cỡ") {
		                document.querySelector('select[name="kichThuoc"]').style.border = "2px solid red";
		            }
		            if (mauSac === "Chọn màu sắc") {
		                document.querySelector('select[name="mauSac"]').style.border = "2px solid red";
		            }
		        }
		    });
		
		    // Reset viền đỏ khi người dùng thay đổi lựa chọn
		    document.querySelector('select[name="kichThuoc"]').addEventListener("change", function () {
		        this.style.border = "";
		    });
		
		    document.querySelector('select[name="mauSac"]').addEventListener("change", function () {
		        this.style.border = "";
		    });
		});
		</script>

     
     
     
</body>
</html>