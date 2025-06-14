<%@page import="model.User"%>
<%@page import="model.GioHang"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@page import="model.DanhMuc"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Trang chủ</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/jpeg"
	href="assetsquantri/img/LOGOTHE5IVE.png" />
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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+Vietnamese&display=swap"
	rel="stylesheet">
<!--===============================================================================================-->
<style>
.icon-header-dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-menu {
	display: none; /* Ẩn menu mặc định */
	position: absolute;
	top: 100%;
	right: 0; /* Đặt bên phải để tránh bị tràn bên trái */
	background-color: white;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
	padding: 8px 12px;
	z-index: 10;
	border-radius: 6px;
	width: 160px; /*Giảm chiều rộng để vừa với nội dung */
}

.dropdown-menu ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.dropdown-menu ul li {
	padding: 6px 0;
}

.dropdown-menu ul li a {
	text-decoration: none;
	color: #333;
	font-size: 14px;
	transition: color 0.2s;
	display: block;
}

/* Tuỳ chọn: hover nhẹ nhàng */
.dropdown-menu ul li a:hover {
	color: #007bff;
}

.icon-header-dropdown:hover .dropdown-menu {
	display: block; /* Hiển thị menu khi hover */
}

.icon-header-dropdown:hover .dropdown-menu {
	display: block;
}

body {
	font-family: 'Noto Sans Vietnamese', sans-serif;
}

/* Tùy chỉnh màu và kiểu chữ cho tiêu đề */
.custom-title {
	font-size: 1.5rem; /* Điều chỉnh kích thước chữ */
	font-weight: bold; /* Đặt chữ đậm */
	font-family: 'Material-Design-Iconic-Font';
	color: #8d8b98;
	text-align: center; /* Căn giữa */
	f margin-top: 20px; /* Thêm khoảng cách phía trên */
}

#more-products {
	display: none;
	flex-wrap: wrap;
	width: 100%;
	margin-top: 30px;
	margin-bottom: 200px; /* đẩy xa footer hơn */
	gap: 20px;
}

section.bg0 {
	overflow: visible;
	position: relative;
	padding-bottom: 280px; /* Tăng đủ để không bị footer đè */
}
</style>
</head>
<body class="animsition">

	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->

			<!-- 			 <div class="top-bar">
				
			 </div>

			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
					</div>
					
				</div>
			</div>
 -->
			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">

					<!-- Logo desktop -->
					<a href="Laydulieusanpham" class="logo"> <img
						src="assetsquantri/img/LOGOTHE5IVE-removebg.png" alt="IMG-LOGO">
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
							<%Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
List<GioHang> gh = lgn.LayHetThongTinGioHang();
HttpSession tk = request.getSession(false);
List<User> user = (List<User>) tk.getAttribute("Ghinhotaikhoan");
int soluong = 0;
float tongTien = 0;
boolean isUser = false; // Biến kiểm tra quyền người dùng

