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
<title>Cửa hàng</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="assetsquantri/img/LOGOTHE5IVE.jpg" />
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
.icon-header-dropdown {
	position: relative;
	display: inline-block;
}

.stext-106 {
	font-size: 20px !important;
	/* hoặc giá trị to hơn như 20px, 24px tùy ý */
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
							<a href="#"
								class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
								onclick="toggleDropdown(event)"> <i class="fa fa-user"></i>
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
				<li>
					<div class="left-top-bar">Miễn phí giao hàng cho đơn từ
						500.000đ</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04"> Trợ giúp & FAQs
						</a> <a href="#" class="flex-c-m p-lr-10 trans-04"> Tài khoản của
							tôi </a> <a href="#" class="flex-c-m p-lr-10 trans-04"> VN </a> <a
							href="#" class="flex-c-m p-lr-10 trans-04"> USD </a>
					</div>
				</li>
			</ul>

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
						Tổng tiền: $<%=tongTien%></div>

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


	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
			<%
    List<DanhMuc> listDanhMuc = (List<DanhMuc>) request.getAttribute("listDanhMuc");
    String currentLoai = (String) request.getAttribute("currentLoai");
%>
<div class="flex-w flex-l-m filter-tope-group m-tb-10">
    <a href="Cuahang"
       class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 <%= (currentLoai == null || "".equals(currentLoai)) ? "how-active1" : "" %>">
        Tất cả
    </a>

    <%
        for (DanhMuc d : listDanhMuc) {
            String tenDM = d.getTenDanhMuc();
            String loaiParam = "";

            if ("Nữ".equalsIgnoreCase(tenDM)) {
                loaiParam = "Nữ";
            } else if ("Nam".equalsIgnoreCase(tenDM)) {
                loaiParam = "nam";
            } else if ("Túi".equalsIgnoreCase(tenDM)) {
                loaiParam = "Túi";
            } else if ("Giày".equalsIgnoreCase(tenDM)) {
                loaiParam = "Giày";
            }else{
            	loaiParam = d.getTenDanhMuc();
            }

            boolean isActive = loaiParam.equalsIgnoreCase(currentLoai);
    %>
    <a href="Cuahang?loai=<%=loaiParam%>"
       class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 <%= isActive ? "how-active1" : "" %>">
        <%= tenDM %>
    </a>
    <%
        }
    %>
</div>
			

				<div class="flex-w flex-c-m m-tb-10">
					<div
						class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i
							class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i
							class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Lọc
					</div>

					<div
						class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i
							class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Tìm kiếm
					</div>
				</div>

				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<form action="TImkiemsanphamtrongcuahang" method="post">
						<div class="bor8 dis-flex p-l-15">
							<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button>

							<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text"
								name="timKiem" placeholder="Tìm kiếm">
						</div>

					</form>

				</div>

				<!-- Filter -->
				<!-- Filter -->
				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div
						class="wrap-filter flex-w bg6 p-t-30 p-lr-30 ml-auto rounded-md w-full max-w-md"
						style="width: fit-content; gap: 40px;">

						<!-- LỌC GIÁ -->
						<div class="filter-col1col1 p-r-15 p-b-27 pl-4">
							<div class="mtext-102 cl2 p-b-15">Giá</div>
							<ul>
								<li class="p-b-6"><a
									href="Cuahang?loai=<%=request.getAttribute("currentLoai")%><%=request.getAttribute("currentMau") != null ? "&mau=" + request.getAttribute("currentMau") : ""%>"
									class="filter-link stext-106 trans-04 <%=request.getAttribute("currentGia") == null ? "filter-link-active" : ""%>">
										Tất cả </a></li>

								<%
								String[] giaList = {"0-50", "50-100", "100-150", "150-200", "200+"};
								for (String g : giaList) {
								%>
								<li class="p-b-6"><a
									href="Cuahang?loai=<%=request.getAttribute("currentLoai")%>&gia=<%=g%><%=request.getAttribute("currentMau") != null ? "&mau=" + request.getAttribute("currentMau") : ""%>"
									class="filter-link stext-106 trans-04 <%=g.equals(request.getAttribute("currentGia")) ? "filter-link-active" : ""%>">
										<%
										if ("200+".equals(g)) {
										%> 200.000đ+ <%
										} else {
										String[] parts = g.split("-");
										String from = parts[0] + ".000đ";
										String to = parts[1] + ".000đ";
										%> <%=from%> - <%=to%> <%
 }
 %>
								</a></li>
								<%
								}
								%>
							</ul>
						</div>

						<!-- LỌC MÀU -->
						<div class="filter-col2 p-r-15 p-b-27 pl-10"
							style="min-width: 130px;">
							<div class="mtext-102 cl2 p-b-15">Màu</div>
							<ul>
								<%
								String[] mauList = {"Đen", "Xanh", "Xám", "Xanh lá", "Đỏ", "Trắng"};
								String[] mauColor = {"#222", "#4272d7", "#b3b3b3", "#00ad5f", "#fa4251", "#aaa"};

								for (int i = 0; i < mauList.length; i++) {
									String m = mauList[i];
									String color = mauColor[i];
								%>
								<li class="p130px"><span class="fs-15 lh-12 m-r-6"
									style="color: <%=color%>;"> <i class="zmdi zmdi-circle"></i>
								</span> <a
									href="Cuahang?loai=<%=request.getAttribute("currentLoai")%><%=request.getAttribute("currentGia") != null ? "&gia=" + request.getAttribute("currentGia") : ""%>&mau=<%=m%>"
									class="filter-link stext-106 trans-04 <%=m.equals(request.getAttribute("currentMau")) ? "filter-link-active" : ""%>">
										<%=m%>
								</a></li>
								<%
								}
								%>
							</ul>
						</div>

					</div>
				</div>


			</div>

			<div class="row isotope-grid">
				<%
				List<SanPham> list = (List<SanPham>) request.getAttribute("listHome");

				for (SanPham sp : list) {
					String classDanhMuc = "";
					for (DanhMuc d : listDanhMuc) {
						if (sp.getMaDanhMuc() == d.getMaDanhmuc()) {
					classDanhMuc = d.getTenDanhMuc();
					break;
						}
					}
				%>
				<div
					class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item <%=classDanhMuc%>">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="<%=sp.getDuongDanAnh()%>" alt="IMG-PRODUCT"
								style="height: 300px;"> <a
								href="Giohangproducttail?id=<%=sp.getMaSanpham()%>"
								class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								Xem sản phẩm </a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="Giohangproducttail?id=<%=sp.getMaSanpham()%>"
									class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <%=sp.getTenSanPham()%>
								</a> <span class="stext-105 cl3"> <%=sp.getGia()%>đ
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

			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<a href="#"
					class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Xem thêm </a>
			</div>
		</div>
	</div>


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
				All rights reserved |Made with <i class="fa fa-heart-o"
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
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
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
		                text: "Vui lòng đăng nhập để thêm vào danh sách yêu thích.",
		                icon: "warning",
		                button: "OK"
		            }).then(() => {
		                window.location.href = "login.jsp"; // hoặc servlet "Dangnhap"
		            });
		            return;
		        }

		        swal(nameProduct, "Đã thêm vào danh sách yêu thích!", "success");

		        btn.addClass('js-addedwish-b2');
		        btn.off('click');
		    });
		});


		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
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

	<script>
    	const isUser = <%=user != null && user.get(0).getMaQuyen() == 3%>; // true nếu người dùng là khách
	</script>


</body>
</html>