if (user != null) {
	for (GioHang gioHang : gh) {
		for (User u : user) {
			if (u.getMaTaiKhoan() == gioHang.getMaNguoiDung()) {
				soluong += gioHang.getSoLuong();
				tongTien += gioHang.getGia();
			}
		}
	}
	// Kiểm tra quyền của người dùng đầu tiên trong session
	if (user.get(0).getMaQuyen() == 3) {
		isUser = true;
	}
}%>
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
							data-notify="<%=soluong%>">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>


						<div class="icon-header-dropdown">
							<a href="#"
								class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
								onclick="toggleDropdown(event)"> <i class="fa fa-user"></i>
							</a>

							<!-- Thẻ con chứa thông tin cá nhân và đơn hàng -->
							<div class="dropdown-menu">
								<ul>
									<li><a href="Thongtincanhan.jsp">Thông tin cá nhân</a></li>
									<li><a href="Thongtindonhangdamua.jsp">Đơn hàng</a></li>
									<%
									if (user != null) {
									%>
									<li><a href="Dangxuat">Đăng xuất</a></li>
									<%
									} else {
									%>
									<li><a href="Dangxuat">Đăng nhập</a></li>
									<%
									}
									%>
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
				<a href="index.html"><img
					src="images/icons/LOGOTHE5IVE-removebg.png" alt="IMG-LOGO"></a>
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
					<a href="#"
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i
						class="fa fa-user"></i>
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
			<ul class="topbar-mobile">
				<!-- <li>
					<div class="left-top-bar">Miễn phí giao hàng cho đơn từ $100
					</div>
				</li> -->

				<!-- <li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04"> Trợ giúp & FAQs
						</a> <a href="#" class="flex-c-m p-lr-10 trans-04"> Tài khoản của
							tôi </a> <a href="#" class="flex-c-m p-lr-10 trans-04"> VN </a> <a
							href="#" class="flex-c-m p-lr-10 trans-04"> USD </a>
					</div>
				</li> -->
			</ul>

			<ul class="main-menu-m">
				<li><a href="Laydanhmucsanpham">Trang chủ</a> <span
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
							<a href="#" class="header-cart-item-name hov-cl1 trans-04"
								style="margin-bottom: 4px; display: inline-block;"> <%=giohang.getTenSanPham()%>
							</a>
							<div class="header-cart-item-info"
								style="font-size: 13px; color: #888;">
								Số lượng:
								<%=giohang.getSoLuong()%>
								&nbsp;-&nbsp; Tổng:
								<%=String.format("%.2f", giohang.getGia())%>
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
						<strong>Tổng tiền:</strong> <span style="font-weight: normal;"><%=tongTien%>đ</span>
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



	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1"
					style="background-image: url(images/slide-01.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2"> Women Collection
									2018 </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">NEW SEASON
								</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="zoomIn" data-delay="1600">
								<a href="Cuahang"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Mua ngay </a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1"
					style="background-image: url(images/slide-02.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2"> Men New-Season </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">Jackets &
									Coats</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="slideInUp" data-delay="1600">
								<a href="Cuahang"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Mua ngay </a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1"
					style="background-image: url(images/slide-03.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2"> Men Collection 2018
								</span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">New
									arrivals</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="rotateIn" data-delay="1600">
								<a href="Cuahang"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Mua ngay </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<div class="sec-banner bg0 p-t-80 p-b-50">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 p-b-30">
					<!-- Thẻ <a> bao cả khối để có thể click chuyển hướng -->
					<a href="Cuahang?loai=Nữ"
						class="d-flex align-items-center text-decoration-none"> <img
						src="images/icongirl.jpg" alt="IMG-BANNER"
						style="width: 60px; height: auto; margin-right: 15px;">
						<div>
							<div class="block1-name ltext-102 text-dark">Nữ</div>
							<!-- <div class="block1-info stext-102 text-secondary">2024</div> -->
							<div class="block1-info stext-102 text-secondary">Xu hướng
								mới</div>
						</div>
					</a>
				</div>
				<div class="col-lg-3 p-b-30">
					<!-- Thẻ <a> bao cả khối để có thể click chuyển hướng -->
					<a href="Cuahang?loai=nam"
						class="d-flex align-items-center text-decoration-none"> <!-- Ảnh bên trái -->
						<img src="images/iconboy.jpg" alt="IMG-BANNER"
						style="width: 60px; height: auto; margin-right: 15px;"> <!-- Text bên phải -->
						<div>
							<div class="block1-name ltext-102 text-dark">Nam</div>
							<!-- <div class="block1-info stext-102 text-secondary">2024</div> -->
							<div class="block1-info stext-102 text-secondary">Xu hướng
								mới</div>
						</div>
					</a>
				</div>
				<div class="col-6 col-lg-3 p-b-30">
					<a href="Cuahang?loai=giay"
						class="d-flex align-items-center text-decoration-none"> <!-- Ảnh bên trái -->
						<img src="images/iconshoe.jpg" alt="IMG-BANNER"
						style="width: 60px; height: auto; margin-right: 15px;"> <!-- Text bên phải -->
						<div>
							<div class="block1-name ltext-102 text-dark">Giày</div>
							<div class="block1-info stext-102 text-secondary">Xu hướng
								mới</div>
						</div>
					</a>
				</div>
				<div class="col-6 col-lg-3 p-b-30">
					<a href="Cuahang?loai=tui"
						class="d-flex align-items-center text-decoration-none"> <!-- Ảnh bên trái -->
						<img src="images/iconbag.jpg" alt="IMG-BANNER"
						style="width: 60px; height: auto; margin-right: 15px;"> <!-- Text bên phải -->
						<div>
							<div class="block1-name ltext-102 text-dark">Túi Xách</div>
							<div class="block1-info stext-102 text-secondary">Xu hướng
								mới</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Product -->
	<section class="bg0 p-t-23 p-b-140">
		<div class="container">
			<div class="p-b-10" style="margin-top: 20px; margin-bottom: 20px;">
				<p class="custom-title">Sản Phẩm Nổi Bật</p>
			</div>
			<div
				style="height: 2px; background-color: #ccc; margin-bottom: 20px;"></div>

			<div class="flex-w flex-sb-m p-b-52">
				<%-- <div class="flex-w flex-l-m filter-tope-group m-tb-10">
				
				<a href="Laydulieusanpham">
				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 " data-filter="*">
						Tất cả
					</button>
				</a>
					
					<%
					List<DanhMuc> listDanhMuc = (List<DanhMuc>) request.getAttribute("listDanhMuc");
					for(DanhMuc dm : listDanhMuc){
					%>
					<a href="Laydanhmucsanpham?id=<%= dm.getMaDanhmuc()%>">
					
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".women">
						<%=dm.getTenDanhMuc() %>
					</button>
					</a>
					<%} %>
<!-- 
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men">
						Nam
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bag">
						Túi
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".shoes">
						Giày
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".watches">
						Đồng hồ
					</button> -->
				</div>
 --%>
				<%
				List<DanhMuc> listDanhMuc = (List<DanhMuc>) request.getAttribute("listDanhMuc");
				
				%>
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button
						class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"
						data-filter="*">Tất cả</button>
					<%
					for (DanhMuc d : listDanhMuc) {
						if(!d.getDaXoa().equals("1")){
					%>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						data-filter=".<%=d.getTenDanhMuc()%>">
						<%=d.getTenDanhMuc()%>
					</button>
					<%
					}
					}
					%>
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div
						class="wrap-filter flex-w bg6 p-t-30 p-lr-30 ml-auto rounded-md w-full max-w-md"
						style="width: fit-content; gap: 40px;">
						<div class="filter-col1col1 p-r-15 p-b-27 pl-4">
							<div class="mtext-102 cl2 p-b-15">Giá</div>
							<ul>
								<li class="p-b-6"><a href="Cuahang?loai="
									class="filter-link stext-106 trans-04 filter-link-active">
										Tất cả </a></li>


								<li class="p-b-6"><a href="Cuahang?loai=&amp;gia=0-50"
									class="filter-link stext-106 trans-04 "> 0đ - 50.000đ </a></li>

								<li class="p-b-6"><a href="Cuahang?loai=&amp;gia=50-100"
									class="filter-link stext-106 trans-04 "> 50.000đ - 100.00đ

								</a></li>

								<li class="p-b-6"><a href="Cuahang?loai=&amp;gia=100-150"
									class="filter-link stext-106 trans-04 "> 100.000đ -
										150.000đ </a></li>

								<li class="p-b-6"><a href="Cuahang?loai=&amp;gia=150-200"
									class="filter-link stext-106 trans-04 "> 150.000đ -
										200.000đ </a></li>

								<li class="p-b-6"><a href="Cuahang?loai=&amp;gia=200+"
									class="filter-link stext-106 trans-04 "> 200.00đ+ </a></li>

							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27 pl-10"
							style="min-width: 220px;">
							<div class="mtext-102 cl2 p-b-15">Màu</div>
							<ul>
								<li class="p-b-6"><span
									class="fs-15 lh-12 m-r-6 inline-block" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
								</span> <a href="Cuahang?loai=&amp;mau=Đen"
									class="filter-link stext-106 trans-04 inline-block"> Đen </a></li>

								<li class="p-b-6"><span
									class="fs-15 lh-12 m-r-6 inline-block" style="color: #4272d7;">
										<i class="zmdi zmdi-circle"></i>
								</span> <a href="Cuahang?loai=&amp;mau=Xanh"
									class="filter-link stext-106 trans-04 inline-block"> Xanh </a>
								</li>

								<li class="p-b-6"><span
									class="fs-15 lh-12 m-r-6 inline-block" style="color: #b3b3b3;">
										<i class="zmdi zmdi-circle"></i>
								</span> <a href="Cuahang?loai=&amp;mau=Xám"
									class="filter-link stext-106 trans-04 inline-block"> Xám </a></li>

								<li class="p-b-6"><span
									class="fs-15 lh-12 m-r-6 inline-block" style="color: #00ad5f;">
										<i class="zmdi zmdi-circle"></i>
								</span> <a href="Cuahang?loai=&amp;mau=Xanh lá"
									class="filter-link stext-106 trans-04 inline-block"> Xanh
										lá </a></li>

								<li class="p-b-6"><span
									class="fs-15 lh-12 m-r-6 inline-block" style="color: #fa4251;">
										<i class="zmdi zmdi-circle"></i>
								</span> <a href="Cuahang?loai=&amp;mau=Đỏ"
									class="filter-link stext-106 trans-04 inline-block"> Đỏ </a></li>

								<li class="p-b-6"><span
									class="fs-15 lh-12 m-r-6 inline-block" style="color: #aaa;">
										<i class="zmdi zmdi-circle"></i>
								</span> <a href="Cuahang?loai=&amp;mau=Trắng"
									class="filter-link stext-106 trans-04 inline-block"> Trắng
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="row isotope-grid">
				<%
				List<SanPham> list = (List<SanPham>) request.getAttribute("listHome");
				for (SanPham sp : list) {
					String tenDanhMuc = "";
					for (DanhMuc d : listDanhMuc) {
						if (sp.getMaDanhMuc() == d.getMaDanhmuc()) {
					tenDanhMuc = d.getTenDanhMuc();
					break; // Thoát khỏi vòng for khi đã tìm đúng danh mục
						}
					}
				%>
				<div
					class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item <%=tenDanhMuc%>">
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="<%=sp.getDuongDanAnh()%>" alt="IMG-PRODUCT"
								style="height: 300px;"> <a
								href="Giohangproducttail?id=<%=sp.getMaSanpham()%>"
								class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								Xem sản phẩm </a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l">
								<a href="Giohangproducttail?id=<%=sp.getMaSanpham()%>"
									class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <%=sp.getTenSanPham()%>
								</a> <span class="stext-105 cl3"><%=sp.getGia()%>đ</span>
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
				%>
			</div>



			<div class="row isotope-grid" id="more-products"
				style="display: none;">
				<%
				List<SanPham> listMore = (List<SanPham>) request.getAttribute("listMore");
				for (SanPham sp : listMore) {
					String tenDanhMuc = "";
					for (DanhMuc d : listDanhMuc) {
						if (sp.getMaDanhMuc() == d.getMaDanhmuc()) {
					tenDanhMuc = d.getTenDanhMuc();
					break;
						}
					}
				%>
				<div
					class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item <%=tenDanhMuc%>">
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="<%=sp.getDuongDanAnh()%>" alt="IMG-PRODUCT"
								style="height: 300px;"> <a
								href="Giohangproducttail?id=<%=sp.getMaSanpham()%>"
								class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 ">
								Xem sản phẩm </a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="Giohangproducttail?id=<%=sp.getMaSanpham()%>"
									class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <%=sp.getTenSanPham()%>
								</a> <span class="stext-105 cl3"> <%=sp.getGia()%>
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
				%>
			</div>


		</div>
	</section>


	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<!-- LIÊN HỆ VỚI CHÚNG TÔI -->
				<div class="col-sm-6 col-lg-4 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						<strong>The 5ive</strong>
					</h4>
					<p class="stext-107 cl7 size-201">The 5ive là thương hiệu thời
						trang hiện đại, kết hợp sự tối giản và cá tính, đề cao tự do thể
						hiện bản thân. Với chúng tôi, thời trang là tuyên ngôn cá nhân.</p>
					<p class="stext-107 cl7 size-201 p-t-10">
						<em>"Define Your Style – Live The 5ive."</em>
					</p>

				</div>

				<!-- HỖ TRỢ KHÁCH HÀNG -->
				<div class="col-sm-6 col-lg-4 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						<strong>Hỗ trợ khách hàng</strong>
					</h4>
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
					<h4 class="stext-301 cl0 p-b-30">
						<strong>Theo dõi chúng tôi</strong>
					</h4>
					<div class="auth-external-list">
						<div class="row social-icons-custom">
							<div class="col-2 d-flex justify-content-right">
								<a href="#" class="social-icon"> <i class="fa fa-facebook"></i>
								</a>
							</div>
							<div class="col-2 d-flex justify-content-right">
								<a href="#" class="social-icon"> <i class="fa fa-instagram"></i>
								</a>
							</div>
							<div class="col-2 d-flex justify-content-right">
								<a href="#" class="social-icon"> <i
									class="fa fa-pinterest-p"></i>
								</a>
							</div>
							<div class="col-2 d-flex justify-content-right">
								<a href="#" class="social-icon"> <i class="fa fa-twitter"></i>
									<!-- Icon thêm nếu muốn đủ 4 -->
								</a>
							</div>
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
				<script>
						document.write(new Date().getFullYear());
					</script>
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
		$('.js-addwish-b2').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function () {
		    var nameProduct = $(this).closest('.block2').find('.js-name-b2').html();
		    var btn = $(this);

		    btn.on('click', function (e) {
		        e.preventDefault();

		        if (!isUser) {
		            swal({
		                title: "Bạn chưa đăng nhập",
		                text: "Vui lòng đăng nhập để thêm sản phẩm vào yêu thích.",
		                icon: "warning",
		                button: "OK" // ✅ chỉ hiện nút OK, không có Cancel
		            }).then(() => {
		                window.location.href = "login.jsp"; // ✅ chuyển hướng sau khi bấm OK
		            });
		            return;
		        }

		        swal(nameProduct, "Đã thêm vào danh sách yêu thích!", "success");

		        btn.addClass('js-addedwish-b2');
		        btn.off('click');
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
					$(this).on('click', function() {
						swal(nameProduct, "is added to cart !", "success");
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
		const isUser = <%=isUser%>; // truyền biến từ JSP sang JS
	</script>




</body>

</html>